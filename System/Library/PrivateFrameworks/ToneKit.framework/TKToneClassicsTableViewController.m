@interface TKToneClassicsTableViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBeShownFromSuspendedState;
- (TKToneClassicsTableViewController)initWithClassicTonesHeaderItem:(id)a3;
- (TKTonePickerTableViewControllerHelper)tonePickerTableViewControllerHelper;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)didReloadTones;
- (void)didUpdateCheckedStatus:(BOOL)a3 ofToneClassicsPickerItem:(id)a4;
- (void)didUpdateDetailText:(id)a3 ofToneClassicsPickerItem:(id)a4;
- (void)layoutMarginsDidChangeInTonePickerTableView:(id)a3;
- (void)loadView;
- (void)separatorColorDidChangeInTonePickerTableView:(id)a3;
- (void)setTonePickerTableViewControllerHelper:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TKToneClassicsTableViewController

- (TKToneClassicsTableViewController)initWithClassicTonesHeaderItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TKToneClassicsTableViewController;
  v6 = [(TKToneClassicsTableViewController *)&v10 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classicTonesHeaderItem, a3);
    v8 = TLLocalizedString();
    [(TKToneClassicsTableViewController *)v7 setTitle:v8];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v3 tonePickerTableViewControllerWillBeDeallocated:self];

  v4.receiver = self;
  v4.super_class = (Class)TKToneClassicsTableViewController;
  [(TKToneClassicsTableViewController *)&v4 dealloc];
}

- (void)setTonePickerTableViewControllerHelper:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tonePickerTableViewControllerHelper);
  objc_storeWeak((id *)&self->_tonePickerTableViewControllerHelper, v4);
  if ([(TKToneClassicsTableViewController *)self isViewLoaded]
    && (v4 != 0) == (WeakRetained == 0))
  {
    v6 = TLLogToneManagement();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543874;
      v9 = self;
      __int16 v10 = 2114;
      id v11 = WeakRetained;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_22107E000, v6, OS_LOG_TYPE_DEFAULT, "The tonePickerTableViewControllerHelper property of %{public}@ is being updated from %{public}@ to %{public}@. Reloading table view.", (uint8_t *)&v8, 0x20u);
    }

    v7 = [(TKToneClassicsTableViewController *)self tableView];
    [v7 reloadData];
  }
}

- (void)didReloadTones
{
  if ([(TKToneClassicsTableViewController *)self isViewLoaded])
  {
    id v3 = [(TKToneClassicsTableViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)didUpdateCheckedStatus:(BOOL)a3 ofToneClassicsPickerItem:(id)a4
{
  BOOL v4 = a3;
  v6 = (void *)MEMORY[0x263F088C8];
  id v7 = a4;
  objc_msgSend(v6, "indexPathForRow:inSection:", objc_msgSend(v7, "classicToneIndex"), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  int v8 = [(TKToneClassicsTableViewController *)self tableView];
  v9 = [v8 cellForRowAtIndexPath:v11];

  __int16 v10 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v10 updateCell:v9 withCheckedStatus:v4 forTonePickerItem:v7];
}

- (void)didUpdateDetailText:(id)a3 ofToneClassicsPickerItem:(id)a4
{
  v6 = (void *)MEMORY[0x263F088C8];
  id v7 = a3;
  objc_msgSend(v6, "indexPathForRow:inSection:", objc_msgSend(a4, "classicToneIndex"), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  int v8 = [(TKToneClassicsTableViewController *)self tableView];
  v9 = [v8 cellForRowAtIndexPath:v11];

  __int16 v10 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v10 updateCell:v9 withDetailText:v7];
}

- (void)loadView
{
  id v3 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v3 loadViewForTonePickerTableViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TKToneClassicsTableViewController;
  -[TKToneClassicsTableViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  id v5 = [(TKToneClassicsTableViewController *)self tableView];
  if (v5)
  {
    v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v6 lineHeight];
    [v5 setEstimatedRowHeight:ceil(v7 + v7)];

    [v5 setRowHeight:*MEMORY[0x263F1D600]];
  }
  int v8 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  v9 = [v8 selectedTonePickerItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    id v11 = [v10 parentItem];
    uint64_t v12 = [v11 section];
    if (v12 == [(TKPickerItem *)self->_classicTonesHeaderItem section])
    {
      uint64_t v13 = [v11 row];
      if (v13 == [(TKPickerRowItem *)self->_classicTonesHeaderItem row])
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "classicToneIndex"), 0);
        v15 = [(TKToneClassicsTableViewController *)self tableView];
        [v15 scrollToRowAtIndexPath:v14 atScrollPosition:2 animated:v3];
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TKToneClassicsTableViewController;
  -[TKToneClassicsTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  id v5 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v5 tonePickerTableViewWillDisappear:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)layoutMarginsDidChangeInTonePickerTableView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v4 indexPathsForVisibleRows];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v4 cellForRowAtIndexPath:v10];
        uint64_t v12 = -[TKTonePickerItem childItemAtIndex:](self->_classicTonesHeaderItem, "childItemAtIndex:", [v10 row]);
        [v5 tableView:v4 updateCell:v11 withSeparatorForPickerRowItem:v12];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)separatorColorDidChangeInTonePickerTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  [v5 updateDividerContentColorToMatchSeparatorColorInTableView:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  if (v5) {
    int64_t v6 = [(TKTonePickerItem *)self->_classicTonesHeaderItem numberOfChildren];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  if (!v8)
  {
    v9 = TLLogGeneral();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/iOS/TKToneClassicsTableViewController.m"];
      uint64_t v12 = TLLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v11 lastPathComponent];
        long long v14 = [MEMORY[0x263F08B88] callStackSymbols];
        int v54 = 136381443;
        v55 = (TKToneClassicsTableViewController *)"-[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]";
        __int16 v56 = 2113;
        id v57 = v13;
        __int16 v58 = 2049;
        uint64_t v59 = 183;
        __int16 v60 = 2113;
        v61 = v14;
        _os_log_impl(&dword_22107E000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v54, 0x2Au);
      }
    }
    else
    {
      id v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:](v11, v15, v16, v17, v18, v19, v20, v21);
      }
    }

    v22 = TLLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:].cold.4();
    }
  }
  v23 = -[TKTonePickerItem childItemAtIndex:](self->_classicTonesHeaderItem, "childItemAtIndex:", [v7 row]);
  if (!v23)
  {
    v24 = TLLogGeneral();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

    if (v25)
    {
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/iOS/TKToneClassicsTableViewController.m"];
      v27 = TLLogGeneral();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [v26 lastPathComponent];
        v29 = [MEMORY[0x263F08B88] callStackSymbols];
        int v54 = 136381443;
        v55 = (TKToneClassicsTableViewController *)"-[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]";
        __int16 v56 = 2113;
        id v57 = v28;
        __int16 v58 = 2049;
        uint64_t v59 = 185;
        __int16 v60 = 2113;
        v61 = v29;
        _os_log_impl(&dword_22107E000, v27, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v54, 0x2Au);
      }
    }
    else
    {
      v26 = TLLogGeneral();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:](v26, v30, v31, v32, v33, v34, v35, v36);
      }
    }

    v37 = TLLogGeneral();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]();
    }
  }
  v38 = [v8 tableView:v6 cellForPickerRowItem:v23];
  if (!v38)
  {
    v39 = TLLogGeneral();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

    if (v40)
    {
      v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/iOS/TKToneClassicsTableViewController.m"];
      v42 = TLLogGeneral();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [v41 lastPathComponent];
        v44 = [MEMORY[0x263F08B88] callStackSymbols];
        int v54 = 136381443;
        v55 = (TKToneClassicsTableViewController *)"-[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:]";
        __int16 v56 = 2113;
        id v57 = v43;
        __int16 v58 = 2049;
        uint64_t v59 = 187;
        __int16 v60 = 2113;
        v61 = v44;
        _os_log_impl(&dword_22107E000, v42, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v54, 0x2Au);
      }
    }
    else
    {
      v41 = TLLogGeneral();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[TKToneClassicsTableViewController tableView:cellForRowAtIndexPath:](v41, v45, v46, v47, v48, v49, v50, v51);
      }
    }

    v52 = TLLogGeneral();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      int v54 = 138543874;
      v55 = self;
      __int16 v56 = 2114;
      id v57 = v7;
      __int16 v58 = 2114;
      uint64_t v59 = (uint64_t)v23;
      _os_log_error_impl(&dword_22107E000, v52, OS_LOG_TYPE_ERROR, "%{public}@ is about to return a nil cell for row at index path %{public}@ with toneClassicsPickerItem = %{public}@.", (uint8_t *)&v54, 0x20u);
    }
  }

  return v38;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  classicTonesHeaderItem = self->_classicTonesHeaderItem;
  uint64_t v12 = [v8 row];

  uint64_t v13 = [(TKTonePickerItem *)classicTonesHeaderItem childItemAtIndex:v12];
  [v14 tableView:v10 willDisplayCell:v9 forPickerRowItem:v13];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TKToneClassicsTableViewController *)self tonePickerTableViewControllerHelper];
  id v8 = -[TKTonePickerItem childItemAtIndex:](self->_classicTonesHeaderItem, "childItemAtIndex:", [v6 row]);
  [v9 tableView:v7 didSelectRowAtIndexPath:v6 forPickerRowItem:v8];
}

- (TKTonePickerTableViewControllerHelper)tonePickerTableViewControllerHelper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tonePickerTableViewControllerHelper);

  return (TKTonePickerTableViewControllerHelper *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tonePickerTableViewControllerHelper);

  objc_storeStrong((id *)&self->_classicTonesHeaderItem, 0);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)tableView:(uint64_t)a3 cellForRowAtIndexPath:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22107E000, v0, v1, "%{public}@ unexpectedly found a nil toneClassicsPickerItem while generating cell for row at index path %{public}@.");
}

- (void)tableView:cellForRowAtIndexPath:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22107E000, v0, v1, "The tonePickerTableViewControllerHelper of %{public}@ was unexpectedly nil when UITableView requested the cell for row at index path %{public}@.");
}

@end