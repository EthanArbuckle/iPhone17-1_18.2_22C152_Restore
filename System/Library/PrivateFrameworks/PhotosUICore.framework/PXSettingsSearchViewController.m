@interface PXSettingsSearchViewController
- (NSArray)searchResults;
- (NSProgress)indexingProgress;
- (PTUISettingsController)settingsController;
- (PXInfoUpdater)resultsInfoUpdater;
- (PXSettingsIndex)index;
- (PXSettingsIndexer)indexer;
- (PXSettingsSearchViewController)initWithCoder:(id)a3;
- (PXSettingsSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXSettingsSearchViewController)initWithSettingsController:(id)a3;
- (PXSettingsSearchViewController)initWithStyle:(int64_t)a3;
- (UISearchBar)searchBar;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)priorityForInfoRequestOfKind:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleCancelItem:(id)a3;
- (void)_indexerDidComplete;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setIndex:(id)a3;
- (void)setIndexer:(id)a3;
- (void)setIndexingProgress:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXSettingsSearchViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_resultsInfoUpdater, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_indexingProgress, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (PXInfoUpdater)resultsInfoUpdater
{
  return self->_resultsInfoUpdater;
}

- (PXSettingsIndex)index
{
  return self->_index;
}

- (void)setIndexingProgress:(id)a3
{
}

- (NSProgress)indexingProgress
{
  return self->_indexingProgress;
}

- (void)setIndexer:(id)a3
{
}

- (PXSettingsIndexer)indexer
{
  return self->_indexer;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (PTUISettingsController)settingsController
{
  return self->_settingsController;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5 = [(PXSettingsSearchViewController *)self resultsInfoUpdater];
  v4 = [v5 info];
  [(PXSettingsSearchViewController *)self setSearchResults:v4];
}

- (int64_t)priorityForInfoRequestOfKind:(id)a3
{
  v3 = [(PXSettingsSearchViewController *)self searchBar];
  v4 = [v3 text];
  if ([v4 length]) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = 100;
  }

  return v5;
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v5 = a4;
  v6 = [(PXSettingsSearchViewController *)self searchBar];
  v7 = [v6 text];

  v8 = [(PXSettingsSearchViewController *)self index];
  if (v8 && [v7 length])
  {
    v9 = [(PXSettingsSearchViewController *)self searchBar];
    v10 = [v9 text];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PXSettingsSearchViewController_requestInfoOfKind_withResultHandler___block_invoke;
    v13[3] = &unk_1E5DB9408;
    id v14 = v5;
    v11 = [v8 searchForText:v10 resultHandler:v13];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, MEMORY[0x1E4F1CBF0]);
    v11 = 0;
  }

  return v11;
}

uint64_t __70__PXSettingsSearchViewController_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXSettingsSearchViewController *)self indexingProgress];

  if (v8)
  {
    v9 = 0;
    v10 = @"Indexing…";
  }
  else
  {
    v11 = [(PXSettingsSearchViewController *)self searchResults];
    v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    v10 = [v12 title];
    v9 = [v12 subtitle];
  }
  v13 = [v6 dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
  if (!v13) {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"cellReuseIdentifier"];
  }
  BOOL v14 = v8 == 0;
  v15 = [v13 textLabel];
  [v15 setText:v10];

  v16 = [v13 detailTextLabel];
  [v16 setText:v9];

  [v13 setUserInteractionEnabled:v14];
  v17 = [v13 textLabel];
  [v17 setEnabled:v14];

  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(PXSettingsSearchViewController *)self indexingProgress];

  if (v5) {
    return 1;
  }
  id v7 = [(PXSettingsSearchViewController *)self searchResults];
  int64_t v8 = [v7 count];

  return v8;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(PXSettingsSearchViewController *)self searchBar];
  [v3 resignFirstResponder];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(PXSettingsSearchViewController *)self view];
  v9 = [v8 window];

  v10 = [v9 snapshotViewAfterScreenUpdates:0];
  [v9 addSubview:v10];
  [(PXSettingsSearchViewController *)self dismissViewControllerAnimated:0 completion:0];
  [v7 deselectRowAtIndexPath:v6 animated:0];

  v11 = [(PXSettingsSearchViewController *)self searchResults];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  BOOL v14 = [(PXSettingsSearchViewController *)self settingsController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__PXSettingsSearchViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_1E5DD36F8;
  id v17 = v10;
  id v15 = v10;
  [v13 revealInSettingsController:v14 withCompletionHandler:v16];
}

uint64_t __68__PXSettingsSearchViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  [a3 resignFirstResponder];
  [(PXSettingsSearchViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4 = [(PXSettingsSearchViewController *)self resultsInfoUpdater];
  [v4 invalidateInfo];
}

- (void)_handleCancelItem:(id)a3
{
  id v4 = [(PXSettingsSearchViewController *)self searchBar];
  [(PXSettingsSearchViewController *)self searchBarCancelButtonClicked:v4];
}

- (void)setSearchResults:(id)a3
{
  v9 = (NSArray *)a3;
  id v4 = self->_searchResults;
  id v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSArray *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    id v7 = (NSArray *)[(NSArray *)v9 copy];
    searchResults = self->_searchResults;
    self->_searchResults = v7;

    id v5 = [(PXSettingsSearchViewController *)self tableView];
    [v5 reloadData];
  }

LABEL_5:
}

- (void)setIndex:(id)a3
{
  id v5 = (PXSettingsIndex *)a3;
  if (self->_index != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_index, a3);
    char v6 = [(PXSettingsSearchViewController *)self resultsInfoUpdater];
    [v6 invalidateInfo];

    id v5 = v7;
  }
}

- (void)_indexerDidComplete
{
  [(PXSettingsSearchViewController *)self setIndexingProgress:0];
  id v3 = [(PXSettingsSearchViewController *)self indexer];
  id v4 = [v3 index];
  [(PXSettingsSearchViewController *)self setIndex:v4];

  id v5 = [(PXSettingsSearchViewController *)self tableView];
  [v5 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSettingsSearchViewController;
  [(PXSettingsSearchViewController *)&v5 viewWillAppear:a3];
  id v4 = [(PXSettingsSearchViewController *)self searchBar];
  [v4 becomeFirstResponder];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PXSettingsSearchViewController;
  [(PXSettingsSearchViewController *)&v16 viewDidLoad];
  id v3 = (UISearchBar *)objc_alloc_init(MEMORY[0x1E4FB1BF0]);
  searchBar = self->_searchBar;
  self->_searchBar = v3;

  [(UISearchBar *)self->_searchBar setDelegate:self];
  [(UISearchBar *)self->_searchBar setShowsCancelButton:0];
  objc_super v5 = [(PXSettingsSearchViewController *)self navigationItem];
  char v6 = [(PXSettingsSearchViewController *)self searchBar];
  [v5 setTitleView:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelItem_];
  [v5 setRightBarButtonItem:v7];

  objc_initWeak(&location, self);
  indexer = self->_indexer;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __45__PXSettingsSearchViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E5DD32D0;
  objc_copyWeak(&v14, &location);
  v9 = [(PXSettingsIndexer *)indexer startIndexingWithCompletionHandler:&v10];
  -[PXSettingsSearchViewController setIndexingProgress:](self, "setIndexingProgress:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __45__PXSettingsSearchViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _indexerDidComplete];
}

- (PXSettingsSearchViewController)initWithSettingsController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXSettingsSearchViewController;
  char v6 = [(PXSettingsSearchViewController *)&v15 initWithStyle:1];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settingsController, a3);
    int64_t v8 = [PXSettingsIndexer alloc];
    v9 = [v5 rootSettings];
    uint64_t v10 = [(PXSettingsIndexer *)v8 initWithRootSettings:v9];
    indexer = v7->_indexer;
    v7->_indexer = (PXSettingsIndexer *)v10;

    uint64_t v12 = [[PXInfoUpdater alloc] initWithInfoProvider:v7 infoKind:@"PXSettingsSearchResultsInfoKind"];
    resultsInfoUpdater = v7->_resultsInfoUpdater;
    v7->_resultsInfoUpdater = v12;

    [(PXInfoUpdater *)v7->_resultsInfoUpdater setObserver:v7];
  }

  return v7;
}

- (PXSettingsSearchViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsSearchViewController.m", 52, @"%s is not available as initializer", "-[PXSettingsSearchViewController initWithCoder:]");

  abort();
}

- (PXSettingsSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsSearchViewController.m", 48, @"%s is not available as initializer", "-[PXSettingsSearchViewController initWithNibName:bundle:]");

  abort();
}

- (PXSettingsSearchViewController)initWithStyle:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsSearchViewController.m", 44, @"%s is not available as initializer", "-[PXSettingsSearchViewController initWithStyle:]");

  abort();
}

@end