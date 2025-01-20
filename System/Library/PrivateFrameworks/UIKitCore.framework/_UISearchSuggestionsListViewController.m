@interface _UISearchSuggestionsListViewController
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (UICollectionViewDiffableDataSource)dataSource;
- (UISearchController)searchController;
- (_UISearchSuggestionsListViewController)initWithCoder:(id)a3;
- (_UISearchSuggestionsListViewController)initWithSearchController:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDataSource:(id)a3;
- (void)updateList;
- (void)viewDidLoad;
@end

@implementation _UISearchSuggestionsListViewController

- (_UISearchSuggestionsListViewController)initWithSearchController:(id)a3
{
  id v4 = a3;
  v5 = [[UICollectionLayoutListConfiguration alloc] initWithAppearance:1];
  v6 = +[UICollectionViewCompositionalLayout layoutWithListConfiguration:v5];
  v23.receiver = self;
  v23.super_class = (Class)_UISearchSuggestionsListViewController;
  v7 = [(UICollectionViewController *)&v23 initWithCollectionViewLayout:v6];

  if (v7)
  {
    objc_storeWeak((id *)&v7->_searchController, v4);
    [(UICollectionViewController *)v7 setInstallsStandardGestureForInteractiveMovement:0];
    objc_initWeak(&location, v7);
    uint64_t v8 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke;
    v20[3] = &unk_1E530D030;
    objc_copyWeak(&v21, &location);
    v9 = +[UICollectionViewCellRegistration registrationWithCellClass:v8 configurationHandler:v20];
    v10 = [UICollectionViewDiffableDataSource alloc];
    v11 = [(UICollectionViewController *)v7 collectionView];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke_29;
    v18[3] = &unk_1E530D058;
    id v12 = v9;
    id v19 = v12;
    uint64_t v13 = [(UICollectionViewDiffableDataSource *)v10 initWithCollectionView:v11 cellProvider:v18];
    dataSource = v7->_dataSource;
    v7->_dataSource = (UICollectionViewDiffableDataSource *)v13;

    v15 = v7->_dataSource;
    v16 = [(UICollectionViewController *)v7 collectionView];
    [v16 setDataSource:v15];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (_UISearchSuggestionsListViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchSuggestionsListViewController;
  v5 = [(UICollectionViewController *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"SearchControllerForSearchSuggestionsList"];
    objc_storeWeak((id *)&v5->_searchController, v6);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UISearchSuggestionsListViewController;
  id v4 = a3;
  [(UICollectionViewController *)&v6 encodeWithCoder:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
  objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, @"SearchControllerForSearchSuggestionsList", v6.receiver, v6.super_class);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_UISearchSuggestionsListViewController;
  [(UIViewController *)&v3 viewDidLoad];
  [(_UISearchSuggestionsListViewController *)self updateList];
}

- (void)updateList
{
  v27[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  uint64_t v4 = [v3 numberOfSections];
  v5 = [(_UISearchSuggestionsListViewController *)self searchController];
  objc_super v6 = objc_msgSend(v5, "_dci_searchSuggestions");

  uint64_t v7 = [v6 count];
  unint64_t v8 = v7;
  if ((unint64_t)v4 >= 2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v24 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Unexpected number of sections in snapshot for search suggestions list. Resetting", buf, 2u);
      }
    }
    else
    {
      objc_super v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateList___s_category) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Unexpected number of sections in snapshot for search suggestions list. Resetting", buf, 2u);
      }
    }
    if (v4 >= 2)
    {
      [v3 deleteAllItems];
      if (!v8)
      {
        dataSource = self->_dataSource;
        goto LABEL_34;
      }
    }
    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = v7 == 0;
    if (!(v4 | v7)) {
      goto LABEL_35;
    }
  }
  if (![v3 numberOfSections])
  {
    v27[0] = @"_UISearchSuggestionsList";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v3 appendSectionsWithIdentifiers:v10];
  }
  uint64_t v11 = [v3 numberOfItemsInSection:@"_UISearchSuggestionsList"];
  if (v11 >= 1 || !v9)
  {
    uint64_t v13 = v11;
    unint64_t v14 = v11 & ~(v11 >> 63);
    if (v14 >= v8) {
      uint64_t v15 = v8;
    }
    else {
      uint64_t v15 = v11 & ~(v11 >> 63);
    }
    if (v15)
    {
      v25 = v6;
      v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
      for (uint64_t i = 0; i != v15; ++i)
      {
        v18 = [NSNumber numberWithUnsignedInteger:i];
        [v16 addObject:v18];
      }
      [v3 reconfigureItemsWithIdentifiers:v16];

      objc_super v6 = v25;
    }
    if (v14 >= v8)
    {
      if (v8 >= v14) {
        goto LABEL_25;
      }
      id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v14 - v8];
      do
      {
        id v21 = [NSNumber numberWithUnsignedInteger:v8];
        [v19 addObject:v21];

        ++v8;
      }
      while (v14 != v8);
      [v3 deleteItemsWithIdentifiers:v19];
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8 - v14];
      do
      {
        v20 = [NSNumber numberWithUnsignedInteger:v14];
        [v19 addObject:v20];

        ++v14;
      }
      while (v8 != v14);
      [v3 appendItemsWithIdentifiers:v19];
    }

LABEL_25:
    dataSource = self->_dataSource;
    if (v13 > 0)
    {
      [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v3 animatingDifferences:1];
      goto LABEL_35;
    }
LABEL_34:
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshotUsingReloadData:v3];
  }
LABEL_35:
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UICollectionViewController *)self collectionView];

  if (v8 == v7)
  {
    unint64_t v10 = [v6 row];
    uint64_t v11 = [(_UISearchSuggestionsListViewController *)self searchController];
    id v12 = objc_msgSend(v11, "_dci_searchSuggestions");
    BOOL v9 = v10 < [v12 count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(_UISearchSuggestionsListViewController *)self searchController];
  id v6 = objc_msgSend(v9, "_dci_searchSuggestions");
  uint64_t v7 = [v5 row];

  id v8 = [v6 objectAtIndexedSubscript:v7];
  [v9 _searchBarTextFieldDidSelectSearchSuggestion:v8];
}

- (UISearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
  return (UISearchController *)WeakRetained;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

@end