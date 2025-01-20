@interface WFMapSearchTableViewController
- (NSArray)mapItems;
- (WFMapSearchTableViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setMapItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFMapSearchTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMapItems:(id)a3
{
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setDelegate:(id)a3
{
}

- (WFMapSearchTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFMapSearchTableViewControllerDelegate *)WeakRetained;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  v4 = [a3 searchBar];
  v5 = [v4 text];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F10928]);
    [v6 setNaturalLanguageQuery:v5];
    v7 = (void *)[objc_alloc(MEMORY[0x263F10910]) initWithRequest:v6];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__WFMapSearchTableViewController_updateSearchResultsForSearchController___block_invoke;
    v8[3] = &unk_2649CAF48;
    v8[4] = self;
    [v7 startWithCompletionHandler:v8];
  }
}

void __73__WFMapSearchTableViewController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = [a2 mapItems];
    [*(id *)(a1 + 32) setMapItems:v3];

    id v4 = [*(id *)(a1 + 32) tableView];
    [v4 reloadData];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:");
  id v6 = [(WFMapSearchTableViewController *)self delegate];

  if (v6)
  {
    v7 = [(WFMapSearchTableViewController *)self delegate];
    v8 = [(WFMapSearchTableViewController *)self mapItems];
    v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v10, "row"));
    [v7 mapSearchViewController:self didSelectMapItem:v9];
  }
  [(WFMapSearchTableViewController *)self dismissViewControllerAnimated:0 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  v11 = [(WFMapSearchTableViewController *)self mapItems];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndex:v12];
  v14 = [v13 name];

  v15 = [v10 textLabel];
  [v15 setText:v14];

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(WFMapSearchTableViewController *)self mapItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WFMapSearchTableViewController;
  [(WFMapSearchTableViewController *)&v7 viewDidLoad];
  v3 = [(WFMapSearchTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  int64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];
}

@end