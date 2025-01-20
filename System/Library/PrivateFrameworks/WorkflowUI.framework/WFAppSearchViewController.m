@interface WFAppSearchViewController
- (BOOL)allowMultipleSelection;
- (NSArray)apps;
- (NSArray)omittedAppBundleIDs;
- (NSMutableDictionary)cachedAppIconForBundleId;
- (NSMutableOrderedSet)selectedApps;
- (UIImage)placeholderImage;
- (UITableView)tableView;
- (WFAppSearchViewController)init;
- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3;
- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3 allowMultipleSelection:(BOOL)a4 selectedApps:(id)a5;
- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3 omittedAppBundleIDs:(id)a4 allowMultipleSelection:(BOOL)a5 selectedApps:(id)a6;
- (WFAppSearchViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)applicationIconImageForBundleIdentifier:(id)a3;
- (id)filteredApps;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)appSearchType;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)adjustInsetsForKeyboard;
- (void)cancel;
- (void)dealloc;
- (void)done;
- (void)loadApps;
- (void)loadView;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setApps:(id)a3;
- (void)setCachedAppIconForBundleId:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setSelectedApps:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDoneButtonEnabledState;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAppSearchViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_cachedAppIconForBundleId, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_omittedAppBundleIDs, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPlaceholderImage:(id)a3
{
}

- (void)setCachedAppIconForBundleId:(id)a3
{
}

- (NSMutableDictionary)cachedAppIconForBundleId
{
  return self->_cachedAppIconForBundleId;
}

- (void)setSelectedApps:(id)a3
{
}

- (NSMutableOrderedSet)selectedApps
{
  return self->_selectedApps;
}

- (void)setApps:(id)a3
{
}

- (NSArray)apps
{
  return self->_apps;
}

- (BOOL)allowMultipleSelection
{
  return self->_allowMultipleSelection;
}

- (NSArray)omittedAppBundleIDs
{
  return self->_omittedAppBundleIDs;
}

- (int64_t)appSearchType
{
  return self->_appSearchType;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFAppSearchViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAppSearchViewControllerDelegate *)WeakRetained;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v3 = [(WFAppSearchViewController *)self tableView];
  [v3 reloadData];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4 = [(WFAppSearchViewController *)self tableView];
  [v4 reloadData];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFAppSearchViewController *)self filteredApps];
  if ([v4 count]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 44.0;
  }

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  double v5 = [(WFAppSearchViewController *)self filteredApps];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F82E00]);
    v9 = [(WFAppSearchViewController *)self view];
    [v9 bounds];
    v7 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v17), 0.0);

    id v10 = objc_alloc(MEMORY[0x263F828E0]);
    v11 = [(WFAppSearchViewController *)self view];
    [v11 bounds];
    v12 = objc_msgSend(v10, "initWithFrame:", 15.0, 0.0, CGRectGetWidth(v18) + -30.0, 0.0);

    [v12 setAutoresizingMask:21];
    v13 = WFLocalizedString(@"No results.");
    [v12 setText:v13];

    v14 = [MEMORY[0x263F825C8] lightGrayColor];
    [v12 setTextColor:v14];

    [v7 addSubview:v12];
  }
  return v7;
}

- (void)updateDoneButtonEnabledState
{
  id v3 = [(WFAppSearchViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];

  if (v4)
  {
    id v8 = [(WFAppSearchViewController *)self selectedApps];
    BOOL v5 = [v8 count] != 0;
    uint64_t v6 = [(WFAppSearchViewController *)self navigationItem];
    v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:v5];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  v7 = [(WFAppSearchViewController *)self filteredApps];
  unint64_t v8 = [v6 row];
  if (v8 < [v7 count])
  {
    v9 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    if ([(WFAppSearchViewController *)self allowMultipleSelection])
    {
      id v10 = [v17 cellForRowAtIndexPath:v6];
      if ([v10 accessoryType])
      {
        [v10 setAccessoryType:0];
        v11 = [(WFAppSearchViewController *)self selectedApps];
        [v11 removeObject:v9];
      }
      else
      {
        [v10 setAccessoryType:3];
        v11 = [(WFAppSearchViewController *)self selectedApps];
        [v11 addObject:v9];
      }

      [v17 deselectRowAtIndexPath:v6 animated:1];
      [(WFAppSearchViewController *)self updateDoneButtonEnabledState];
    }
    else
    {
      v12 = [(WFAppSearchViewController *)self navigationItem];
      v13 = [v12 searchController];
      int v14 = [v13 isActive];

      if (v14)
      {
        v15 = [(WFAppSearchViewController *)self navigationItem];
        v16 = [v15 searchController];
        [v16 setActive:0];
      }
      [v17 deselectRowAtIndexPath:v6 animated:1];
      id v10 = [(WFAppSearchViewController *)self delegate];
      [v10 appSearchViewController:self didFinishWithApp:v9];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(WFAppSearchViewController *)self filteredApps];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  id v10 = [v6 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v7];
  v11 = [v9 localizedName];
  v12 = [v10 textLabel];
  [v12 setText:v11];

  if ([(WFAppSearchViewController *)self allowMultipleSelection]
    && ([(WFAppSearchViewController *)self selectedApps],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 containsObject:v9],
        v13,
        (v14 & 1) != 0))
  {
    uint64_t v15 = 3;
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v10 setAccessoryType:v15];
  v16 = [(WFAppSearchViewController *)self placeholderImage];
  id v17 = [v10 imageView];
  [v17 setImage:v16];

  CGRect v18 = [v9 bundleIdentifier];

  if (v18)
  {
    v19 = [(WFAppSearchViewController *)self cachedAppIconForBundleId];
    v20 = [v9 bundleIdentifier];
    v21 = [v19 objectForKeyedSubscript:v20];

    if (v21)
    {
      v22 = [v10 imageView];
      [v22 setImage:v21];
    }
    else
    {
      v23 = dispatch_get_global_queue(0, 0);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v25[3] = &unk_2649CB810;
      v25[4] = self;
      id v26 = v9;
      id v27 = v6;
      id v28 = v7;
      dispatch_async(v23, v25);
    }
  }

  return v10;
}

void __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) bundleIdentifier];
  id v4 = [v2 applicationIconImageForBundleIdentifier:v3];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_2649CADD8;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = v4;
  BOOL v5 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [v7 imageView];
  [v3 setImage:v2];

  [v7 setNeedsLayout];
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v5 = [*(id *)(a1 + 56) cachedAppIconForBundleId];
  id v6 = [*(id *)(a1 + 64) bundleIdentifier];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(WFAppSearchViewController *)self filteredApps];
  int64_t v5 = [v4 count];

  return v5;
}

- (UIImage)placeholderImage
{
  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    v9.width = 29.0;
    v9.height = 29.0;
    UIGraphicsBeginImageContextWithOptions(v9, 1, 0.0);
    uint64_t v4 = [MEMORY[0x263F825C8] whiteColor];
    [v4 setFill];

    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.width = 29.0;
    v10.size.height = 29.0;
    UIRectFill(v10);
    UIGraphicsGetImageFromCurrentImageContext();
    int64_t v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_placeholderImage;
    self->_placeholderImage = v5;

    UIGraphicsEndImageContext();
    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (id)applicationIconImageForBundleIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F86828];
  id v5 = a3;
  id v6 = [v4 sharedRegistry];
  id v7 = [v6 appWithIdentifier:v5];

  id v8 = [v7 icon];
  CGSize v9 = [v8 UIImage];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [(WFAppSearchViewController *)self placeholderImage];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)filteredApps
{
  id v3 = [(WFAppSearchViewController *)self navigationItem];
  uint64_t v4 = [v3 searchController];
  id v5 = [v4 searchBar];

  id v6 = [v5 text];
  uint64_t v7 = [v6 length];
  id v8 = [(WFAppSearchViewController *)self apps];
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__WFAppSearchViewController_filteredApps__block_invoke;
    v11[3] = &unk_2649CADB0;
    id v12 = v6;
    uint64_t v9 = objc_msgSend(v8, "if_objectsPassingTest:", v11);

    id v8 = (void *)v9;
  }

  return v8;
}

uint64_t __41__WFAppSearchViewController_filteredApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedName];
  uint64_t v4 = [v3 lowercaseString];
  id v5 = [*(id *)(a1 + 32) lowercaseString];
  uint64_t v6 = [v4 containsString:v5];

  return v6;
}

- (void)loadApps
{
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFAppSearchViewController_loadApps__block_invoke;
  block[3] = &unk_2649CBF20;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __37__WFAppSearchViewController_loadApps__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CGRect v18 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = WFInstalledAppsEnumerator();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x230F956C0]();
        if (objc_msgSend(v7, "wf_isAvailableInContext:", 0))
        {
          uint64_t v9 = [*(id *)(a1 + 32) omittedAppBundleIDs];
          id v10 = [v7 bundleIdentifier];
          char v11 = [v9 containsObject:v10];

          if ((v11 & 1) == 0)
          {
            if ([*(id *)(a1 + 32) appSearchType] != 1) {
              goto LABEL_12;
            }
            id v12 = [v7 claimRecords];
            v13 = [v12 allObjects];
            char v14 = objc_msgSend(v13, "if_flatMap:", &__block_literal_global_4123);

            if ([v14 count] && (objc_msgSend(v14, "isEqualToArray:", &unk_26E1CA8D0) & 1) == 0)
            {

LABEL_12:
              char v14 = [v7 compatibilityObject];
              [v18 addObject:v14];
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  uint64_t v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localizedName" ascending:1 selector:sel_localizedStandardCompare_];
  v25 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  [v18 sortUsingDescriptors:v16];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFAppSearchViewController_loadApps__block_invoke_3;
  block[3] = &unk_2649CC018;
  void block[4] = *(void *)(a1 + 32);
  id v20 = v18;
  id v17 = v18;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__WFAppSearchViewController_loadApps__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setApps:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

uint64_t __37__WFAppSearchViewController_loadApps__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 typeIdentifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAppSearchViewController;
  [(WFAppSearchViewController *)&v6 viewWillAppear:a3];
  [(WFAppSearchViewController *)self updateDoneButtonEnabledState];
  uint64_t v4 = [(WFAppSearchViewController *)self apps];
  uint64_t v5 = [v4 count];

  if (!v5) {
    [(WFAppSearchViewController *)self loadApps];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFAppSearchViewController;
  [(WFAppSearchViewController *)&v3 viewDidLayoutSubviews];
  [(WFAppSearchViewController *)self adjustInsetsForKeyboard];
}

- (void)adjustInsetsForKeyboard
{
  objc_super v3 = [MEMORY[0x263F865C0] sharedKeyboard];
  int v4 = [v3 isVisible];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F865C0] sharedKeyboard];
    objc_super v6 = [(WFAppSearchViewController *)self view];
    [v5 keyboardFrameInView:v6];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    uint64_t v15 = [(WFAppSearchViewController *)self view];
    [v15 bounds];
    v34.origin.CGFloat x = v8;
    v34.origin.CGFloat y = v10;
    v34.size.CGFloat width = v12;
    v34.size.CGFloat height = v14;
    CGRect v30 = CGRectIntersection(v29, v34);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;

    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    double v20 = 0.0;
    if (!CGRectIsNull(v31))
    {
      long long v21 = [(WFAppSearchViewController *)self view];
      [v21 bounds];
      double MaxY = CGRectGetMaxY(v32);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      double v20 = MaxY - CGRectGetMinY(v33);
    }
    long long v23 = [(WFAppSearchViewController *)self tableView];
    objc_msgSend(v23, "setContentInset:", 0.0, 0.0, v20, 0.0);

    long long v24 = [(WFAppSearchViewController *)self tableView];
    id v27 = v24;
    double v25 = v20;
  }
  else
  {
    id v26 = [(WFAppSearchViewController *)self tableView];
    objc_msgSend(v26, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

    long long v24 = [(WFAppSearchViewController *)self tableView];
    id v27 = v24;
    double v25 = 0.0;
  }
  objc_msgSend(v24, "setScrollIndicatorInsets:", 0.0, 0.0, v25, 0.0);
}

- (void)done
{
  objc_super v3 = [(WFAppSearchViewController *)self navigationItem];
  int v4 = [v3 searchController];
  [v4 setActive:0];

  id v7 = [(WFAppSearchViewController *)self delegate];
  uint64_t v5 = [(WFAppSearchViewController *)self selectedApps];
  objc_super v6 = [v5 array];
  [v7 appSearchViewController:self didFinishWithApps:v6];
}

- (void)cancel
{
  objc_super v3 = [(WFAppSearchViewController *)self navigationItem];
  int v4 = [v3 searchController];
  [v4 setActive:0];

  id v5 = [(WFAppSearchViewController *)self delegate];
  [v5 appSearchViewControllerDidCancel:self];
}

- (void)loadView
{
  v42[4] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)WFAppSearchViewController;
  [(WFAppSearchViewController *)&v41 loadView];
  objc_super v3 = WFLocalizedString(@"Choose App");
  [(WFAppSearchViewController *)self setTitle:v3];

  int v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
  id v5 = [(WFAppSearchViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  if ([(WFAppSearchViewController *)self allowMultipleSelection])
  {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_done];
    id v7 = [(WFAppSearchViewController *)self navigationItem];
    [v7 setRightBarButtonItem:v6];
  }
  id v8 = objc_alloc(MEMORY[0x263F82C78]);
  double v9 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v13 = objc_msgSend(v8, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], v10, v11, v12);
  objc_msgSend(v13, "setAllowsMultipleSelection:", -[WFAppSearchViewController allowMultipleSelection](self, "allowMultipleSelection"));
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 setDataSource:self];
  [v13 setDelegate:self];
  CGFloat v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v9, v10, v11, v12);
  [v13 setTableFooterView:v14];

  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
  uint64_t v15 = [(WFAppSearchViewController *)self view];
  [v15 addSubview:v13];

  [(WFAppSearchViewController *)self setTableView:v13];
  v16 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
  [v16 setObscuresBackgroundDuringPresentation:0];
  id v17 = [v16 searchBar];
  [v17 setAutocorrectionType:1];

  [v16 setHidesNavigationBarDuringPresentation:0];
  CGRect v18 = WFLocalizedString(@"Search Apps");
  v19 = [v16 searchBar];
  [v19 setPlaceholder:v18];

  double v20 = [v16 searchBar];
  [v20 setDelegate:self];

  long long v21 = [(WFAppSearchViewController *)self navigationItem];
  [v21 setSearchController:v16];

  long long v22 = [(WFAppSearchViewController *)self navigationItem];
  [v22 setHidesSearchBarWhenScrolling:0];

  CGRect v33 = (void *)MEMORY[0x263F08938];
  v39 = [v13 topAnchor];
  v40 = [(WFAppSearchViewController *)self view];
  v38 = [v40 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v42[0] = v37;
  v35 = [v13 leadingAnchor];
  v36 = [(WFAppSearchViewController *)self view];
  CGRect v34 = [v36 leadingAnchor];
  CGRect v32 = [v35 constraintEqualToAnchor:v34];
  v42[1] = v32;
  CGRect v31 = [v13 bottomAnchor];
  long long v23 = [(WFAppSearchViewController *)self view];
  long long v24 = [v23 bottomAnchor];
  double v25 = [v31 constraintEqualToAnchor:v24];
  v42[2] = v25;
  id v26 = [v13 trailingAnchor];
  id v27 = [(WFAppSearchViewController *)self view];
  id v28 = [v27 trailingAnchor];
  CGRect v29 = [v26 constraintEqualToAnchor:v28];
  v42[3] = v29;
  CGRect v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [v33 activateConstraints:v30];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F86618] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFAppSearchViewController;
  [(WFAppSearchViewController *)&v4 dealloc];
}

- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3 omittedAppBundleIDs:(id)a4 allowMultipleSelection:(BOOL)a5 selectedApps:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WFAppSearchViewController;
  double v12 = [(WFAppSearchViewController *)&v23 initWithNibName:0 bundle:0];
  double v13 = v12;
  if (v12)
  {
    v12->_appSearchType = a3;
    uint64_t v14 = [v10 copy];
    omittedAppBundleIDs = v13->_omittedAppBundleIDs;
    v13->_omittedAppBundleIDs = (NSArray *)v14;

    v13->_allowMultipleSelection = a5;
    if (v11) {
      v16 = (void *)[objc_alloc(MEMORY[0x263EFF9B0]) initWithOrderedSet:v11];
    }
    else {
      v16 = objc_opt_new();
    }
    id v17 = v16;
    objc_storeStrong((id *)&v13->_selectedApps, v16);

    uint64_t v18 = objc_opt_new();
    cachedAppIconForBundleId = v13->_cachedAppIconForBundleId;
    v13->_cachedAppIconForBundleId = (NSMutableDictionary *)v18;

    double v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v13 selector:sel_adjustInsetsForKeyboard name:*MEMORY[0x263F86618] object:0];

    long long v21 = v13;
  }

  return v13;
}

- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3 allowMultipleSelection:(BOOL)a4 selectedApps:(id)a5
{
  return [(WFAppSearchViewController *)self initWithAppSearchType:a3 omittedAppBundleIDs:0 allowMultipleSelection:a4 selectedApps:a5];
}

- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3
{
  return [(WFAppSearchViewController *)self initWithAppSearchType:a3 allowMultipleSelection:0 selectedApps:0];
}

- (WFAppSearchViewController)init
{
  return [(WFAppSearchViewController *)self initWithAppSearchType:0];
}

@end