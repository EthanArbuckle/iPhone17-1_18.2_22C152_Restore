@interface CACShortcutsSelectionTableViewController
- (AXSiriShortcut)previouslySelectedShortcut;
- (BOOL)_canShowWhileLocked;
- (CACShortcutsSelectionDelegate)shortcutsSelectionDelegate;
- (CACShortcutsSelectionTableViewController)initWithPreviouslySelectedShortcut:(id)a3;
- (NSArray)cachedShortcuts;
- (NSIndexPath)previouslySelectedIndex;
- (NSString)shortcutsToken;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonAction;
- (void)setCachedShortcuts:(id)a3;
- (void)setPreviouslySelectedIndex:(id)a3;
- (void)setPreviouslySelectedShortcut:(id)a3;
- (void)setShortcutsSelectionDelegate:(id)a3;
- (void)setShortcutsToken:(id)a3;
- (void)shortcutsDidChange:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACShortcutsSelectionTableViewController

- (CACShortcutsSelectionTableViewController)initWithPreviouslySelectedShortcut:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACShortcutsSelectionTableViewController;
  v6 = [(CACShortcutsSelectionTableViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_previouslySelectedShortcut, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CACShortcutsSelectionTableViewController;
  [(CACShortcutsSelectionTableViewController *)&v10 viewDidLoad];
  v3 = [(CACShortcutsSelectionTableViewController *)self tableView];
  [v3 setDelegate:self];

  v4 = [(CACShortcutsSelectionTableViewController *)self tableView];
  [v4 setDataSource:self];

  id v5 = [(CACShortcutsSelectionTableViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"ShortcutsCell"];

  v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonAction];
  v7 = [(CACShortcutsSelectionTableViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  v8 = [MEMORY[0x263F22958] sharedManager];
  objc_super v9 = [v8 shortcuts];
  [(CACShortcutsSelectionTableViewController *)self setCachedShortcuts:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CACShortcutsSelectionTableViewController;
  [(CACShortcutsSelectionTableViewController *)&v10 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4 = [MEMORY[0x263F22958] sharedManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CACShortcutsSelectionTableViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_264D11940;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 registerShortcutsDidChangeBlock:v7];
  shortcutsToken = self->_shortcutsToken;
  self->_shortcutsToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__CACShortcutsSelectionTableViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5) {
    id v4 = v5;
  }
  else {
    id v4 = (id)MEMORY[0x263EFFA68];
  }
  [WeakRetained shortcutsDidChange:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F22958] sharedManager];
  v6 = [(CACShortcutsSelectionTableViewController *)self shortcutsToken];
  [v5 unregisterShortcutsDidChangeBlock:v6];

  [(CACShortcutsSelectionTableViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_6];
  v7.receiver = self;
  v7.super_class = (Class)CACShortcutsSelectionTableViewController;
  [(CACShortcutsSelectionTableViewController *)&v7 viewWillDisappear:v3];
}

void __62__CACShortcutsSelectionTableViewController_viewWillDisappear___block_invoke()
{
  v0 = CACLogShortcuts();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_238377000, v0, OS_LOG_TYPE_DEFAULT, "View disappeared. Dismissing.", v1, 2u);
  }
}

- (void)cancelButtonAction
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__CACShortcutsSelectionTableViewController_cancelButtonAction__block_invoke;
  v2[3] = &unk_264D115D0;
  v2[4] = self;
  [(CACShortcutsSelectionTableViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __62__CACShortcutsSelectionTableViewController_cancelButtonAction__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) shortcutsSelectionDelegate];
  [v1 didSelectShortcut:0];

  v2 = CACLogShortcuts();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_238377000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling selection of shortcut", v3, 2u);
  }
}

- (void)setCachedShortcuts:(id)a3
{
  id v4 = (NSArray *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  cachedShortcuts = v5->_cachedShortcuts;
  v5->_cachedShortcuts = v4;
  objc_super v7 = v4;

  objc_sync_exit(v5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CACShortcutsSelectionTableViewController_setCachedShortcuts___block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__CACShortcutsSelectionTableViewController_setCachedShortcuts___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)shortcutsDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CACLogShortcuts();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_238377000, v5, OS_LOG_TYPE_DEFAULT, "New shortcuts %@", (uint8_t *)&v6, 0xCu);
  }

  [(CACShortcutsSelectionTableViewController *)self setCachedShortcuts:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(CACShortcutsSelectionTableViewController *)self cachedShortcuts];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ShortcutsCell" forIndexPath:v6];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:@"ShortcutsCell"];
  }
  uint64_t v8 = [(CACShortcutsSelectionTableViewController *)self cachedShortcuts];
  objc_super v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  objc_super v10 = [v9 shortcutName];
  v11 = [v7 textLabel];
  [v11 setText:v10];

  v12 = NSString;
  v13 = [v9 shortcutName];
  v14 = [v12 stringWithFormat:@"\"%@\"", v13];
  v15 = [v7 detailTextLabel];
  [v15 setText:v14];

  v16 = [v9 identifier];
  v17 = [(CACShortcutsSelectionTableViewController *)self previouslySelectedShortcut];
  v18 = [v17 identifier];

  if (v16 == v18)
  {
    [v7 setAccessoryType:3];
    [(CACShortcutsSelectionTableViewController *)self setPreviouslySelectedIndex:v6];
  }
  else
  {
    [v7 setAccessoryType:0];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CACShortcutsSelectionTableViewController *)self previouslySelectedIndex];
  objc_super v9 = [v7 cellForRowAtIndexPath:v8];

  [v9 setAccessoryType:0];
  objc_super v10 = [v7 cellForRowAtIndexPath:v6];

  [v10 setAccessoryType:3];
  v11 = [(CACShortcutsSelectionTableViewController *)self cachedShortcuts];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  v14 = [(CACShortcutsSelectionTableViewController *)self shortcutsSelectionDelegate];
  [v14 didSelectShortcut:v13];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__CACShortcutsSelectionTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_264D115D0;
  id v17 = v13;
  id v15 = v13;
  [(CACShortcutsSelectionTableViewController *)self dismissViewControllerAnimated:1 completion:v16];
}

void __78__CACShortcutsSelectionTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = CACLogShortcuts();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_238377000, v2, OS_LOG_TYPE_DEFAULT, "Selected shortcut %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACShortcutsSelectionDelegate)shortcutsSelectionDelegate
{
  return self->_shortcutsSelectionDelegate;
}

- (void)setShortcutsSelectionDelegate:(id)a3
{
}

- (NSArray)cachedShortcuts
{
  return self->_cachedShortcuts;
}

- (AXSiriShortcut)previouslySelectedShortcut
{
  return self->_previouslySelectedShortcut;
}

- (void)setPreviouslySelectedShortcut:(id)a3
{
}

- (NSIndexPath)previouslySelectedIndex
{
  return self->_previouslySelectedIndex;
}

- (void)setPreviouslySelectedIndex:(id)a3
{
}

- (NSString)shortcutsToken
{
  return self->_shortcutsToken;
}

- (void)setShortcutsToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsToken, 0);
  objc_storeStrong((id *)&self->_previouslySelectedIndex, 0);
  objc_storeStrong((id *)&self->_previouslySelectedShortcut, 0);
  objc_storeStrong((id *)&self->_cachedShortcuts, 0);
  objc_storeStrong((id *)&self->_shortcutsSelectionDelegate, 0);
}

@end