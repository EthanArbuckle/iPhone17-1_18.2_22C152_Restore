@interface MSDSearchResultViewController
- (BOOL)isShowingSearchResult;
- (MSDSearchResultViewController)initWithDelegate:(id)a3;
- (MSDSearchResultViewControllerDelegate)delegate;
- (NSArray)storeInfoList;
- (NSTimer)debounceTimer;
- (UISearchBar)searchBar;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)didConfirmStoreAssignment:(id)a3;
- (void)dismissAllTopViews;
- (void)listViewDidClose:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setDebounceTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSearchBar:(id)a3;
- (void)setStoreInfoList:(id)a3;
- (void)setTableView:(id)a3;
- (void)showInProgress;
- (void)showStoreInfo:(id)a3;
- (void)showStoreList:(id)a3 inDisplayMode:(unint64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(id)a3 forStore:(id)a4;
- (void)viewWillClose:(id)a3 forStore:(id)a4;
@end

@implementation MSDSearchResultViewController

- (MSDSearchResultViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDSearchResultViewController;
  v5 = [(MSDSearchResultViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MSDSearchResultViewController *)v5 setSearchBar:0];
    [(MSDSearchResultViewController *)v6 setTableView:0];
    [(MSDSearchResultViewController *)v6 setMode:1];
    [(MSDSearchResultViewController *)v6 setStoreInfoList:0];
    [(MSDSearchResultViewController *)v6 setDebounceTimer:0];
    [(MSDSearchResultViewController *)v6 setDelegate:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v64[3] = *MEMORY[0x263EF8340];
  v62.receiver = self;
  v62.super_class = (Class)MSDSearchResultViewController;
  [(MSDSearchResultViewController *)&v62 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v4 = [(MSDSearchResultViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc_init(MEMORY[0x263F1C950]);
  [(MSDSearchResultViewController *)self setSearchBar:v5];

  v6 = +[MSDSetupUILocalization localizedStringForKey:@"SEARCH_PLACEHOLDER"];
  v7 = [(MSDSearchResultViewController *)self searchBar];
  [v7 setPlaceholder:v6];

  objc_super v8 = [(MSDSearchResultViewController *)self searchBar];
  [v8 setDelegate:self];

  v9 = [(MSDSearchResultViewController *)self searchBar];
  [v9 setSearchBarStyle:2];

  v10 = [(MSDSearchResultViewController *)self searchBar];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(MSDSearchResultViewController *)self view];
  v12 = [(MSDSearchResultViewController *)self searchBar];
  [v11 addSubview:v12];

  v59 = [(MSDSearchResultViewController *)self searchBar];
  v53 = [v59 topAnchor];
  v57 = [(MSDSearchResultViewController *)self view];
  v55 = [v57 safeAreaLayoutGuide];
  v51 = [v55 topAnchor];
  v49 = [v53 constraintEqualToAnchor:v51 constant:15.0];
  v64[0] = v49;
  v47 = [(MSDSearchResultViewController *)self searchBar];
  v43 = [v47 leadingAnchor];
  v45 = [(MSDSearchResultViewController *)self view];
  v41 = [v45 safeAreaLayoutGuide];
  v13 = [v41 leadingAnchor];
  v14 = [v43 constraintEqualToAnchor:v13];
  v64[1] = v14;
  v15 = [(MSDSearchResultViewController *)self searchBar];
  v16 = [v15 trailingAnchor];
  v17 = [(MSDSearchResultViewController *)self view];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 trailingAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  v64[2] = v20;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:3];

  [MEMORY[0x263F08938] activateConstraints:v61];
  id v21 = objc_alloc(MEMORY[0x263F1CA40]);
  v22 = objc_msgSend(v21, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(MSDSearchResultViewController *)self setTableView:v22];

  v23 = [(MSDSearchResultViewController *)self tableView];
  [v23 setDataSource:self];

  v24 = [(MSDSearchResultViewController *)self tableView];
  [v24 setDelegate:self];

  v25 = [(MSDSearchResultViewController *)self tableView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = [(MSDSearchResultViewController *)self view];
  v27 = [(MSDSearchResultViewController *)self tableView];
  [v26 addSubview:v27];

  v60 = [(MSDSearchResultViewController *)self tableView];
  v56 = [v60 topAnchor];
  v58 = [(MSDSearchResultViewController *)self searchBar];
  v54 = [v58 bottomAnchor];
  v52 = [v56 constraintEqualToAnchor:v54];
  v63[0] = v52;
  v50 = [(MSDSearchResultViewController *)self tableView];
  v46 = [v50 bottomAnchor];
  v48 = [(MSDSearchResultViewController *)self view];
  v44 = [v48 bottomAnchor];
  v42 = [v46 constraintEqualToAnchor:v44];
  v63[1] = v42;
  v40 = [(MSDSearchResultViewController *)self tableView];
  v28 = [v40 leadingAnchor];
  v29 = [(MSDSearchResultViewController *)self view];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v63[2] = v31;
  v32 = [(MSDSearchResultViewController *)self tableView];
  v33 = [v32 trailingAnchor];
  v34 = [(MSDSearchResultViewController *)self view];
  v35 = [v34 trailingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v63[3] = v36;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:4];

  [MEMORY[0x263F08938] activateConstraints:v39];
  v37 = [(MSDSearchResultViewController *)self tableView];
  [v37 registerClass:objc_opt_class() forCellReuseIdentifier:@"StoreInfoCell"];

  v38 = [(MSDSearchResultViewController *)self tableView];
  [v38 registerClass:objc_opt_class() forCellReuseIdentifier:@"StoreLoading"];
}

- (void)showInProgress
{
  [(MSDSearchResultViewController *)self setStoreInfoList:0];
  [(MSDSearchResultViewController *)self setMode:0];
  id v3 = [(MSDSearchResultViewController *)self tableView];
  [v3 reloadData];
}

- (void)showStoreInfo:(id)a3
{
  id v4 = a3;
  v6 = [[MSDStoreInfoViewController alloc] initWithStoreInfo:v4 andDelegate:self];

  id v5 = [(MSDSearchResultViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)showStoreList:(id)a3 inDisplayMode:(unint64_t)a4
{
  id v9 = a3;
  if (a4 == 2)
  {
    v6 = [[MSDStoreInfoListViewController alloc] initWithStoreInfoList:v9 andDelegate:self];
    v7 = [(MSDSearchResultViewController *)self navigationController];
    [v7 pushViewController:v6 animated:1];
  }
  else
  {
    [(MSDSearchResultViewController *)self setStoreInfoList:v9];
    if (v9 && [v9 count])
    {
      if (a4)
      {
        if (a4 != 1) {
          goto LABEL_11;
        }
        uint64_t v8 = 2;
      }
      else
      {
        uint64_t v8 = 1;
      }
    }
    else
    {
      uint64_t v8 = 3;
    }
    [(MSDSearchResultViewController *)self setMode:v8];
    v6 = [(MSDSearchResultViewController *)self tableView];
    [(MSDStoreInfoListViewController *)v6 reloadData];
  }

LABEL_11:
}

- (void)dismissAllTopViews
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[MSDSearchResultViewController dismissAllTopViews]";
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "%s - dismissing all top views", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(MSDSearchResultViewController *)self navigationController];
  id v5 = (id)[v4 popToRootViewControllerAnimated:1];
}

- (BOOL)isShowingSearchResult
{
  v2 = self;
  id v3 = [(MSDSearchResultViewController *)self navigationController];
  id v4 = [v3 topViewController];
  LOBYTE(v2) = [v4 isEqual:v2];

  return (char)v2;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = defaultLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "User entered search text: %{public}@", buf, 0xCu);
  }

  uint64_t v7 = [(MSDSearchResultViewController *)self debounceTimer];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(MSDSearchResultViewController *)self debounceTimer];
    int v10 = [v9 isValid];

    if (v10)
    {
      v11 = [(MSDSearchResultViewController *)self debounceTimer];
      [v11 invalidate];
    }
  }
  id v12 = objc_alloc(MEMORY[0x263EFFA20]);
  v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__MSDSearchResultViewController_searchBar_textDidChange___block_invoke;
  v17[3] = &unk_264D882C8;
  v17[4] = self;
  v14 = (void *)[v12 initWithFireDate:v13 interval:0 repeats:v17 block:0.0];
  [(MSDSearchResultViewController *)self setDebounceTimer:v14];

  v15 = [MEMORY[0x263EFF9F0] currentRunLoop];
  v16 = [(MSDSearchResultViewController *)self debounceTimer];
  [v15 addTimer:v16 forMode:*MEMORY[0x263EFF478]];
}

void __57__MSDSearchResultViewController_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) searchBar];
  id v3 = [v2 text];

  id v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "Processing search text: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 didEnterSearchText:v3 forViewController:*(void *)(a1 + 32)];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = [(MSDSearchResultViewController *)self searchBar];
  [v3 endEditing:1];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled search", v8, 2u);
  }

  id v5 = [(MSDSearchResultViewController *)self searchBar];
  [v5 endEditing:1];

  int v6 = [(MSDSearchResultViewController *)self searchBar];
  [v6 setText:0];

  uint64_t v7 = [(MSDSearchResultViewController *)self delegate];
  [v7 didEnterSearchText:0 forViewController:self];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v3 = [(MSDSearchResultViewController *)self searchBar];
  [v3 setShowsCancelButton:1];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v3 = [(MSDSearchResultViewController *)self searchBar];
  [v3 setShowsCancelButton:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(MSDSearchResultViewController *)self mode] == 3
    || ![(MSDSearchResultViewController *)self mode])
  {
    return 2;
  }
  id v5 = [(MSDSearchResultViewController *)self storeInfoList];
  int64_t v6 = [v5 count] + 1;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 row];
  uint64_t v7 = [(MSDSearchResultViewController *)self tableView];
  uint64_t v8 = [v7 numberOfRowsInSection:0];

  id v9 = 0;
  if (v6 < v8)
  {
    uint64_t v10 = [v5 row];
    v11 = [(MSDSearchResultViewController *)self tableView];
    uint64_t v12 = [v11 numberOfRowsInSection:0] - 1;

    if (v10 == v12)
    {
      id v9 = (MSDStoreInfoTableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:3 reuseIdentifier:@"StoreInfoCell"];
      v13 = [(MSDStoreInfoTableViewCell *)v9 defaultContentConfiguration];
      v14 = +[MSDSetupUILocalization localizedStringForKey:@"CANNOT_FIND_STORE_BUTTON"];
      [v13 setText:v14];

      v15 = [MEMORY[0x263F1C550] systemBlueColor];
      v16 = [v13 textProperties];
      [v16 setColor:v15];

      [(MSDStoreInfoTableViewCell *)v9 setContentConfiguration:v13];
      v17 = [(MSDSearchResultViewController *)self tableView];
      [v17 bounds];
      -[MSDStoreInfoTableViewCell setSeparatorInset:](v9, "setSeparatorInset:", 0.0, 0.0, 0.0, CGRectGetWidth(v38));
    }
    else
    {
      unint64_t v18 = [(MSDSearchResultViewController *)self mode];
      if (v18 == 3)
      {
        id v21 = [MSDStoreInfoTableViewCell alloc];
        v22 = +[MSDSetupUILocalization localizedStringForKey:@"NO_RESULTS_TITLE"];
        v23 = +[MSDSetupUILocalization localizedStringForKey:@"NO_RESULTS_DESCRIPTION"];
        v24 = [MEMORY[0x263F1C6B0] systemImageNamed:@"magnifyingglass.circle.fill"];
        v25 = [MEMORY[0x263F1C550] lightGrayColor];
        id v9 = [(MSDStoreInfoTableViewCell *)v21 initWithTitle:v22 description:v23 image:v24 imageColor:v25 reuseIdentifier:@"StoreInfoCell"];
      }
      else
      {
        if (v18)
        {
          v26 = [(MSDSearchResultViewController *)self storeInfoList];
          v27 = objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v5, "row"));

          if ([v27 isHQ])
          {
            v28 = (void *)MEMORY[0x263F1C6B0];
            v29 = @"building.2.crop.circle.fill";
          }
          else
          {
            unint64_t v30 = [(MSDSearchResultViewController *)self mode];
            v28 = (void *)MEMORY[0x263F1C6B0];
            if (v30 == 1) {
              v29 = @"mappin.circle.fill";
            }
            else {
              v29 = @"magnifyingglass.circle.fill";
            }
          }
          v31 = [v28 systemImageNamed:v29];
          if ([(MSDSearchResultViewController *)self mode] == 1) {
            [MEMORY[0x263F1C550] systemRedColor];
          }
          else {
          v32 = [MEMORY[0x263F1C550] lightGrayColor];
          }
          v33 = [MSDStoreInfoTableViewCell alloc];
          v34 = [v27 storeName];
          v35 = [v27 storeDescription];
          id v9 = [(MSDStoreInfoTableViewCell *)v33 initWithTitle:v34 description:v35 image:v31 imageColor:v32 reuseIdentifier:@"StoreInfoCell"];

          goto LABEL_18;
        }
        id v9 = [[MSDStoreInfoTableViewCell alloc] initSpinnerCellWithReuseIdentifier:@"StoreLoading"];
        id v19 = [(MSDSearchResultViewController *)self tableView];
        [v19 bounds];
        -[MSDStoreInfoTableViewCell setSeparatorInset:](v9, "setSeparatorInset:", 0.0, v20, 0.0, 0.0);
      }
      [(MSDStoreInfoTableViewCell *)v9 setSelectionStyle:0];
    }
  }
LABEL_18:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 > 0) {
    goto LABEL_2;
  }
  if ([(MSDSearchResultViewController *)self mode] == 1)
  {
    uint64_t v8 = @"NEARBY_STORE_SECTION_HEADER";
  }
  else
  {
    if ([(MSDSearchResultViewController *)self mode] != 2)
    {
LABEL_2:
      uint64_t v7 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = @"SEARCH_RESULT_SECTION_HEADER";
  }
  uint64_t v7 = +[MSDSetupUILocalization localizedStringForKey:v8];
LABEL_8:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a4;
  uint64_t v5 = [v15 row];
  id v6 = [(MSDSearchResultViewController *)self tableView];
  uint64_t v7 = [v6 numberOfRowsInSection:0];

  if (v5 < v7)
  {
    uint64_t v8 = [v15 row];
    id v9 = [(MSDSearchResultViewController *)self tableView];
    uint64_t v10 = [v9 numberOfRowsInSection:0] - 1;

    if (v8 == v10)
    {
      v11 = [(MSDSearchResultViewController *)self delegate];
      [v11 didSelectNoStoreForViewController:self];
LABEL_7:

      v14 = [(MSDSearchResultViewController *)self tableView];
      [v14 deselectRowAtIndexPath:v15 animated:1];

      goto LABEL_8;
    }
    if ([(MSDSearchResultViewController *)self mode] != 3 && [(MSDSearchResultViewController *)self mode])
    {
      uint64_t v12 = [(MSDSearchResultViewController *)self storeInfoList];
      v11 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v15, "row"));

      [(MSDSearchResultViewController *)self showStoreInfo:v11];
      v13 = [(MSDSearchResultViewController *)self searchBar];
      [v13 endEditing:1];

      goto LABEL_7;
    }
  }
LABEL_8:
  MEMORY[0x270F9A758]();
}

- (void)viewWillAppear:(id)a3 forStore:(id)a4
{
  id v5 = a4;
  id v6 = [(MSDSearchResultViewController *)self delegate];
  [v6 didSelectStore:v5 forViewController:self];
}

- (void)viewWillClose:(id)a3 forStore:(id)a4
{
  id v5 = a4;
  id v6 = [(MSDSearchResultViewController *)self delegate];
  [v6 didDeselectStore:v5 forViewController:self];
}

- (void)didConfirmStoreAssignment:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSearchResultViewController *)self delegate];
  [v5 didAssignStore:v4 forViewController:self];
}

- (void)listViewDidClose:(id)a3
{
  id v7 = a3;
  id v4 = [(MSDSearchResultViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MSDSearchResultViewController *)self delegate];
    [v6 didDismissStoreListView:v7 forViewController:self];
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (NSTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
}

- (NSArray)storeInfoList
{
  return self->_storeInfoList;
}

- (void)setStoreInfoList:(id)a3
{
}

- (MSDSearchResultViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_storeInfoList, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end