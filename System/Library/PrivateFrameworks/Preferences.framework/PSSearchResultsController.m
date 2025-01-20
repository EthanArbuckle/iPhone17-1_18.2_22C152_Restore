@interface PSSearchResultsController
- (PSSearchResults)searchResults;
- (PSSearchResultsController)init;
- (PSSearchResultsControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_removeIconViewForSection:(id)a3;
- (void)_updateIconViews:(BOOL)a3;
- (void)loadView;
- (void)reloadData;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewDidFinishReload:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PSSearchResultsController

- (PSSearchResultsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSSearchResultsController;
  v2 = [(PSSearchResultsController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    iconViewMap = v2->_iconViewMap;
    v2->_iconViewMap = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    reusableIconViews = v2->_reusableIconViews;
    v2->_reusableIconViews = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v6 = objc_opt_new();
  [(UITableView *)self->_tableView setTableFooterView:v6];

  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView setLayoutMarginsFollowReadableWidth:0];
  [(UITableView *)self->_tableView setAutoresizingMask:18];
  v7 = +[PSListController appearance];
  if ([v7 usesDarkTheme]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  [(UITableView *)self->_tableView setIndicatorStyle:v8];

  v9 = self->_tableView;
  [(PSSearchResultsController *)self setView:v9];
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(PSSearchResultsController *)self presentingViewController];
  id v13 = [v3 tabBarController];

  if (v13)
  {
    v4 = [(PSSearchResultsController *)self presentingViewController];
    uint64_t v5 = [(PSSearchResultsController *)self presentingViewController];
    v6 = [v5 view];
    v7 = [v6 safeAreaLayoutGuide];
    [v7 layoutFrame];
    double v9 = v8;

    v10 = [v4 navigationBar];
    [v10 frame];
    double v11 = v9 + CGRectGetHeight(v15);

    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v11, 0.0, v11, 0.0);
    v12 = [v13 tabBar];
    [v12 frame];
    -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v11, 0.0, CGRectGetHeight(v16), 0.0);
  }
}

- (void)reloadData
{
}

- (void)setSearchResults:(id)a3
{
  uint64_t v5 = (PSSearchResults *)a3;
  p_searchResults = &self->_searchResults;
  if (self->_searchResults != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_searchResults, a3);
    p_searchResults = (PSSearchResults **)[(PSSearchResultsController *)self reloadData];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_searchResults, v5);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(PSSearchResults *)self->_searchResults numberOfEntriesInSectionAtIndex:a4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(PSSearchResults *)self->_searchResults numberOfSectionEntries];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  searchResults = self->_searchResults;
  id v6 = a3;
  v7 = [(PSSearchResults *)searchResults entryAtIndexPath:a4];
  double v8 = objc_opt_class();
  double v9 = [v8 reuseIdentifier];
  v10 = [v6 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    v10 = (void *)[objc_alloc((Class)v8) initWithStyle:3 reuseIdentifier:v9];
  }
  id v16 = 0;
  double v11 = [v7 detailTextWithEffectiveTitle:&v16];
  id v12 = v16;
  id v13 = [v10 textLabel];
  [v13 setText:v12];

  v14 = [v10 detailTextLabel];
  [v14 setText:v11];

  [v10 setShouldIndentSeparator:1];
  [v10 setShouldIndentContent:0];

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  searchResults = self->_searchResults;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(PSSearchResults *)searchResults entryAtIndexPath:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchResultsController:self didSelectSearchEntry:v10];

  [v8 deselectRowAtIndexPath:v7 animated:0];
}

- (void)_removeIconViewForSection:(id)a3
{
  id v5 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_iconViewMap, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NSMutableArray *)self->_reusableIconViews addObject:v4];
    [v4 removeFromSuperview];
    [(NSMutableDictionary *)self->_iconViewMap removeObjectForKey:v5];
  }
}

- (void)_updateIconViews:(BOOL)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [(NSMutableDictionary *)self->_iconViewMap allKeys];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v87 objects:v94 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v88 != v7) {
            objc_enumerationMutation(v4);
          }
          [(PSSearchResultsController *)self _removeIconViewForSection:*(void *)(*((void *)&v87 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v87 objects:v94 count:16];
      }
      while (v6);
    }
  }
  [(UITableView *)self->_tableView contentOffset];
  double v10 = v9;
  [(UITableView *)self->_tableView contentInset];
  double v12 = v11;
  id v13 = [(UITableView *)self->_tableView indexPathsForVisibleRows];
  v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v13, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v83 objects:v93 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v84 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * j), "section"));
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v83 objects:v93 count:16];
    }
    while (v17);
  }
  id v69 = v15;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v21 = v14;
  unint64_t v22 = 0x1E96BE000uLL;
  obuint64_t j = v21;
  uint64_t v74 = [v21 countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (v74)
  {
    double v72 = v10 + v12;
    uint64_t v73 = *(void *)v80;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v80 != v73) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v79 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend(v24, "unsignedIntegerValue", v69);
        uint64_t v26 = *(int *)(v22 + 1660);
        v27 = [*(id *)((char *)&self->super.super.super.isa + v26) objectForKeyedSubscript:v24];
        tableView = self->_tableView;
        v29 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v25];
        [(UITableView *)tableView rectForRowAtIndexPath:v29];
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;

        if (v27) {
          goto LABEL_23;
        }
        v27 = [(PSSearchResults *)self->_searchResults sectionEntryAtIndex:v25];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v58 = [WeakRetained searchResultsController:self iconForSearchEntry:v27];

        if (!v58) {
          goto LABEL_31;
        }
        if ([(NSMutableArray *)self->_reusableIconViews count])
        {
          v59 = [(NSMutableArray *)self->_reusableIconViews objectAtIndexedSubscript:0];
          [(NSMutableArray *)self->_reusableIconViews removeObjectAtIndex:0];
        }
        else
        {
          v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v31, v33, 60.0, v35);
          [v59 setContentMode:4];
        }
        unint64_t v22 = 0x1E96BE000;
        [v59 setImage:v58];
        [(UITableView *)self->_tableView addSubview:v59];
        [*(id *)((char *)&self->super.super.super.isa + v26) setObject:v59 forKeyedSubscript:v24];

        v27 = v59;
        if (v59)
        {
LABEL_23:
          [(UITableView *)self->_tableView rectForSection:v25];
          CGFloat v37 = v36;
          double v39 = v38;
          CGFloat v41 = v40;
          CGFloat v43 = v42;
          [v27 frame];
          double v45 = v44;
          CGFloat v47 = v46;
          double v49 = v48;
          v96.origin.x = v37;
          v96.origin.y = v39;
          v96.size.width = v41;
          v96.size.height = v43;
          double MaxY = CGRectGetMaxY(v96);
          v97.origin.x = v45;
          v97.origin.y = v47;
          v97.size.width = v49;
          v97.size.height = v35;
          uint64_t v51 = (uint64_t)(MaxY - CGRectGetHeight(v97));
          double v52 = v72;
          if (v72 < v39) {
            double v52 = v39;
          }
          if (v51 >= (uint64_t)v52) {
            uint64_t v53 = (uint64_t)v52;
          }
          else {
            uint64_t v53 = v51;
          }
          v54 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v55 = [v54 userInterfaceLayoutDirection];

          if (v55 == 1)
          {
            [(UITableView *)self->_tableView frame];
            double v45 = v56 - v49;
          }
          objc_msgSend(v27, "setFrame:", v45, (double)v53, v49, v35);
LABEL_31:
        }
        ++v23;
      }
      while (v74 != v23);
      id v21 = obj;
      uint64_t v60 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
      uint64_t v74 = v60;
    }
    while (v60);
  }

  v61 = v69;
  if (!a3)
  {
    v62 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(Class *)((char *)&self->super.super.super.isa + *(int *)(v22 + 1660))];
    v63 = [v21 allObjects];
    [v62 removeObjectsForKeys:v63];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v64 = v62;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v75 objects:v91 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v66; ++k)
        {
          if (*(void *)v76 != v67) {
            objc_enumerationMutation(v64);
          }
          -[PSSearchResultsController _removeIconViewForSection:](self, "_removeIconViewForSection:", *(void *)(*((void *)&v75 + 1) + 8 * k), v69);
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v75 objects:v91 count:16];
      }
      while (v66);
    }

    id v21 = obj;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)tableViewDidFinishReload:(id)a3
{
}

- (PSSearchResults)searchResults
{
  return self->_searchResults;
}

- (PSSearchResultsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSearchResultsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_reusableIconViews, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end