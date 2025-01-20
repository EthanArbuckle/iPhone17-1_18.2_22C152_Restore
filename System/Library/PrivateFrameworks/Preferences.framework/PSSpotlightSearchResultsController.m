@interface PSSpotlightSearchResultsController
- (NSArray)results;
- (NSMutableArray)tableData;
- (PSSpotlightSearchResultsController)init;
- (PSSpotlightSearchResultsControllerDelegate)delegate;
- (double)iconWidth;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_itemForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_removeIconViewForSection:(id)a3;
- (void)_selectIndexPath:(id)a3;
- (void)_updateIconViews:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchQueryCompleted;
- (void)searchQueryFoundItems:(id)a3;
- (void)searchQueryStarted;
- (void)selectNextSearchResult;
- (void)selectPreviousSearchResult;
- (void)setDelegate:(id)a3;
- (void)setResults:(id)a3;
- (void)setTableData:(id)a3;
- (void)showSelectedSearchResult;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewDidFinishReload:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PSSpotlightSearchResultsController

- (PSSpotlightSearchResultsController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PSSpotlightSearchResultsController;
  v2 = [(PSSpotlightSearchResultsController *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    iconViewMap = v2->_iconViewMap;
    v2->_iconViewMap = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    reusableIconViews = v2->_reusableIconViews;
    v2->_reusableIconViews = (NSMutableArray *)v5;

    v7 = [MEMORY[0x1E4F42948] currentDevice];
    v2->_deviceOrientation = [v7 orientation];

    v8 = [(PSSpotlightSearchResultsController *)v2 view];
    [v8 directionalLayoutMargins];
    v2->originalInset = v9;
  }
  return v2;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PSSpotlightSearchResultsController;
  [(PSSpotlightSearchResultsController *)&v14 viewDidLoad];
  uint64_t v3 = objc_opt_new();
  v4 = [(PSSpotlightSearchResultsController *)self tableView];
  [v4 setTableFooterView:v3];

  uint64_t v5 = [(PSSpotlightSearchResultsController *)self tableView];
  [v5 setKeyboardDismissMode:1];

  v6 = [(PSSpotlightSearchResultsController *)self tableView];
  [v6 setAutoresizingMask:18];

  v7 = +[PSListController appearance];
  int v8 = [v7 usesDarkTheme];

  double v9 = [(PSSpotlightSearchResultsController *)self tableView];
  v10 = v9;
  if (v8) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v8) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  [v9 setIndicatorStyle:v11];

  v13 = [(PSSpotlightSearchResultsController *)self tableView];
  [v13 _accessibilitySetInterfaceStyleIntent:v12];
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(PSSpotlightSearchResultsController *)self tableData];
  int64_t v4 = [v3 count];

  return v4;
}

- (NSMutableArray)tableData
{
  return self->_tableData;
}

- (void)setResults:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_results, a3);
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "attributeSet", v28);
          uint64_t v14 = [v13 theme];

          if (v14) {
            v15 = (__CFString *)v14;
          }
          else {
            v15 = &stru_1EFB51FD0;
          }
          v16 = [v6 objectForKeyedSubscript:v15];

          if (!v16)
          {
            id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v6 setObject:v17 forKeyedSubscript:v15];
          }
          v18 = [v6 objectForKeyedSubscript:v15];
          [v18 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(PSSpotlightSearchResultsController *)self setTableData:v19];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v20 = [v6 allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * j), v28);
          v26 = [(PSSpotlightSearchResultsController *)self tableData];
          [v26 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v22);
    }

    v27 = [(PSSpotlightSearchResultsController *)self tableData];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__PSSpotlightSearchResultsController_setResults___block_invoke;
    v29[3] = &unk_1E5C60328;
    v29[4] = self;
    [v27 sortUsingComparator:v29];

    id v5 = v28;
  }
}

uint64_t __49__PSSpotlightSearchResultsController_setResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  id v7 = [v6 attributeSet];
  uint64_t v8 = [v7 theme];

  uint64_t v9 = [v5 objectAtIndexedSubscript:0];

  uint64_t v10 = [v9 attributeSet];
  uint64_t v11 = [v10 theme];

  uint64_t v12 = [*(id *)(a1 + 32) delegate];
  uint64_t v13 = [v12 searchResultsController:*(void *)(a1 + 32) sortCategory1:v8 sortCategory2:v11];

  return v13;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = (void *)MEMORY[0x1E4F42948];
  id v8 = a4;
  uint64_t v9 = [v7 currentDevice];
  [v9 orientation];

  v10.receiver = self;
  v10.super_class = (Class)PSSpotlightSearchResultsController;
  -[PSSpotlightSearchResultsController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(PSSpotlightSearchResultsController *)self tableData];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(PSSpotlightSearchResultsController *)self _itemForIndexPath:a4];
  id v8 = objc_opt_class();
  uint64_t v9 = [v8 reuseIdentifier];
  objc_super v10 = [v6 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    objc_super v10 = (void *)[objc_alloc((Class)v8) initWithStyle:3 reuseIdentifier:v9];
  }
  uint64_t v11 = [v7 attributeSet];
  uint64_t v12 = [v11 subject];
  uint64_t v13 = [v10 textLabel];
  [v13 setText:v12];

  uint64_t v14 = [v7 attributeSet];
  v15 = [v14 contentDescription];
  v16 = [v10 detailTextLabel];
  [v16 setText:v15];

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
  id v13 = a3;
  id v6 = a4;
  int64_t v7 = [(PSSpotlightSearchResultsController *)self _itemForIndexPath:v6];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    objc_super v10 = [v7 uniqueIdentifier];
    uint64_t v11 = [v9 URLWithString:v10];

    uint64_t v12 = [(PSSpotlightSearchResultsController *)self delegate];
    [v12 searchResultsController:self didSelectURL:v11];
  }
  [v13 deselectRowAtIndexPath:v6 animated:0];
}

- (id)_itemForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PSSpotlightSearchResultsController *)self tableData];

  if (v5)
  {
    id v6 = [(PSSpotlightSearchResultsController *)self tableData];
    int64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (double)iconWidth
{
  if (iconWidth_onceToken_0 != -1) {
    dispatch_once(&iconWidth_onceToken_0, &__block_literal_global_31);
  }
  return *(double *)&iconWidth_iconWidth_0;
}

void __47__PSSpotlightSearchResultsController_iconWidth__block_invoke()
{
  PSBlankIconImage();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 size];
  *(double *)&iconWidth_iconWidth_0 = v0 + 15.0;
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PSSpotlightSearchResultsController;
  [(PSSpotlightSearchResultsController *)&v12 viewDidLayoutSubviews];
  uint64_t v3 = [(PSSpotlightSearchResultsController *)self view];
  [v3 directionalLayoutMargins];
  double v5 = v4;
  [(PSSpotlightSearchResultsController *)self iconWidth];
  double v7 = v5 + v6;

  id v8 = [(PSSpotlightSearchResultsController *)self tableView];
  [v8 separatorInset];
  double v10 = v9;

  if (v10 != v7)
  {
    uint64_t v11 = [(PSSpotlightSearchResultsController *)self tableView];
    objc_msgSend(v11, "setSeparatorInset:", 0.0, v7, 0.0, 0.0);
  }
}

- (void)_removeIconViewForSection:(id)a3
{
  id v5 = a3;
  double v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_iconViewMap, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NSMutableArray *)self->_reusableIconViews addObject:v4];
    [v4 removeFromSuperview];
    [(NSMutableDictionary *)self->_iconViewMap removeObjectForKey:v5];
  }
}

- (void)_updateIconViews:(BOOL)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v4 = [(NSMutableDictionary *)self->_iconViewMap allKeys];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v97 objects:v104 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v98 != v7) {
            objc_enumerationMutation(v4);
          }
          [(PSSpotlightSearchResultsController *)self _removeIconViewForSection:*(void *)(*((void *)&v97 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v97 objects:v104 count:16];
      }
      while (v6);
    }
  }
  double v9 = [(PSSpotlightSearchResultsController *)self tableView];
  [v9 contentOffset];
  double v11 = v10;
  objc_super v12 = [(PSSpotlightSearchResultsController *)self tableView];
  [v12 adjustedContentInset];
  double v14 = v13;

  v15 = [(PSSpotlightSearchResultsController *)self tableView];
  v16 = [v15 indexPathsForVisibleRows];

  id v17 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v16, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v94;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v94 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * j), "section"));
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v93 objects:v103 count:16];
    }
    while (v20);
  }
  id v79 = v18;

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v24 = v17;
  obuint64_t j = v24;
  uint64_t v84 = [v24 countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v84)
  {
    double v82 = v11 + v14;
    uint64_t v83 = *(void *)v90;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v90 != v83) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v89 + 1) + 8 * v25);
        uint64_t v27 = objc_msgSend(v26, "unsignedIntegerValue", v79);
        id v28 = [(PSSpotlightSearchResultsController *)self view];
        [v28 directionalLayoutMargins];
        double v30 = v29;

        [(PSSpotlightSearchResultsController *)self iconWidth];
        double v32 = v31;
        long long v33 = [(NSMutableDictionary *)self->_iconViewMap objectForKeyedSubscript:v26];
        long long v34 = [(PSSpotlightSearchResultsController *)self tableView];
        long long v35 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v27];
        [v34 rectForRowAtIndexPath:v35];
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;

        if (v33) {
          goto LABEL_23;
        }
        v63 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v27];
        long long v33 = [(PSSpotlightSearchResultsController *)self _itemForIndexPath:v63];

        v64 = [(PSSpotlightSearchResultsController *)self delegate];
        v65 = [v33 attributeSet];
        v66 = [v65 theme];
        v67 = [v64 searchResultsController:self iconForCategory:v66];

        if (!v67) {
          goto LABEL_31;
        }
        if ([(NSMutableArray *)self->_reusableIconViews count])
        {
          v68 = [(NSMutableArray *)self->_reusableIconViews objectAtIndexedSubscript:0];
          [(NSMutableArray *)self->_reusableIconViews removeObjectAtIndex:0];
        }
        else
        {
          v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v37, v39, v32, v41);
          [v68 setContentMode:4];
        }
        [v68 setImage:v67];
        v69 = [(PSSpotlightSearchResultsController *)self tableView];
        [v69 addSubview:v68];

        [(NSMutableDictionary *)self->_iconViewMap setObject:v68 forKeyedSubscript:v26];
        long long v33 = v68;
        if (v68)
        {
LABEL_23:
          v42 = [(PSSpotlightSearchResultsController *)self tableView];
          [v42 rectForSection:v27];
          CGFloat v44 = v43;
          double v46 = v45;
          CGFloat v48 = v47;
          CGFloat v50 = v49;

          [v33 frame];
          CGFloat v52 = v51;
          double v54 = v53;
          v106.origin.x = v44;
          v106.origin.y = v46;
          v106.size.double width = v48;
          v106.size.double height = v50;
          double MaxY = CGRectGetMaxY(v106);
          v107.origin.x = v30;
          v107.origin.y = v52;
          v107.size.double width = v54;
          v107.size.double height = v41;
          uint64_t v56 = (uint64_t)(MaxY - CGRectGetHeight(v107));
          double v57 = v82;
          if (v82 < v46) {
            double v57 = v46;
          }
          if (v56 >= (uint64_t)v57) {
            uint64_t v58 = (uint64_t)v57;
          }
          else {
            uint64_t v58 = v56;
          }
          v59 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v60 = [v59 userInterfaceLayoutDirection];

          if (v60 == 1)
          {
            v61 = [(PSSpotlightSearchResultsController *)self tableView];
            [v61 frame];
            double v30 = v62 - (v30 + v54);
          }
          objc_msgSend(v33, "setFrame:", v30, (double)v58, v54, v41);
LABEL_31:
        }
        ++v25;
      }
      while (v84 != v25);
      id v24 = obj;
      uint64_t v70 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
      uint64_t v84 = v70;
    }
    while (v70);
  }

  v71 = v79;
  if (!a3)
  {
    v72 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_iconViewMap];
    v73 = [v24 allObjects];
    [v72 removeObjectsForKeys:v73];

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v74 = v72;
    uint64_t v75 = [v74 countByEnumeratingWithState:&v85 objects:v101 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v86;
      do
      {
        for (uint64_t k = 0; k != v76; ++k)
        {
          if (*(void *)v86 != v77) {
            objc_enumerationMutation(v74);
          }
          -[PSSpotlightSearchResultsController _removeIconViewForSection:](self, "_removeIconViewForSection:", *(void *)(*((void *)&v85 + 1) + 8 * k), v79);
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v85 objects:v101 count:16];
      }
      while (v76);
    }

    id v24 = obj;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)tableViewDidFinishReload:(id)a3
{
}

- (void)searchQueryStarted
{
}

- (void)searchQueryFoundItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSSpotlightSearchResultsController *)self results];
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

  [(PSSpotlightSearchResultsController *)self setResults:v6];
  id v7 = [(PSSpotlightSearchResultsController *)self tableView];
  [v7 reloadData];
}

- (void)searchQueryCompleted
{
  id v2 = [(PSSpotlightSearchResultsController *)self tableView];
  [v2 reloadData];
}

- (void)selectPreviousSearchResult
{
  uint64_t v3 = [(PSSpotlightSearchResultsController *)self tableView];
  id v13 = [v3 indexPathForSelectedRow];

  id v4 = v13;
  if (v13)
  {
    uint64_t v5 = [v13 section];
    uint64_t v6 = [v13 row];
    uint64_t v7 = v6 - 1;
    if (v6 < 1)
    {
      BOOL v9 = v5-- < 1;
      id v4 = v13;
      if (v9) {
        goto LABEL_7;
      }
      double v10 = [(PSSpotlightSearchResultsController *)self tableView];
      uint64_t v11 = [v10 numberOfRowsInSection:v5] - 1;

      id v8 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v7 = v11;
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F28D58];
    }
    objc_super v12 = [v8 indexPathForRow:v7 inSection:v5];
    [(PSSpotlightSearchResultsController *)self _selectIndexPath:v12];

    id v4 = v13;
  }
LABEL_7:
}

- (void)selectNextSearchResult
{
  uint64_t v3 = [(PSSpotlightSearchResultsController *)self tableView];
  id v14 = [v3 indexPathForSelectedRow];

  if (v14)
  {
    uint64_t v4 = [v14 section];
    uint64_t v5 = [v14 row];
    uint64_t v6 = [(PSSpotlightSearchResultsController *)self tableView];
    uint64_t v7 = [v6 numberOfRowsInSection:v4] - 1;

    if (v5 >= v7)
    {
      uint64_t v11 = [(PSSpotlightSearchResultsController *)self tableView];
      uint64_t v12 = [v11 numberOfSections] - 1;

      if (v4 >= v12) {
        goto LABEL_8;
      }
      uint64_t v10 = v4 + 1;
      BOOL v9 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = v5 + 1;
      BOOL v9 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v10 = v4;
    }
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v13 = [v9 indexPathForRow:v8 inSection:v10];
  [(PSSpotlightSearchResultsController *)self _selectIndexPath:v13];

LABEL_8:
}

- (void)_selectIndexPath:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(PSSpotlightSearchResultsController *)self tableView];
  uint64_t v5 = [v4 indexPathsForVisibleRows];

  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 compare:v14];

  if (v7 == 1)
  {
    uint64_t v8 = [(PSSpotlightSearchResultsController *)self tableView];
    BOOL v9 = v8;
    id v10 = v14;
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v12 = [v5 lastObject];
    uint64_t v13 = [v12 compare:v14];

    uint64_t v8 = [(PSSpotlightSearchResultsController *)self tableView];
    BOOL v9 = v8;
    id v10 = v14;
    if (v13 == -1) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  [v8 selectRowAtIndexPath:v10 animated:1 scrollPosition:v11];
}

- (void)showSelectedSearchResult
{
  uint64_t v3 = [(PSSpotlightSearchResultsController *)self tableView];
  id v5 = [v3 indexPathForSelectedRow];

  if (v5)
  {
    uint64_t v4 = [(PSSpotlightSearchResultsController *)self tableView];
    [(PSSpotlightSearchResultsController *)self tableView:v4 didSelectRowAtIndexPath:v5];

    [(PSSpotlightSearchResultsController *)self _selectIndexPath:v5];
  }
}

- (NSArray)results
{
  return self->_results;
}

- (PSSpotlightSearchResultsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSpotlightSearchResultsControllerDelegate *)WeakRetained;
}

- (void)setTableData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_reusableIconViews, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

@end