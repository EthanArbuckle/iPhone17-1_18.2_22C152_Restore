@interface CloudTabsViewController
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (CloudTabsViewController)initWithDeviceProvider:(id)a3 primaryDeviceUUID:(id)a4 profileIdentifier:(id)a5;
- (CloudTabsViewControllerDelegate)delegate;
- (LinkPreviewProvider)linkPreviewProvider;
- (TabGroupProvider)tabGroupProvider;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_deviceForIndexPath:(id)a3;
- (id)_filteredTabsInSection:(int64_t)a3;
- (id)_tabForIndexPath:(id)a3;
- (id)_urlForRowAtIndexPath:(id)a3;
- (id)previewTableViewController:(id)a3 URLForRowAtIndexPath:(id)a4;
- (id)previewTableViewController:(id)a3 menuForRowAtIndexPath:(id)a4;
- (id)safari_tableViewForScrollPositionSaving;
- (id)safari_tableViewScrollPositionSaveIdentifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_delayReloadTimerFired;
- (void)_deleteRowAtIndexPath:(id)a3;
- (void)_loadDevices;
- (void)_reloadDevicesAndTable;
- (void)_updateContentUnavailableConfiguration;
- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setTabGroupProvider:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CloudTabsViewController

- (CloudTabsViewController)initWithDeviceProvider:(id)a3 primaryDeviceUUID:(id)a4 profileIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CloudTabsViewController;
  v12 = [(CloudTabsViewController *)&v22 init];
  if (v12)
  {
    v13 = startPageTitleForCollectionType(@"CloudTabsCollection");
    [(CloudTabsViewController *)v12 setTitle:v13];

    id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v15 = _WBSLocalizedString();
    v16 = (void *)[v14 initWithTitle:v15 style:2 target:v12 action:sel_dismiss];
    v17 = [(CloudTabsViewController *)v12 navigationItem];
    [v17 setRightBarButtonItem:v16];

    [v9 addCloudTabsObserver:v12];
    objc_storeStrong((id *)&v12->_deviceProvider, a3);
    objc_storeStrong((id *)&v12->_primaryDeviceUUID, a4);
    uint64_t v18 = [v11 copy];
    profileIdentifier = v12->_profileIdentifier;
    v12->_profileIdentifier = (NSString *)v18;

    v12->_onlyShowsPrimaryDevice = v10 != 0;
    [(CloudTabsViewController *)v12 _loadDevices];
    v20 = v12;
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CloudTabsViewController;
  [(CloudTabsViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  objc_super v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CloudTabsViewController *)self setView:v4];

  v5 = [(CloudTabsViewController *)self view];
  [v5 setAutoresizingMask:18];

  v6 = [[PreviewTableViewController alloc] initWithStyle:2];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v6;

  [(PreviewTableViewController *)self->_tableViewController setPreviewDelegate:self];
  v8 = [(CloudTabsViewController *)self linkPreviewProvider];
  [(PreviewTableViewController *)self->_tableViewController setLinkPreviewProvider:v8];

  id v9 = [(PreviewTableViewController *)self->_tableViewController tableView];
  tableView = self->_tableView;
  self->_tableView = v9;

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"CloudTabsTable"];
  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDragDelegate:self];
  +[PageTitleAndAddressTableViewCell defaultHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(UITableView *)self->_tableView setSectionHeaderHeight:0.0];
  [(UITableView *)self->_tableView setSectionFooterHeight:0.0];
  [(CloudTabsViewController *)self addChildViewController:self->_tableViewController];
  id v11 = [(CloudTabsViewController *)self view];
  [v11 addSubview:self->_tableView];

  v12 = self->_tableViewController;
  [(PreviewTableViewController *)v12 didMoveToParentViewController:self];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)CloudTabsViewController;
  [(CloudTabsViewController *)&v13 viewDidLoad];
  id v3 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  searchController = self->_searchController;
  self->_searchController = v3;

  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
  [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
  primaryDeviceUUID = self->_primaryDeviceUUID;
  v6 = self->_searchController;
  if (primaryDeviceUUID)
  {
    [(UISearchController *)v6 setScopeBarActivation:3];
  }
  else
  {
    v7 = [(UISearchController *)v6 searchBar];
    [v7 setShowsScopeBar:0];
  }
  [(UISearchController *)self->_searchController setHidesNavigationBarDuringPresentation:primaryDeviceUUID != 0];
  v8 = _WBSLocalizedString();
  id v9 = [(UISearchController *)self->_searchController searchBar];
  [v9 setPlaceholder:v8];

  id v10 = [(CloudTabsViewController *)self navigationItem];
  [v10 setHidesSearchBarWhenScrolling:0];

  id v11 = self->_searchController;
  v12 = [(CloudTabsViewController *)self navigationItem];
  [v12 setSearchController:v11];

  [(CloudTabsViewController *)self _reloadDevicesAndTable];
}

- (void)_updateContentUnavailableConfiguration
{
  if ([(CloudTabsViewController *)self numberOfSectionsInTableView:self->_tableView] < 1)
  {
LABEL_5:
    if ([(NSArray *)self->_devices count] && [(NSString *)self->_userTypedFilter length])
    {
      objc_super v4 = [MEMORY[0x1E4FB1658] searchConfiguration];
      v5 = [(UISearchController *)self->_searchController _contentUnavailableConfigurationState];
      v6 = [v4 updatedConfigurationForState:v5];

      if (self->_onlyShowsPrimaryDevice)
      {
        v7 = _WBSLocalizedString();
        v8 = [v6 buttonProperties];
        id v9 = [v8 configuration];
        [v9 setTitle:v7];

        objc_initWeak(&location, self);
        id v10 = (void *)MEMORY[0x1E4FB13F0];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __65__CloudTabsViewController__updateContentUnavailableConfiguration__block_invoke;
        v17[3] = &unk_1E6D78C18;
        objc_copyWeak(&v18, &location);
        id v11 = [v10 actionWithHandler:v17];
        v12 = [v6 buttonProperties];
        [v12 setPrimaryAction:v11];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      [(CloudTabsViewController *)self _setContentUnavailableConfiguration:v6];
    }
    else
    {
      id v16 = [MEMORY[0x1E4FB1658] emptyExtraProminentConfiguration];
      objc_super v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud"];
      [v16 setImage:v13];

      id v14 = _WBSLocalizedString();
      [v16 setText:v14];

      [(WBSCloudTabDeviceProvider *)self->_deviceProvider cloudTabsAreEnabled];
      v15 = _WBSLocalizedString();
      [v16 setSecondaryText:v15];

      [(CloudTabsViewController *)self _setContentUnavailableConfiguration:v16];
    }
  }
  else
  {
    uint64_t v3 = 0;
    while (![(CloudTabsViewController *)self tableView:self->_tableView numberOfRowsInSection:v3])
    {
      if (++v3 >= [(CloudTabsViewController *)self numberOfSectionsInTableView:self->_tableView])goto LABEL_5; {
    }
      }
    [(CloudTabsViewController *)self _setContentUnavailableConfiguration:0];
  }
}

void __65__CloudTabsViewController__updateContentUnavailableConfiguration__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    v2 = [WeakRetained[132] searchBar];
    [v2 setSelectedScopeButtonIndex:1];

    [v3 updateSearchResultsForSearchController:v3[132]];
    WeakRetained = v3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CloudTabsViewController;
  [(CloudTabsViewController *)&v4 viewWillAppear:a3];
  [(CloudTabsViewController *)self _updateContentUnavailableConfiguration];
  if (!self->_onlyShowsPrimaryDevice) {
    -[UIViewController safari_restoreTableViewScrollPosition](self);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CloudTabsViewController;
  [(CloudTabsViewController *)&v4 viewWillDisappear:a3];
  if (!self->_onlyShowsPrimaryDevice) {
    -[UIViewController safari_saveTableViewScrollPosition](self);
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
}

- (void)dismiss
{
}

- (void)_loadDevices
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WBSCloudTabDeviceProvider *)self->_deviceProvider syncedRemoteCloudTabDevicesForProfileWithIdentifier:self->_profileIdentifier];
  devices = self->_devices;
  self->_devices = v3;

  v5 = startPageTitleForCollectionType(@"CloudTabsCollection");
  if (self->_onlyShowsPrimaryDevice)
  {
    v6 = self->_devices;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__CloudTabsViewController__loadDevices__block_invoke;
    v19[3] = &unk_1E6D7BE88;
    v19[4] = self;
    v7 = [(NSArray *)v6 safari_firstObjectPassingTest:v19];
    if (v7)
    {
      v8 = NSString;
      id v9 = _WBSLocalizedString();
      id v10 = [v7 name];
      id v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
      [(CloudTabsViewController *)self setTitle:v11];

      v21[0] = v7;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      objc_super v13 = self->_devices;
      self->_devices = v12;

      id v14 = [v7 name];
      v20[0] = v14;
      v15 = _WBSLocalizedString();
      v20[1] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      v17 = [(UISearchController *)self->_searchController searchBar];
      [v17 setScopeButtonTitles:v16];
    }
    else
    {
      id v18 = self->_devices;
      self->_devices = (NSArray *)MEMORY[0x1E4F1CBF0];

      [(CloudTabsViewController *)self setTitle:v5];
    }
  }
  else
  {
    [(CloudTabsViewController *)self setTitle:v5];
  }
}

uint64_t __39__CloudTabsViewController__loadDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(*(void *)(a1 + 32) + 992)];

  return v4;
}

- (void)_delayReloadTimerFired
{
  [(NSTimer *)self->_delayReloadTimer invalidate];
  delayReloadTimer = self->_delayReloadTimer;
  self->_delayReloadTimer = 0;

  [(CloudTabsViewController *)self _reloadDevicesAndTable];
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  if (WBSIsEqual())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__CloudTabsViewController_cloudTabDeviceProvider_didUpdateCloudTabsInProfileWithIdentifier___block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __92__CloudTabsViewController_cloudTabDeviceProvider_didUpdateCloudTabsInProfileWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDevicesAndTable];
}

- (void)_reloadDevicesAndTable
{
  if (![(NSTimer *)self->_delayReloadTimer isValid])
  {
    [(CloudTabsViewController *)self _loadDevices];
    [(UITableView *)self->_tableView reloadData];
    [(CloudTabsViewController *)self _updateContentUnavailableConfiguration];
  }
}

- (id)_deviceForIndexPath:(id)a3
{
  devices = self->_devices;
  uint64_t v4 = [a3 section];
  return [(NSArray *)devices objectAtIndexedSubscript:v4];
}

- (id)_filteredTabsInSection:(int64_t)a3
{
  uint64_t v4 = [(NSArray *)self->_devices objectAtIndexedSubscript:a3];
  v5 = [v4 tabs];

  if ([(NSString *)self->_userTypedFilter length])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CloudTabsViewController__filteredTabsInSection___block_invoke;
    v9[3] = &unk_1E6D7BEB0;
    v9[4] = self;
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v9);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v5;
  }
  v7 = v6;

  return v7;
}

uint64_t __50__CloudTabsViewController__filteredTabsInSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1072) cloudTabsViewController:*(void *)(a1 + 32) tabItem:a2 matchesSearchText:*(void *)(*(void *)(a1 + 32) + 1016)];
}

- (id)_tabForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[CloudTabsViewController _filteredTabsInSection:](self, "_filteredTabsInSection:", [v4 section]);
  uint64_t v6 = [v4 row];

  v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v8 = [a3 searchBar];
  id v4 = [v8 text];
  if (self->_primaryDeviceUUID) {
    BOOL v5 = [v8 selectedScopeButtonIndex] == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (self->_onlyShowsPrimaryDevice != v5 || (WBSIsEqual() & 1) == 0)
  {
    self->_onlyShowsPrimaryDevice = v5;
    uint64_t v6 = (NSString *)[v4 copy];
    userTypedFilter = self->_userTypedFilter;
    self->_userTypedFilter = v6;

    [(CloudTabsViewController *)self _reloadDevicesAndTable];
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4 = 10.0;
  if (!self->_onlyShowsPrimaryDevice)
  {
    BOOL v5 = [(CloudTabsViewController *)self _filteredTabsInSection:a4];
    if ([v5 count]) {
      double v4 = *MEMORY[0x1E4FB2F28];
    }
    else {
      double v4 = 2.22507386e-308;
    }
  }
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4 = [(CloudTabsViewController *)self _filteredTabsInSection:a4];
  if ([v4 count]) {
    double v5 = 20.0;
  }
  else {
    double v5 = 2.22507386e-308;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_devices count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (self->_onlyShowsPrimaryDevice
    || ([(CloudTabsViewController *)self _filteredTabsInSection:a4],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    double v4 = 0;
  }
  else
  {
    id v9 = [(NSArray *)self->_devices objectAtIndexedSubscript:a4];
    double v4 = [v9 name];
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = [(NSArray *)self->_devices count];
  if (result)
  {
    v7 = [(CloudTabsViewController *)self _filteredTabsInSection:a4];
    int64_t v8 = [v7 count];

    return v8;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v7 = [(CloudTabsViewController *)self _tabForIndexPath:a4];
  int64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"CloudTabReuseIdentifier"];

  if (!v8) {
    int64_t v8 = [[PageTitleAndAddressTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"CloudTabReuseIdentifier"];
  }
  id v9 = [v7 title];
  -[UITableViewCell safari_setLinkedPageTitle:description:](v8, v9, 0);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = [(CloudTabsViewController *)self _tabForIndexPath:a4];
  double v5 = [MEMORY[0x1E4F78598] builder];
  id v6 = [v5 navigationIntentWithCloudTab:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [WeakRetained handleNavigationIntent:v6 completion:0];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  double v4 = [(CloudTabsViewController *)self _deviceForIndexPath:a4];
  unsigned int v5 = [v4 isCloseRequestSupported];

  return v5;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)_WBSLocalizedString();
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)_deleteRowAtIndexPath:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(CloudTabsViewController *)self _deviceForIndexPath:v4];
  id v6 = [(CloudTabsViewController *)self _tabForIndexPath:v4];
  [(NSTimer *)self->_delayReloadTimer invalidate];
  v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__delayReloadTimerFired selector:0 userInfo:0 repeats:0.35];
  delayReloadTimer = self->_delayReloadTimer;
  self->_delayReloadTimer = v7;

  if ([(WBSCloudTabDeviceProvider *)self->_deviceProvider closeTab:v6 onDevice:v5])
  {
    id v9 = [v5 tabs];
    uint64_t v10 = [v9 count];

    [(CloudTabsViewController *)self _loadDevices];
    tableView = self->_tableView;
    if (v10 == 1)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v4, "section"));
      [(UITableView *)tableView deleteSections:v12 withRowAnimation:100];
    }
    else
    {
      v13[0] = v4;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [(UITableView *)tableView deleteRowsAtIndexPaths:v12 withRowAnimation:100];
    }
  }
  else
  {
    [(UITableView *)self->_tableView setEditing:0 animated:1];
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PreviewTableViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](self->_tableViewController, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", a3, a4, a5.x, a5.y);
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return [(PreviewTableViewController *)self->_tableViewController tableView:a3 previewForHighlightingContextMenuWithConfiguration:a4];
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return [(PreviewTableViewController *)self->_tableViewController tableView:a3 previewForDismissingContextMenuWithConfiguration:a4];
}

- (id)safari_tableViewForScrollPositionSaving
{
  return self->_tableView;
}

- (id)safari_tableViewScrollPositionSaveIdentifier
{
  return @"CloudTabsCollection";
}

- (id)_urlForRowAtIndexPath:(id)a3
{
  uint64_t v3 = [(CloudTabsViewController *)self _tabForIndexPath:a3];
  id v4 = [v3 url];

  return v4;
}

- (id)previewTableViewController:(id)a3 URLForRowAtIndexPath:(id)a4
{
  return [(CloudTabsViewController *)self _urlForRowAtIndexPath:a4];
}

- (id)previewTableViewController:(id)a3 menuForRowAtIndexPath:(id)a4
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v6 = a4;
  v35 = [MEMORY[0x1E4F1CA48] array];
  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(CloudTabsViewController *)self _urlForRowAtIndexPath:v6];
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
    id v11 = _WBSLocalizedString();
    v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke;
    v46[3] = &unk_1E6D78F48;
    id v13 = v9;
    id v47 = v13;
    id v14 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v46];
    [v35 addObject:v14];

    objc_initWeak(&location, self);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2;
    v42[3] = &unk_1E6D7BED8;
    objc_copyWeak(&v44, &location);
    id v15 = v13;
    id v43 = v15;
    id v16 = (void *)MEMORY[0x1E4E42950](v42);
    v17 = (void *)MEMORY[0x1E4FB13F0];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_3;
    v40[3] = &unk_1E6D77E70;
    id v18 = v16;
    id v41 = v18;
    v19 = objc_msgSend(v17, "_sf_openInNewTabActionWithHandler:", v40);
    [v7 addObject:v19];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_4;
    v38[3] = &unk_1E6D77E70;
    id v21 = v18;
    id v39 = v21;
    objc_super v22 = [WeakRetained openInTabGroupMenuWithNewTabGroupName:0 URL:v15 descendantCount:0 handler:v38];
    [v7 addObject:v22];

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  if ([(CloudTabsViewController *)self tableView:self->_tableView editingStyleForRowAtIndexPath:v6] == 1)
  {
    v23 = (void *)MEMORY[0x1E4FB13F0];
    v24 = _WBSLocalizedString();
    v25 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_5;
    v36[3] = &unk_1E6D7BF00;
    v36[4] = self;
    id v37 = v6;
    v26 = [v23 actionWithTitle:v24 image:v25 identifier:0 handler:v36];

    [v26 setAttributes:2];
    [v8 addObject:v26];
  }
  v27 = (void *)MEMORY[0x1E4FB1970];
  v28 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v35];
  v48[0] = v28;
  v29 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v7];
  v48[1] = v29;
  v30 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v8];
  v48[2] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  v32 = [v27 menuWithTitle:&stru_1F3C268E8 children:v31];

  return v32;
}

void __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setURL:v1];
}

void __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    unsigned int v5 = [MEMORY[0x1E4F78598] builder];
    [v5 setPreferredTabOrder:a2];
    [v5 setPrefersOpenInNewTab:1];
    id v6 = [v5 navigationIntentWithHistoryURL:*(void *)(a1 + 32)];
    id v7 = objc_loadWeakRetained(v9 + 136);
    [v7 dispatchNavigationIntent:v6];

    if ([v6 shouldOrderToForeground])
    {
      id v8 = objc_loadWeakRetained(v9 + 137);
      [v8 removeSingleBlankTabFromActiveTabGroup];
    }
    id WeakRetained = v9;
  }
}

uint64_t __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__CloudTabsViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteRowAtIndexPath:*(void *)(a1 + 40)];
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F28D78];
  id v7 = a5;
  id v8 = [v6 alloc];
  id v9 = [(CloudTabsViewController *)self _urlForRowAtIndexPath:v7];

  uint64_t v10 = (void *)[v8 initWithContentsOfURL:v9];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v10];
  v14[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v12;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (CloudTabsViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CloudTabsViewControllerDelegate *)a3;
}

- (LinkPreviewProvider)linkPreviewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  return (LinkPreviewProvider *)WeakRetained;
}

- (void)setLinkPreviewProvider:(id)a3
{
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  return (TabGroupProvider *)WeakRetained;
}

- (void)setTabGroupProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_storeStrong((id *)&self->_delayReloadTimer, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_userTypedFilter, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryDeviceUUID, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
}

@end