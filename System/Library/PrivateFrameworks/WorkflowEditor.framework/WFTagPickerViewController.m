@interface WFTagPickerViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSize;
- (NSArray)tags;
- (NSMutableOrderedSet)selectedTags;
- (UISearchController)searchController;
- (WFTagPickerViewController)initWithTitle:(id)a3 tags:(id)a4;
- (WFTagPickerViewControllerDelegate)delegate;
- (id)currentResults;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel;
- (void)dismiss;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFTagPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_selectedTags, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (NSMutableOrderedSet)selectedTags
{
  return self->_selectedTags;
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setDelegate:(id)a3
{
}

- (WFTagPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTagPickerViewControllerDelegate *)WeakRetained;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v3 = [(WFTagPickerViewController *)self tableView];
  [v3 reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFTagPickerViewController *)self currentResults];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  v10 = [(WFTagPickerViewController *)self selectedTags];
  int v11 = [v10 containsObject:v9];

  v12 = [(WFTagPickerViewController *)self selectedTags];
  v13 = v12;
  if (v11) {
    [v12 removeObject:v9];
  }
  else {
    [v12 addObject:v9];
  }

  [v7 deselectRowAtIndexPath:v6 animated:1];
  v15[0] = v6;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v7 reloadRowsAtIndexPaths:v14 withRowAnimation:100];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"TagCell" forIndexPath:v6];
  v8 = [(WFTagPickerViewController *)self currentResults];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  int v11 = [v7 textLabel];
  [v11 setText:v10];

  v12 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v12];

  v13 = [(WFTagPickerViewController *)self selectedTags];
  if ([v13 containsObject:v10]) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 0;
  }
  [v7 setAccessoryType:v14];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(WFTagPickerViewController *)self currentResults];
  int64_t v5 = [v4 count];

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)currentResults
{
  id v3 = [(WFTagPickerViewController *)self searchController];
  if ([v3 isActive])
  {
    v4 = [(WFTagPickerViewController *)self searchController];
    int64_t v5 = [v4 searchBar];
    id v6 = [v5 text];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = [(WFTagPickerViewController *)self searchController];
      uint64_t v9 = [v8 searchBar];
      v10 = [v9 text];
      int v11 = [v10 lowercaseString];

      v12 = [(WFTagPickerViewController *)self tags];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __43__WFTagPickerViewController_currentResults__block_invoke;
      v16[3] = &unk_264BFD0F0;
      id v17 = v11;
      id v13 = v11;
      uint64_t v14 = objc_msgSend(v12, "if_compactMap:", v16);

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v14 = [(WFTagPickerViewController *)self tags];
LABEL_6:
  return v14;
}

id __43__WFTagPickerViewController_currentResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 lowercaseString];
  if ([v4 containsString:*(void *)(a1 + 32)]) {
    int64_t v5 = v3;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)dismiss
{
  id v5 = [(WFTagPickerViewController *)self delegate];
  id v3 = [(WFTagPickerViewController *)self selectedTags];
  v4 = [v3 array];
  [v5 tagPicker:self didSelectTags:v4];
}

- (void)cancel
{
  id v3 = [(WFTagPickerViewController *)self delegate];
  [v3 tagPickerDidCancel:self];
}

- (CGSize)preferredContentSize
{
  v2 = [(WFTagPickerViewController *)self tableView];
  [v2 contentSize];
  double v4 = v3;

  double v5 = 320.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)WFTagPickerViewController;
  [(WFTagPickerViewController *)&v16 viewDidLoad];
  double v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
  double v4 = [(WFTagPickerViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  double v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss];
  double v6 = [(WFTagPickerViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  uint64_t v7 = [MEMORY[0x263F825C8] whiteColor];
  v8 = [(WFTagPickerViewController *)self view];
  [v8 setBackgroundColor:v7];
  uint64_t v9 = [(WFTagPickerViewController *)self tableView];
  [v9 setBackgroundColor:v7];

  v10 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  int v11 = [(WFTagPickerViewController *)self tableView];
  [v11 setTableFooterView:v10];

  v12 = [(WFTagPickerViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"TagCell"];

  id v13 = [(WFTagPickerViewController *)self searchController];
  uint64_t v14 = [v13 searchBar];
  v15 = [(WFTagPickerViewController *)self tableView];
  [v15 setTableHeaderView:v14];

  [(WFTagPickerViewController *)self setDefinesPresentationContext:1];
}

- (WFTagPickerViewController)initWithTitle:(id)a3 tags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFTagPickerViewController;
  v8 = [(WFTagPickerViewController *)&v17 initWithStyle:0];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    tags = v8->_tags;
    v8->_tags = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    selectedTags = v8->_selectedTags;
    v8->_selectedTags = (NSMutableOrderedSet *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
    searchController = v8->_searchController;
    v8->_searchController = (UISearchController *)v13;

    [(UISearchController *)v8->_searchController setSearchResultsUpdater:v8];
    [(UISearchController *)v8->_searchController setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)v8->_searchController setHidesNavigationBarDuringPresentation:0];
    [(WFTagPickerViewController *)v8 setTitle:v6];
    v15 = v8;
  }

  return v8;
}

@end