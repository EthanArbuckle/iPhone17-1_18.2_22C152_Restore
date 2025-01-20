@interface PXSuggesterDebugViewController
- (PXSuggesterDebugViewController)initWithName:(id)a3 options:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_stringWithSortCriteria:(unint64_t)a3;
- (id)assetsDataSourceManagerForSuggestion:(id)a3;
- (id)dateButton;
- (id)fullLibraryButton;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (id)showInvalidItemsButton;
- (id)sortButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchSuggestions;
- (void)_sortItems;
- (void)_updateToolbarItems;
- (void)configureCell:(id)a3 withItem:(id)a4;
- (void)didSelectDateButton:(id)a3;
- (void)didSelectFullLibraryButton:(id)a3;
- (void)didSelectShowInvalidItemsButton:(id)a3;
- (void)didSelectSortButton:(id)a3;
- (void)didStopProcessing;
- (void)refresh;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateShowInvalidItemsButton;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willStartProcessing;
@end

@implementation PXSuggesterDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_showInvalidItemsButton, 0);
  objc_storeStrong((id *)&self->_dateButton, 0);
  objc_storeStrong((id *)&self->_fullLibraryButton, 0);
  objc_storeStrong((id *)&self->_noResultLabel, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sortedItems, 0);
  objc_storeStrong((id *)&self->_heuristicallySortedItems, 0);
}

- (id)_stringWithSortCriteria:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 1) {
    v3 = @"Score";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Date";
  }
}

- (void)_sortItems
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = self->_heuristicallySortedItems;
  if (!self->_showsInvalidItems)
  {
    v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_56001];
    uint64_t v5 = [(NSArray *)v3 filteredArrayUsingPredicate:v4];

    v3 = (NSArray *)v5;
  }
  unint64_t currentSortCriteria = self->_currentSortCriteria;
  if (currentSortCriteria == 1)
  {
    objc_storeStrong((id *)&self->_sortedItems, v3);
  }
  else if (!currentSortCriteria)
  {
    v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(NSArray *)v3 sortedArrayUsingDescriptors:v8];
    sortedItems = self->_sortedItems;
    self->_sortedItems = v9;
  }
}

uint64_t __44__PXSuggesterDebugViewController__sortItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInvalid] ^ 1;
}

- (void)didSelectSortButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Sort Criteria" message:0 preferredStyle:0];
  v6 = [v5 popoverPresentationController];
  [v6 setBarButtonItem:v4];

  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    v10 = [(PXSuggesterDebugViewController *)self _stringWithSortCriteria:v7];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PXSuggesterDebugViewController_didSelectSortButton___block_invoke;
    v14[3] = &unk_1E5DB7860;
    v14[4] = self;
    v14[5] = v7;
    v11 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:0 handler:v14];
    v12 = v11;
    if (v7 == self->_currentSortCriteria) {
      [v11 _setChecked:1];
    }
    [v5 addAction:v12];

    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  v13 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v13];

  [(PXSuggesterDebugViewController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __54__PXSuggesterDebugViewController_didSelectSortButton___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1080) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _sortItems];
  v2 = *(void **)(a1 + 32);
  return [v2 refresh];
}

- (void)updateShowInvalidItemsButton
{
  if (self->_showsInvalidItems) {
    v2 = @"🚥";
  }
  else {
    v2 = @"✅";
  }
  [(UIBarButtonItem *)self->_showInvalidItemsButton setTitle:v2];
}

- (void)didSelectShowInvalidItemsButton:(id)a3
{
  self->_showsInvalidItems ^= 1u;
  [(PXSuggesterDebugViewController *)self updateShowInvalidItemsButton];
  [(PXSuggesterDebugViewController *)self _sortItems];
  [(PXSuggesterDebugViewController *)self refresh];
}

- (void)didSelectDateButton:(id)a3
{
  uint64_t v5 = objc_alloc_init(PXContextualMemoriesSettingsTableViewController);
  id v4 = [(PXSuggesterDebugViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)didSelectFullLibraryButton:(id)a3
{
  BOOL fullLibraryIsEnabled = self->_fullLibraryIsEnabled;
  self->_BOOL fullLibraryIsEnabled = !fullLibraryIsEnabled;
  if (fullLibraryIsEnabled)
  {
    [(UIBarButtonItem *)self->_fullLibraryButton setTintColor:0];
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "redColor", a3);
    [(UIBarButtonItem *)self->_fullLibraryButton setTintColor:v5];
  }
  [(PXSuggesterDebugViewController *)self willStartProcessing];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXSuggesterDebugViewController_didSelectFullLibraryButton___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__PXSuggesterDebugViewController_didSelectFullLibraryButton___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchSuggestions];
  v2 = *(void **)(a1 + 32);
  return [v2 didStopProcessing];
}

- (void)_updateToolbarItems
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v3 = [(PXSuggesterDebugViewController *)self fullLibraryButton];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v5 = [(PXSuggesterDebugViewController *)self dateButton];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v7 = [(PXSuggesterDebugViewController *)self showInvalidItemsButton];
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  char v9 = [(PXSuggesterDebugViewController *)self sortButton];
  v11[0] = v3;
  v11[1] = v4;
  void v11[2] = v5;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  v11[6] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];
  [(PXSuggesterDebugViewController *)self setToolbarItems:v10];
}

- (id)sortButton
{
  sortButton = self->_sortButton;
  if (!sortButton)
  {
    v13.width = 22.0;
    v13.height = 22.0;
    UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
    id v4 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.5, 0.5, 21.0, 21.0);
    [v4 stroke];

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 6.0, 7.0, 10.0, 1.0);
    [v5 fill];

    v6 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 7.0, 11.0, 8.0, 1.0);
    [v6 fill];

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 8.0, 15.0, 6.0, 1.0);
    [v7 fill];

    char v8 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    char v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v8 style:0 target:self action:sel_didSelectSortButton_];
    v10 = self->_sortButton;
    self->_sortButton = v9;

    sortButton = self->_sortButton;
  }
  return sortButton;
}

- (id)showInvalidItemsButton
{
  showInvalidItemsButton = self->_showInvalidItemsButton;
  if (!showInvalidItemsButton)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"💊" style:0 target:self action:sel_didSelectShowInvalidItemsButton_];
    uint64_t v5 = self->_showInvalidItemsButton;
    self->_showInvalidItemsButton = v4;

    showInvalidItemsButton = self->_showInvalidItemsButton;
  }
  return showInvalidItemsButton;
}

- (id)dateButton
{
  dateButton = self->_dateButton;
  if (!dateButton)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1F00B0030 style:0 target:self action:sel_didSelectDateButton_];
    uint64_t v5 = self->_dateButton;
    self->_dateButton = v4;

    dateButton = self->_dateButton;
  }
  return dateButton;
}

- (id)fullLibraryButton
{
  fullLibraryButton = self->_fullLibraryButton;
  if (!fullLibraryButton)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"∞" style:0 target:self action:sel_didSelectFullLibraryButton_];
    uint64_t v5 = self->_fullLibraryButton;
    self->_fullLibraryButton = v4;

    fullLibraryButton = self->_fullLibraryButton;
  }
  return fullLibraryButton;
}

- (void)_fetchSuggestions
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSDictionary *)self->_options mutableCopy];
  id v4 = v3;
  date = self->_date;
  if (date) {
    [v3 setObject:date forKeyedSubscript:@"localDate"];
  }
  if (self->_fullLibraryIsEnabled)
  {
    v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v4 setObject:v6 forKeyedSubscript:@"universalStartDate"];

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v4 setObject:v7 forKeyedSubscript:@"universalEndDate"];
  }
  char v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary", self);
  v24 = v4;
  char v9 = [MEMORY[0x1E4F39310] suggestionInfosWithOptions:v4 photoLibrary:v8];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v30[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v12 = [v9 sortedArrayUsingDescriptors:v11];

  CGSize v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v20 = [MEMORY[0x1E4F39310] transientSuggestionWithInfo:v19 photoLibrary:v8];
        v21 = [[PXSuggesterDebugCollectionItem alloc] initWithSuggestion:v20 suggestionInfo:v19];
        [v13 addObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  v22 = *(void **)(v23 + 1024);
  *(void *)(v23 + 1024) = v13;

  *(void *)(v23 + 1080) = 1;
  *(unsigned char *)(v23 + 1088) = 1;
  [(id)v23 updateShowInvalidItemsButton];
  [(id)v23 _sortItems];
  [(id)v23 refresh];
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  v6 = [v5 suggestion];
  [v21 setSuggestion:v6];

  uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
  if ([v5 isInvalid])
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] redColor];
  }
  else
  {
    char v9 = [v5 info];
    v10 = [v9 objectForKeyedSubscript:@"identicalExistingSuggestionInfo"];

    if (v10)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1618] greenColor];
    }
    else
    {
      v11 = [v5 info];
      v12 = [v11 objectForKeyedSubscript:@"suggestionsByCollisionReason"];
      uint64_t v13 = [v12 count];

      if (!v13) {
        goto LABEL_8;
      }
      uint64_t v8 = [MEMORY[0x1E4FB1618] orangeColor];
    }
  }
  id v14 = (void *)v8;

  uint64_t v7 = v14;
LABEL_8:
  uint64_t v15 = [v21 textLabel];
  uint64_t v16 = [v5 name];
  uint64_t v17 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  [v15 setText:v17];
  [v15 setTextColor:v7];
  v18 = [v21 detailTextLabel];
  uint64_t v19 = [v5 description];
  [v18 setText:v19];

  [v18 setTextColor:v7];
  [v18 sizeToFit];
  v20 = [v5 suggestion];
  [v21 setAccessoryType:4 * (v20 != 0)];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"SuggestersDebugTableViewCellIdentifier"];
  if (!v7)
  {
    uint64_t v7 = [[PXSuggesterDebugViewControllerCell alloc] initWithStyle:3 reuseIdentifier:@"SuggestersDebugTableViewCellIdentifier"];
    uint64_t v8 = [(PXSuggesterDebugViewControllerCell *)v7 detailTextLabel];
    [v8 setNumberOfLines:2];

    char v9 = [(PXSuggesterDebugViewControllerCell *)v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  v10 = -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", [v6 row]);
  [(PXSuggesterDebugViewController *)self configureCell:v7 withItem:v10];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_sortedItems count];
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  v3 = [(PXSuggesterDebugViewController *)self oneUpPresentationDataSourceManager:a3];
  id v4 = [v3 dataSource];
  id v5 = [v4 startingAssetReference];

  return v5;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  v3 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  return v3;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return [(PXSuggesterDebugViewController *)self assetsDataSourceManagerForSuggestion:self->_currentSuggestion];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4FB1678];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v13[3] = &unk_1E5DBF6A0;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [v8 configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];

  return v11;
}

id __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  v2 = (void *)MEMORY[0x1E4FB1970];
  v3 = (void *)MEMORY[0x1E4FB13F0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v9[3] = &unk_1E5DC9A58;
  id v10 = v1;
  id v4 = v1;
  id v5 = [v3 actionWithTitle:@"Persist" image:0 identifier:0 handler:v9];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = [v2 menuWithChildren:v6];

  return v7;
}

uint64_t __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) persist:0];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v11 suggestion];
  id v6 = (id)[MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v5 referenceAsset:0];
  id v7 = [PXSuggestionDebugViewController alloc];
  uint64_t v8 = [v11 info];
  id v9 = [(PXSuggestionDebugViewController *)v7 initWithSuggestion:v5 suggestionInfo:v8];

  id v10 = [(PXSuggesterDebugViewController *)self navigationController];
  objc_msgSend(v10, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v9, 1, 0, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v5 = [v4 description];
  uint64_t v6 = [v5 rangeOfString:@"\n"];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    double v7 = 44.0;
  }
  else {
    double v7 = 66.0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v8 suggestion];
  currentSuggestion = self->_currentSuggestion;
  self->_currentSuggestion = v5;

  [(UIViewController *)self px_enableOneUpPresentation];
  double v7 = [(UIViewController *)self px_oneUpPresentation];
  [v7 setDelegate:self];
  [v7 startWithConfigurationHandler:0];
}

- (id)assetsDataSourceManagerForSuggestion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F39008];
  id v14 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v14 count:1];
  double v7 = objc_msgSend(v3, "transientCollectionListWithCollections:title:", v6, 0, v14, v15);

  id v8 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v7 options:0];
  id v9 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v8 options:0];
  id v10 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v9];
  id v11 = [PXPhotoKitAssetsDataSourceManager alloc];

  v12 = [(PXPhotoKitAssetsDataSourceManager *)v11 initWithPhotosDataSource:v10];
  return v12;
}

- (void)refresh
{
  v3 = [(PXSuggesterDebugViewController *)self tableView];
  [v3 reloadData];

  id v5 = [(PXSuggesterDebugViewController *)self navigationItem];
  id v4 = [NSString stringWithFormat:@"(%d) %@", -[NSArray count](self->_sortedItems, "count"), self->_name];
  [v5 setTitle:v4];
}

- (void)didStopProcessing
{
  [(UIActivityIndicatorView *)self->_spinnerView stopAnimating];
  [(UILabel *)self->_noResultLabel setHidden:[(NSArray *)self->_sortedItems count] != 0];
  [(UIBarButtonItem *)self->_dateButton setEnabled:1];
  fullLibraryButton = self->_fullLibraryButton;
  [(UIBarButtonItem *)fullLibraryButton setEnabled:1];
}

- (void)willStartProcessing
{
  [(UIBarButtonItem *)self->_fullLibraryButton setEnabled:0];
  [(UIBarButtonItem *)self->_dateButton setEnabled:0];
  [(UILabel *)self->_noResultLabel setHidden:1];
  spinnerView = self->_spinnerView;
  [(UIActivityIndicatorView *)spinnerView startAnimating];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXSuggesterDebugViewController;
  [(PXSuggesterDebugViewController *)&v6 viewWillAppear:a3];
  [(PXSuggesterDebugViewController *)self willStartProcessing];
  id v4 = +[PXContextualMemoriesSettingsController sharedController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_1E5DB6320;
  v5[4] = self;
  [v4 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:v5];
}

void __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_2;
  v6[3] = &unk_1E5DD32A8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) date];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 1032)
    && (*(void **)(v3 + 1072) == v2
     || (char v4 = [*(id *)(v3 + 1072) isEqualToDate:v2], v3 = *(void *)(a1 + 40), (v4 & 1) != 0)))
  {
    [(id)v3 didStopProcessing];
  }
  else
  {
    objc_storeStrong((id *)(v3 + 1072), v2);
    id v5 = [MEMORY[0x1E4F28C10] localizedStringFromDate:*(void *)(*(void *)(a1 + 40) + 1072) dateStyle:1 timeStyle:0];
    [*(id *)(*(void *)(a1 + 40) + 1120) setTitle:v5];

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 1032);
    *(void *)(v6 + 1032) = MEMORY[0x1E4F1CBF0];

    [*(id *)(a1 + 40) refresh];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_3;
    block[3] = &unk_1E5DD36F8;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchSuggestions];
  v2 = *(void **)(a1 + 32);
  return [v2 didStopProcessing];
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)PXSuggesterDebugViewController;
  [(PXSuggesterDebugViewController *)&v53 viewDidLoad];
  name = self->_name;
  char v4 = [(PXSuggesterDebugViewController *)self navigationItem];
  [v4 setTitle:name];

  id v5 = [(PXSuggesterDebugViewController *)self tableView];
  [v5 setEstimatedRowHeight:44.0];

  uint64_t v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v6;

  uint64_t v8 = [MEMORY[0x1E4FB1618] grayColor];
  [(UIActivityIndicatorView *)self->_spinnerView setColor:v8];

  [(UIActivityIndicatorView *)self->_spinnerView bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  uint64_t v17 = [(PXSuggesterDebugViewController *)self view];
  [v17 bounds];
  double v19 = v18;
  [(UIActivityIndicatorView *)self->_spinnerView bounds];
  CGFloat v21 = (v19 - v20) * 0.5;
  v22 = [(PXSuggesterDebugViewController *)self view];
  [v22 bounds];
  double v24 = v23;
  [(UIActivityIndicatorView *)self->_spinnerView bounds];
  CGFloat v26 = (v24 - v25) * 0.5;
  v54.origin.x = v10;
  v54.origin.y = v12;
  v54.size.width = v14;
  v54.size.height = v16;
  CGRect v55 = CGRectOffset(v54, v21, v26);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);

  [(UIActivityIndicatorView *)self->_spinnerView setAutoresizingMask:45];
  [(UIActivityIndicatorView *)self->_spinnerView setHidesWhenStopped:1];
  long long v27 = [(PXSuggesterDebugViewController *)self view];
  [v27 addSubview:self->_spinnerView];

  id v28 = objc_alloc(MEMORY[0x1E4FB1930]);
  v29 = (UILabel *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  noResultLabel = self->_noResultLabel;
  self->_noResultLabel = v29;

  [(UILabel *)self->_noResultLabel setText:@"No Result"];
  v31 = [MEMORY[0x1E4FB08E0] systemFontOfSize:36.0 weight:*MEMORY[0x1E4FB09B8]];
  [(UILabel *)self->_noResultLabel setFont:v31];

  v32 = [MEMORY[0x1E4FB1618] grayColor];
  [(UILabel *)self->_noResultLabel setTextColor:v32];

  [(UILabel *)self->_noResultLabel setTextAlignment:1];
  [(UILabel *)self->_noResultLabel sizeToFit];
  [(UILabel *)self->_noResultLabel bounds];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  v41 = [(PXSuggesterDebugViewController *)self view];
  [v41 bounds];
  double v43 = v42;
  [(UILabel *)self->_noResultLabel bounds];
  CGFloat v45 = (v43 - v44) * 0.5;
  v46 = [(PXSuggesterDebugViewController *)self view];
  [v46 bounds];
  double v48 = v47;
  [(UILabel *)self->_noResultLabel bounds];
  CGFloat v50 = (v48 - v49) * 0.5;
  v56.origin.x = v34;
  v56.origin.y = v36;
  v56.size.width = v38;
  v56.size.height = v40;
  CGRect v57 = CGRectOffset(v56, v45, v50);
  -[UILabel setFrame:](self->_noResultLabel, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);

  [(UILabel *)self->_noResultLabel setAutoresizingMask:45];
  [(UILabel *)self->_noResultLabel setHidden:1];
  v51 = [(PXSuggesterDebugViewController *)self view];
  [v51 addSubview:self->_noResultLabel];

  [(PXSuggesterDebugViewController *)self _updateToolbarItems];
  v52 = [(PXSuggesterDebugViewController *)self navigationController];
  [v52 setToolbarHidden:0 animated:1];
}

- (PXSuggesterDebugViewController)initWithName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSuggesterDebugViewController;
  double v9 = [(PXSuggesterDebugViewController *)&v12 init];
  CGFloat v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

@end