@interface SUIKSearchResultsCollectionViewController
- (BOOL)queryFoundItems;
- (SUIKSearchResultsCollectionViewController)init;
- (SUIKSearchResultsCollectionViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (_SUIKSearchResultsUpdateOperation)updateOperation;
- (double)iconWidth;
- (unint64_t)totalSearchResults;
- (void)_selectAndScrollToIndexPath:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchQueryCompleted;
- (void)searchQueryFoundItems:(id)a3;
- (void)searchQueryStarted;
- (void)searchQueryTextChanged;
- (void)selectNextSearchResult;
- (void)selectPreviousSearchResult;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setQueryFoundItems:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setUpdateOperation:(id)a3;
- (void)showSelectedSearchResult;
- (void)viewDidLoad;
@end

@implementation SUIKSearchResultsCollectionViewController

- (SUIKSearchResultsCollectionViewController)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42870]) initWithSectionProvider:&__block_literal_global_30];
  v4 = [(SUIKSearchResultsCollectionViewController *)self initWithCollectionViewLayout:v3];

  return v4;
}

id __49__SUIKSearchResultsCollectionViewController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = reuseIdentifier_block_invoke_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&reuseIdentifier_block_invoke_onceToken, &__block_literal_global_24_1);
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:0];
  v6 = +[PSListController appearance];
  v7 = [v6 foregroundColor];
  [v5 setBackgroundColor:v7];

  [v5 setHeaderMode:0];
  v8 = [MEMORY[0x1E4F42630] sectionWithListConfiguration:v5 layoutEnvironment:v4];
  v9 = (void *)MEMORY[0x1E4F42638];
  v10 = [MEMORY[0x1E4F42608] estimatedDimension:*(double *)&reuseIdentifier_block_invoke_iconSize_0];
  v11 = [MEMORY[0x1E4F42608] estimatedDimension:*(double *)&reuseIdentifier_block_invoke_iconSize_1];
  v12 = [v9 sizeWithWidthDimension:v10 heightDimension:v11];

  v13 = (void *)MEMORY[0x1E4F425F8];
  v14 = SUIKCategoryHeaderKind;
  [(id)reuseIdentifier_block_invoke_cellConfig directionalLayoutMargins];
  double v16 = v15;
  v17 = [v4 container];

  [v17 contentInsets];
  v19 = objc_msgSend(v13, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v12, v14, 2, v16 + v18, 0.0);

  [v19 setPinToVisibleBounds:1];
  [v19 setExtendsBoundary:0];
  [v19 setZIndex:1000];
  v22[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v8 setBoundarySupplementaryItems:v20];

  return v8;
}

uint64_t __49__SUIKSearchResultsCollectionViewController_init__block_invoke_2()
{
  v0 = PSBlankIconImage();
  [v0 size];
  reuseIdentifier_block_invoke_iconSize_0 = v1;
  reuseIdentifier_block_invoke_iconSize_1 = v2;

  uint64_t v3 = [MEMORY[0x1E4F42B58] subtitleCellConfiguration];
  uint64_t v4 = reuseIdentifier_block_invoke_cellConfig;
  reuseIdentifier_block_invoke_cellConfig = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)SUIKSearchResultsCollectionViewController;
  [(SUIKSearchResultsCollectionViewController *)&v22 viewDidLoad];
  uint64_t v3 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  [v3 setKeyboardDismissMode:1];

  uint64_t v4 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v5 = objc_opt_class();
  v6 = +[SUIKSearchResultCollectionViewListCell reuseIdentifier];
  [v4 registerClass:v5 forCellWithReuseIdentifier:v6];

  v7 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  v9 = SUIKCategoryHeaderKind;
  v10 = +[SUIKSearchResultCollectionViewSectionHeader reuseIdentifier];
  [v7 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v10];

  v11 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  [v11 setAlwaysBounceVertical:1];

  v12 = +[PSListController appearance];
  v13 = [v12 foregroundColor];
  v14 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  [v14 setBackgroundColor:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F42880]);
  double v16 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  v17 = (void *)[v15 initWithCollectionView:v16 cellProvider:&__block_literal_global_38_1];
  [(SUIKSearchResultsCollectionViewController *)self setDiffableDataSource:v17];

  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v20, &location);
  double v18 = [(SUIKSearchResultsCollectionViewController *)self diffableDataSource];
  [v18 setSupplementaryViewProvider:&v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

id __56__SUIKSearchResultsCollectionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  v9 = +[SUIKSearchResultCollectionViewListCell reuseIdentifier];
  v10 = [v8 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  [v10 configureWithSearchableItem:v6];
  return v10;
}

id __56__SUIKSearchResultsCollectionViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v8 isEqualToString:SUIKCategoryHeaderKind])
  {
    v11 = SUIKCategoryHeaderKind;
    v12 = +[SUIKSearchResultCollectionViewSectionHeader reuseIdentifier];
    v13 = [v7 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:v12 forIndexPath:v9];

    v14 = [WeakRetained diffableDataSource];
    id v15 = [v14 snapshot];
    double v16 = [v15 sectionIdentifiers];
    v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));

    double v18 = [WeakRetained delegate];
    uint64_t v19 = [v18 searchResultsCollectionViewController:WeakRetained iconForCategory:v17];

    [v13 setCategoryImage:v19];
  }
  else
  {
    id v20 = PKLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      objc_super v22 = NSStringFromClass(v21);
      int v26 = 138543874;
      v27 = v22;
      __int16 v28 = 2114;
      id v29 = v9;
      __int16 v30 = 2114;
      id v31 = v8;
      _os_log_impl(&dword_1A6597000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Element kind for indexpath '%{public}@' is '%{public}@'.", (uint8_t *)&v26, 0x20u);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F42850]);
    v13 = objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v24 = [MEMORY[0x1E4F428B8] clearColor];
    [v13 setBackgroundColor:v24];
  }
  return v13;
}

- (double)iconWidth
{
  if (iconWidth_onceToken != -1) {
    dispatch_once(&iconWidth_onceToken, &__block_literal_global_43_2);
  }
  return *(double *)&iconWidth_iconWidth;
}

void __54__SUIKSearchResultsCollectionViewController_iconWidth__block_invoke()
{
  PSBlankIconImage();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 size];
  *(double *)&iconWidth_iconWidth = v0 + 15.0;
}

- (unint64_t)totalSearchResults
{
  uint64_t v3 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  do
  {
    id v7 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
    v6 += [v7 numberOfItemsInSection:v5] + 1;

    ++v5;
    id v8 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
    uint64_t v9 = [v8 numberOfSections];
  }
  while (v9 > v5);
  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [(SUIKSearchResultsCollectionViewController *)self diffableDataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    v10 = [v8 uniqueIdentifier];
    v11 = [v9 URLWithString:v10];

    v12 = [(SUIKSearchResultsCollectionViewController *)self delegate];
    [v12 searchResultsCollectionViewController:self didSelectURL:v11];

    v13 = [(SUIKSearchResultsCollectionViewController *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      if ([v6 section] < 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        do
        {
          v17 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
          v16 += [v17 numberOfItemsInSection:v15];

          ++v15;
        }
        while (v15 < [v6 section]);
      }
      uint64_t v18 = [v6 item] + v16;
      uint64_t v19 = [(SUIKSearchResultsCollectionViewController *)self delegate];
      [v19 searchResultsCollectionViewController:self didSelectItem:v8 atIndex:v18];
    }
  }
  [v20 deselectItemAtIndexPath:v6 animated:0];
}

- (void)setResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUIKSearchResultsCollectionViewController *)self updateOperation];
  [v5 cancel];

  [(SUIKSearchResultsCollectionViewController *)self setUpdateOperation:0];
  id v6 = [_SUIKSearchResultsUpdateOperation alloc];
  id v7 = [(SUIKSearchResultsCollectionViewController *)self diffableDataSource];
  id v8 = [(SUIKSearchResultsCollectionViewController *)self delegate];
  uint64_t v9 = [(_SUIKSearchResultsUpdateOperation *)v6 initWithResults:v4 diffableDataSource:v7 delegate:v8];
  [(SUIKSearchResultsCollectionViewController *)self setUpdateOperation:v9];

  v10 = [(SUIKSearchResultsCollectionViewController *)self updateOperation];
  [v10 start];

  uint64_t v11 = [v4 count];
  if (v11)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__SUIKSearchResultsCollectionViewController_setResults___block_invoke;
    v12[3] = &unk_1E5C5D680;
    v12[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], v12);
    objc_destroyWeak(&location);
  }
}

void __56__SUIKSearchResultsCollectionViewController_setResults___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) collectionView];
  if ([v5 numberOfSections])
  {
    uint64_t v2 = [*(id *)(a1 + 32) collectionView];
    uint64_t v3 = [v2 numberOfItemsInSection:0];

    if (!v3) {
      return;
    }
    id v5 = [*(id *)(a1 + 32) collectionView];
    id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    [v5 scrollToItemAtIndexPath:v4 atScrollPosition:1 animated:1];
  }
}

- (void)searchQueryStarted
{
  id v3 = [MEMORY[0x1E4F1C978] array];
  [(SUIKSearchResultsCollectionViewController *)self setResults:v3];
}

- (void)searchQueryTextChanged
{
}

- (void)searchQueryFoundItems:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(SUIKSearchResultsCollectionViewController *)self setQueryFoundItems:1];
  }
  id v5 = [(SUIKSearchResultsCollectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __67__SUIKSearchResultsCollectionViewController_searchQueryFoundItems___block_invoke;
    uint64_t v11 = &unk_1E5C60260;
    objc_copyWeak(&v12, &location);
    id v7 = objc_msgSend(v4, "na_filter:", &v8);
    -[SUIKSearchResultsCollectionViewController setResults:](self, "setResults:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SUIKSearchResultsCollectionViewController *)self setResults:v4];
  }
}

uint64_t __67__SUIKSearchResultsCollectionViewController_searchQueryFoundItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained delegate];
  char v6 = SUIKCategoryFromSearchableItem(v3);

  uint64_t v7 = [v5 searchResultsCollectionViewController:WeakRetained shouldShowCategory:v6];
  return v7;
}

- (void)searchQueryCompleted
{
  if (![(SUIKSearchResultsCollectionViewController *)self queryFoundItems])
  {
    id v3 = [MEMORY[0x1E4F1C978] array];
    [(SUIKSearchResultsCollectionViewController *)self setResults:v3];
  }
}

- (void)selectNextSearchResult
{
  id v3 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (!v4) {
    return;
  }
  id v5 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  char v6 = [v5 indexPathsForSelectedItems];
  id v17 = [v6 firstObject];

  if (!v17)
  {
    id v12 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [v17 item];
  uint64_t v8 = [v17 section];
  uint64_t v9 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v10 = [v9 numberOfItemsInSection:v8] - 1;

  if (v7 < v10)
  {
    uint64_t v11 = v7 + 1;
    id v12 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v13 = v8;
LABEL_9:
    uint64_t v16 = [v12 indexPathForItem:v11 inSection:v13];
    [(SUIKSearchResultsCollectionViewController *)self _selectAndScrollToIndexPath:v16];

    goto LABEL_10;
  }
  char v14 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v15 = [v14 numberOfSections] - 1;

  if (v8 < v15)
  {
    uint64_t v13 = v8 + 1;
    id v12 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = 0;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)selectPreviousSearchResult
{
  id v3 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (!v4) {
    return;
  }
  id v5 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  char v6 = [v5 indexPathsForSelectedItems];
  id v17 = [v6 firstObject];

  uint64_t v7 = v17;
  if (v17)
  {
    uint64_t v8 = [v17 item];
    uint64_t v9 = [v17 section];
    uint64_t v10 = v9;
    uint64_t v11 = v8 - 1;
    if (v8 >= 1)
    {
      id v12 = (void *)MEMORY[0x1E4F28D58];
LABEL_8:
      uint64_t v16 = [v12 indexPathForItem:v11 inSection:v10];
      [(SUIKSearchResultsCollectionViewController *)self _selectAndScrollToIndexPath:v16];

      uint64_t v7 = v17;
      goto LABEL_9;
    }
    uint64_t v13 = v9 - 1;
    uint64_t v7 = v17;
    if (v10 >= 1)
    {
      char v14 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
      uint64_t v15 = [v14 numberOfItemsInSection:v13] - 1;

      id v12 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v11 = v15;
      uint64_t v10 = v13;
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)showSelectedSearchResult
{
  id v3 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  uint64_t v4 = [v3 indexPathsForSelectedItems];
  id v6 = [v4 firstObject];

  if (v6)
  {
    id v5 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
    [(SUIKSearchResultsCollectionViewController *)self collectionView:v5 didSelectItemAtIndexPath:v6];

    [(SUIKSearchResultsCollectionViewController *)self _selectAndScrollToIndexPath:v6];
  }
}

- (void)_selectAndScrollToIndexPath:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
  id v5 = [v4 indexPathsForVisibleItems];

  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 compare:v14];

  if (v7 == 1)
  {
    uint64_t v8 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
    uint64_t v9 = v8;
    id v10 = v14;
    uint64_t v11 = 1;
  }
  else
  {
    id v12 = [v5 lastObject];
    uint64_t v13 = [v12 compare:v14];

    uint64_t v8 = [(SUIKSearchResultsCollectionViewController *)self collectionView];
    uint64_t v9 = v8;
    id v10 = v14;
    if (v13 == -1) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  [v8 selectItemAtIndexPath:v10 animated:1 scrollPosition:v11];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SUIKSearchResultsCollectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SUIKSearchResultsCollectionViewController *)self delegate];
    [v6 searchResultsCollectionViewController:self didScrollResultsInScrollView:v7];
  }
}

- (SUIKSearchResultsCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUIKSearchResultsCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (_SUIKSearchResultsUpdateOperation)updateOperation
{
  return self->_updateOperation;
}

- (void)setUpdateOperation:(id)a3
{
}

- (BOOL)queryFoundItems
{
  return self->_queryFoundItems;
}

- (void)setQueryFoundItems:(BOOL)a3
{
  self->_queryFoundItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end