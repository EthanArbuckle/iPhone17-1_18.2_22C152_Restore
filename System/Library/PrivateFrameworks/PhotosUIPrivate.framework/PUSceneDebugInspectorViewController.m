@interface PUSceneDebugInspectorViewController
+ (BOOL)_isAscendingForSortOrder:(unint64_t)a3;
+ (id)_assetGridViewControllerForViewModel:(id)a3 interfaceIdiom:(int64_t)a4;
+ (id)_commaSeparatedValueRepresentation:(id)a3;
+ (id)_keyForSortOrder:(unint64_t)a3;
+ (id)_sectionTitleForSceneViewModel:(id)a3 sortOrder:(unint64_t)a4;
+ (id)_shortTitlesForSectionTitles:(id)a3 SortOrder:(unint64_t)a4;
+ (id)_sortedSceneViewModels:(id)a3 sortOrder:(unint64_t)a4;
+ (id)_titleForSortOrder:(unint64_t)a3;
+ (id)highestConfidenceForAsset:(id)a3 sceneIdentifier:(id)a4;
- (NSArray)currentSceneViewModels;
- (NSArray)groupedSceneViewModelTitles;
- (NSArray)sceneViewModelsAll;
- (NSArray)sceneViewModelsSearched;
- (NSDictionary)groupedSceneViewModels;
- (UIBarButtonItem)shareButton;
- (UIBarButtonItem)sortButton;
- (UIView)loadingContentView;
- (id)sceneTaxonomy;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadTableViewByGroupingViewModels:(id)a3 sortOrder:(unint64_t)a4;
- (void)didSelectDoneButton:(id)a3;
- (void)didSelectShareButton:(id)a3;
- (void)didSelectSortButton:(id)a3;
- (void)setGroupedSceneViewModelTitles:(id)a3;
- (void)setGroupedSceneViewModels:(id)a3;
- (void)setSceneViewModelsAll:(id)a3;
- (void)setSceneViewModelsSearched:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUSceneDebugInspectorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedSceneViewModelTitles, 0);
  objc_storeStrong((id *)&self->_groupedSceneViewModels, 0);
  objc_storeStrong((id *)&self->_sceneViewModelsSearched, 0);
  objc_storeStrong((id *)&self->_sceneViewModelsAll, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_loadingContentView, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

- (void)setGroupedSceneViewModelTitles:(id)a3
{
}

- (NSArray)groupedSceneViewModelTitles
{
  return self->_groupedSceneViewModelTitles;
}

- (void)setGroupedSceneViewModels:(id)a3
{
}

- (NSDictionary)groupedSceneViewModels
{
  return self->_groupedSceneViewModels;
}

- (void)setSceneViewModelsSearched:(id)a3
{
}

- (NSArray)sceneViewModelsSearched
{
  return self->_sceneViewModelsSearched;
}

- (void)setSceneViewModelsAll:(id)a3
{
}

- (NSArray)sceneViewModelsAll
{
  return self->_sceneViewModelsAll;
}

- (void)didSelectShareButton:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(PUSceneDebugInspectorViewController *)self currentSceneViewModels];
  v7 = [v5 _commaSeparatedValueRepresentation:v6];

  v8 = [v7 dataUsingEncoding:4];
  v9 = NSTemporaryDirectory();
  v10 = [v9 stringByAppendingPathComponent:@"Scenes.csv"];

  v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  [v8 writeToURL:v11 atomically:1];
  id v12 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v23[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v14 = (void *)[v12 initWithActivityItems:v13 applicationActivities:0];

  v15 = [v14 popoverPresentationController];
  [v15 setBarButtonItem:v4];

  uint64_t v16 = *MEMORY[0x1E4F9F398];
  v22[0] = *MEMORY[0x1E4F9F390];
  v22[1] = v16;
  uint64_t v17 = *MEMORY[0x1E4F9F3A8];
  v22[2] = *MEMORY[0x1E4F9F3A0];
  v22[3] = v17;
  uint64_t v18 = *MEMORY[0x1E4F9F3B8];
  v22[4] = *MEMORY[0x1E4F9F3B0];
  v22[5] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6];
  [v14 setExcludedActivityTypes:v19];

  v20 = [(PUSceneDebugInspectorViewController *)self presentedViewController];

  if (v20)
  {
    v21 = [(PUSceneDebugInspectorViewController *)self presentedViewController];
    [v21 presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    [(PUSceneDebugInspectorViewController *)self presentViewController:v14 animated:1 completion:0];
  }
}

- (UIBarButtonItem)shareButton
{
  shareButton = self->_shareButton;
  if (!shareButton)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel_didSelectShareButton_];
    v5 = self->_shareButton;
    self->_shareButton = v4;

    [(UIBarButtonItem *)self->_shareButton setEnabled:0];
    shareButton = self->_shareButton;
  }
  return shareButton;
}

- (NSArray)currentSceneViewModels
{
  v3 = [(PUSceneDebugInspectorViewController *)self navigationItem];
  id v4 = [v3 searchController];
  int v5 = [v4 isActive];

  if (v5) {
    [(PUSceneDebugInspectorViewController *)self sceneViewModelsSearched];
  }
  else {
  v6 = [(PUSceneDebugInspectorViewController *)self sceneViewModelsAll];
  }
  return (NSArray *)v6;
}

- (void)_reloadTableViewByGroupingViewModels:(id)a3 sortOrder:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * v11);
        v13 = [(id)objc_opt_class() _sectionTitleForSceneViewModel:v12 sortOrder:a4];
        v14 = [v7 objectForKeyedSubscript:v13];

        if (!v14)
        {
          v15 = objc_opt_new();
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v16 = [v7 objectForKeyedSubscript:v13];
        [v16 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v9);
  }

  uint64_t v17 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v39 = [v7 allKeys];
  uint64_t v18 = [v39 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v39);
        }
        uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * v21);
        v23 = objc_opt_class();
        v24 = [v7 objectForKeyedSubscript:v22];
        v25 = [v23 _sortedSceneViewModels:v24 sortOrder:a4];
        [v17 setObject:v25 forKeyedSubscript:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v39 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v19);
  }

  v26 = v17;
  v27 = (void *)[v17 copy];
  [(PUSceneDebugInspectorViewController *)self setGroupedSceneViewModels:v27];

  v28 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"self", objc_msgSend((id)objc_opt_class(), "_isAscendingForSortOrder:", a4));
  v29 = [v26 allKeys];
  v49 = v28;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v31 = [v29 sortedArrayUsingDescriptors:v30];
  [(PUSceneDebugInspectorViewController *)self setGroupedSceneViewModelTitles:v31];

  v32 = [(PUSceneDebugInspectorViewController *)self tableView];
  [v32 reloadData];

  v33 = [(PUSceneDebugInspectorViewController *)self currentSceneViewModels];
  BOOL v34 = [v33 count] != 0;
  v35 = [(PUSceneDebugInspectorViewController *)self shareButton];
  [v35 setEnabled:v34];

  v36 = [(PUSceneDebugInspectorViewController *)self currentSceneViewModels];
  BOOL v37 = [v36 count] != 0;
  v38 = [(PUSceneDebugInspectorViewController *)self sortButton];
  [v38 setEnabled:v37];
}

- (void)didSelectSortButton:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Sort Scenes" message:0 preferredStyle:0];
  id v6 = [v5 popoverPresentationController];
  [v6 setBarButtonItem:v4];

  for (uint64_t i = 0; i != 5; ++i)
  {
    uint64_t v8 = [(id)objc_opt_class() _titleForSortOrder:i];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PUSceneDebugInspectorViewController_didSelectSortButton___block_invoke;
    v15[3] = &unk_1E5F2BA48;
    v15[4] = self;
    v15[5] = i;
    uint64_t v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:0 handler:v15];
    uint64_t v10 = +[PUSceneSettings sharedInstance];
    uint64_t v11 = [v10 inspectorSortOrder];

    if (i == v11) {
      [v9 _setChecked:1];
    }
    [v5 addAction:v9];
  }
  uint64_t v12 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v12];

  v13 = [(PUSceneDebugInspectorViewController *)self presentedViewController];

  if (v13)
  {
    v14 = [(PUSceneDebugInspectorViewController *)self presentedViewController];
    [v14 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    [(PUSceneDebugInspectorViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

void __59__PUSceneDebugInspectorViewController_didSelectSortButton___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[PUSceneSettings sharedInstance];
  [v3 setInspectorSortOrder:v2];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 currentSceneViewModels];
  [v4 _reloadTableViewByGroupingViewModels:v5 sortOrder:*(void *)(a1 + 40)];
}

- (UIBarButtonItem)sortButton
{
  sortButton = self->_sortButton;
  if (!sortButton)
  {
    v13.width = 22.0;
    v13.height = 22.0;
    UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
    id v4 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.5, 0.5, 21.0, 21.0);
    [v4 stroke];

    id v5 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 6.0, 7.0, 10.0, 1.0);
    [v5 fill];

    id v6 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 7.0, 11.0, 8.0, 1.0);
    [v6 fill];

    v7 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 8.0, 15.0, 6.0, 1.0);
    [v7 fill];

    uint64_t v8 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    uint64_t v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v8 style:0 target:self action:sel_didSelectSortButton_];
    uint64_t v10 = self->_sortButton;
    self->_sortButton = v9;

    [(UIBarButtonItem *)self->_sortButton setEnabled:0];
    sortButton = self->_sortButton;
  }
  return sortButton;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 searchBar];
  id v5 = [v4 text];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"keyword CONTAINS[c] %@", v5];
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(synonyms, $synonym, $synonym CONTAINS[c] %@).@count > 0", v5];
  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  v15[0] = v6;
  v15[1] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v10 = [v8 orPredicateWithSubpredicates:v9];

  uint64_t v11 = [(PUSceneDebugInspectorViewController *)self sceneViewModelsAll];
  uint64_t v12 = [v11 filteredArrayUsingPredicate:v10];
  [(PUSceneDebugInspectorViewController *)self setSceneViewModelsSearched:v12];

  CGSize v13 = [(PUSceneDebugInspectorViewController *)self currentSceneViewModels];
  v14 = +[PUSceneSettings sharedInstance];
  -[PUSceneDebugInspectorViewController _reloadTableViewByGroupingViewModels:sortOrder:](self, "_reloadTableViewByGroupingViewModels:sortOrder:", v13, [v14 inspectorSortOrder]);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModelTitles];
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  uint64_t v8 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModels];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = [v5 row];

  uint64_t v11 = [v9 objectAtIndexedSubscript:v10];

  uint64_t v12 = objc_opt_class();
  CGSize v13 = [(PUSceneDebugInspectorViewController *)self px_extendedTraitCollection];
  v14 = objc_msgSend(v12, "_assetGridViewControllerForViewModel:interfaceIdiom:", v11, objc_msgSend(v13, "userInterfaceIdiom"));

  v15 = [(PUSceneDebugInspectorViewController *)self navigationController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PUSceneDebugInspectorViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_1E5F2ED10;
  v16[4] = self;
  objc_msgSend(v15, "px_pushViewController:animated:completion:", v14, 1, v16);
}

void __73__PUSceneDebugInspectorViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  v1 = [v2 searchController];
  [v1 setActive:0];
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v4 = objc_opt_class();
  id v5 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModelTitles];
  id v6 = +[PUSceneSettings sharedInstance];
  v7 = objc_msgSend(v4, "_shortTitlesForSectionTitles:SortOrder:", v5, objc_msgSend(v6, "inspectorSortOrder"));

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModelTitles];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[PUSceneDebugInspectorCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModelTitles];
  uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  uint64_t v12 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModels];
  CGSize v13 = [v12 objectForKeyedSubscript:v11];
  uint64_t v14 = [v6 row];

  v15 = [v13 objectAtIndexedSubscript:v14];
  [v9 setViewModel:v15];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModels];
  id v7 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModelTitles];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];
  int64_t v10 = [v9 count];

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PUSceneDebugInspectorViewController *)self groupedSceneViewModelTitles];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)didSelectDoneButton:(id)a3
{
}

- (UIView)loadingContentView
{
  loadingContentView = self->_loadingContentView;
  if (!loadingContentView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v5 = [(PUSceneDebugInspectorViewController *)self view];
    [v5 bounds];
    id v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    id v7 = self->_loadingContentView;
    self->_loadingContentView = v6;

    [(UIView *)self->_loadingContentView setAutoresizingMask:18];
    uint64_t v8 = [(PUSceneDebugInspectorViewController *)self view];
    [v8 addSubview:self->_loadingContentView];

    id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setText:@"Loading..."];
    int64_t v10 = [MEMORY[0x1E4FB1618] darkGrayColor];
    [v9 setTextColor:v10];

    uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v9 setFont:v11];

    [v9 setAdjustsFontForContentSizeCategory:1];
    [(UIView *)self->_loadingContentView addSubview:v9];
    uint64_t v12 = [v9 centerXAnchor];
    CGSize v13 = [(UIView *)self->_loadingContentView centerXAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [v9 centerYAnchor];
    uint64_t v16 = [(UIView *)self->_loadingContentView centerYAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_loadingContentView addSubview:v18];
    uint64_t v19 = [v18 centerXAnchor];
    uint64_t v20 = [(UIView *)self->_loadingContentView centerXAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    uint64_t v22 = [v18 topAnchor];
    v23 = [v9 bottomAnchor];
    v24 = [v22 constraintEqualToSystemSpacingBelowAnchor:v23 multiplier:1.0];
    [v24 setActive:1];

    [v18 startAnimating];
    loadingContentView = self->_loadingContentView;
  }
  return loadingContentView;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUSceneDebugInspectorViewController;
  [(PUSceneDebugInspectorViewController *)&v5 viewWillAppear:a3];
  id v4 = [(PUSceneDebugInspectorViewController *)self navigationController];
  [v4 setToolbarHidden:0];
}

- (void)viewDidLoad
{
  v26[3] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)PUSceneDebugInspectorViewController;
  [(PUSceneDebugInspectorViewController *)&v25 viewDidLoad];
  v3 = [(PUSceneDebugInspectorViewController *)self navigationItem];
  [v3 setTitle:@"Scene Inspector"];

  id v4 = [(PUSceneDebugInspectorViewController *)self view];
  objc_super v5 = [(PUSceneDebugInspectorViewController *)self loadingContentView];
  [v4 addSubview:v5];

  id v6 = [(PUSceneDebugInspectorViewController *)self tableView];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = +[PUSceneDebugInspectorCell reuseIdentifier];
  [v6 registerClass:v7 forCellReuseIdentifier:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  int64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v11 = [(PUSceneDebugInspectorViewController *)self tableView];
  [v11 setTableFooterView:v10];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  CGSize v13 = [(PUSceneDebugInspectorViewController *)self shareButton];
  v26[0] = v13;
  v26[1] = v12;
  uint64_t v14 = [(PUSceneDebugInspectorViewController *)self sortButton];
  v26[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  [(PUSceneDebugInspectorViewController *)self setToolbarItems:v15];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_didSelectDoneButton_];
  uint64_t v17 = [(PUSceneDebugInspectorViewController *)self navigationItem];
  [v17 setRightBarButtonItem:v16];

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  [v18 setSearchResultsUpdater:self];
  [v18 setObscuresBackgroundDuringPresentation:0];
  uint64_t v19 = [(PUSceneDebugInspectorViewController *)self navigationItem];
  [v19 setSearchController:v18];

  uint64_t v20 = [(PUSceneDebugInspectorViewController *)self navigationItem];
  [v20 setHidesSearchBarWhenScrolling:0];

  objc_initWeak(&location, self);
  uint64_t v21 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E5F2E4E8;
  block[4] = self;
  objc_copyWeak(&v23, &location);
  dispatch_async(v21, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  long long v44 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  long long v43 = [v44 librarySpecificFetchOptions];
  [v43 setShouldPrefetchCount:1];
  long long v41 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v43];
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__81175;
  v73 = __Block_byref_object_dispose__81176;
  id v74 = 0;
  v1 = (void *)MEMORY[0x1E4F8AA78];
  id v2 = [v44 photoLibraryBundle];
  id v68 = 0;
  long long v45 = (void *)[v1 newPhotoLibraryWithName:"-[PUSceneDebugInspectorViewController viewDidLoad]_block_invoke" loadedFromBundle:v2 options:0 error:&v68];
  id v40 = v68;

  v3 = v45;
  if (!v45)
  {
    id v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      objc_super v5 = [v44 photoLibraryBundle];
      *(_DWORD *)buf = 138412546;
      v78 = v5;
      __int16 v79 = 2112;
      id v80 = v40;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_FAULT, "Error loading photo library from bundle %@: %@", buf, 0x16u);
    }
    v3 = 0;
  }
  id v6 = [v3 managedObjectContext];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v8 = [MEMORY[0x1E4F8AB80] entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setPropertiesToFetch:&unk_1F078B528];
  [v9 setReturnsDistinctResults:0];
  [v9 setResultType:2];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_229;
  v64[3] = &unk_1E5F2E0D0;
  v67 = &v69;
  id v38 = v6;
  id v65 = v38;
  id v39 = v9;
  id v66 = v39;
  [v45 performBlockAndWait:v64];
  long long v48 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v10 = (id)v70[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [*(id *)(*((void *)&v60 + 1) + 8 * i) objectForKeyedSubscript:@"sceneIdentifier"];
        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "unsignedIntValue"));
        [v48 addObject:v15];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v11);
  }

  v51 = [*(id *)(a1 + 32) sceneTaxonomy];
  unint64_t v16 = [v41 count];
  v50 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = (id)v70[5];
  uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v75 count:16];
  if (v49)
  {
    double v17 = (double)v16;
    uint64_t v47 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        uint64_t v52 = [v19 objectForKeyedSubscript:@"sceneIdentifier"];
        uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v52, "unsignedLongLongValue"));
        objc_msgSend(v51, "nodeRefForExtendedSceneClassId:", objc_msgSend(v20, "unsignedLongLongValue"));
        uint64_t v21 = NSNumber;
        PFSceneTaxonomyNodeSearchThreshold();
        uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
        id v23 = [v50 objectForKeyedSubscript:v20];
        if (!v23)
        {
          PFSceneTaxonomyNodeName();
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            [v20 unsignedIntValue];
            v24 = @"~ No Localized Keyword ~";
          }
          uint64_t v25 = PFSceneTaxonomyNodeLocalizedSynonyms();
          v26 = (void *)v25;
          v27 = (void *)MEMORY[0x1E4F1CBF0];
          if (v25) {
            v27 = (void *)v25;
          }
          id v28 = v27;

          v29 = [NSNumber numberWithBool:PFSceneTaxonomyNodeIsIndexed()];
          v30 = [PUSceneDebugInspectorSceneViewModel alloc];
          unsigned int v31 = [v20 unsignedIntValue];
          uint64_t v32 = [v29 BOOLValue];
          [v22 doubleValue];
          id v23 = -[PUSceneDebugInspectorSceneViewModel initWithKeyword:synonyms:sceneIdentifier:indexed:threshold:](v30, "initWithKeyword:synonyms:sceneIdentifier:indexed:threshold:", v24, v28, v31, v32);
          [v50 setObject:v23 forKeyedSubscript:v20];
        }
        [(PUSceneDebugInspectorSceneViewModel *)v23 setCount:[(PUSceneDebugInspectorSceneViewModel *)v23 count] + 1];
        v33 = [v19 objectForKeyedSubscript:@"confidence"];
        [v33 doubleValue];
        double v35 = v34;
        [v22 doubleValue];
        if (v35 >= v36)
        {
          [(PUSceneDebugInspectorSceneViewModel *)v23 setHighConfidenceCount:[(PUSceneDebugInspectorSceneViewModel *)v23 highConfidenceCount] + 1];
          [(PUSceneDebugInspectorSceneViewModel *)v23 setLibraryCoverage:(double)[(PUSceneDebugInspectorSceneViewModel *)v23 highConfidenceCount] / v17];
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v75 count:16];
    }
    while (v49);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_238;
  block[3] = &unk_1E5F2E4E8;
  objc_copyWeak(&v55, (id *)(a1 + 40));
  id v54 = v50;
  id v37 = v50;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v55);
  _Block_object_dispose(&v69, 8);
}

void __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_229(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch scenes error: %@", buf, 0xCu);
    }
  }
}

void __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_238(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = +[PUSceneSettings sharedInstance];
  uint64_t v3 = [v2 inspectorSortOrder];

  uint64_t v4 = [*(id *)(a1 + 32) allValues];
  [WeakRetained setSceneViewModelsAll:v4];

  [WeakRetained setSceneViewModelsSearched:0];
  id v5 = [WeakRetained loadingContentView];
  [v5 removeFromSuperview];

  uint64_t v6 = [WeakRetained sceneViewModelsAll];
  [WeakRetained _reloadTableViewByGroupingViewModels:v6 sortOrder:v3];
}

- (id)sceneTaxonomy
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sceneTaxonomy)
  {
    uint64_t v3 = (PFSceneTaxonomy *)objc_alloc_init(MEMORY[0x1E4F8CD60]);
    sceneTaxonomy = v2->_sceneTaxonomy;
    v2->_sceneTaxonomy = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_sceneTaxonomy;
  return v5;
}

+ (id)highestConfidenceForAsset:(id)a3 sceneIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = objc_msgSend(a3, "sceneClassifications", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 extendedSceneIdentifier];
        if (v13 == [v5 unsignedIntegerValue])
        {
          [v12 confidence];
          if (v14 > v10)
          {
            [v12 confidence];
            double v10 = v15;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  unint64_t v16 = [NSNumber numberWithDouble:v10];

  return v16;
}

+ (id)_assetGridViewControllerForViewModel:(id)a3 interfaceIdiom:(int64_t)a4
{
  id v4 = a3;
  id v5 = [v4 keyword];
  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 sceneIdentifier];

  uint64_t v8 = [v6 numberWithUnsignedLongLong:v7];
  objc_opt_class();
  uint64_t v9 = [PUSceneDebugGridViewController alloc];
  double v10 = objc_opt_new();
  id v11 = [(PUPhotosAlbumViewController *)v9 initWithSpec:v10];

  [(PUSceneDebugGridViewController *)v11 setSceneIdentifier:v8];
  uint64_t v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke;
  block[3] = &unk_1E5F2E908;
  id v20 = v8;
  id v21 = v5;
  uint64_t v13 = v11;
  uint64_t v22 = v13;
  id v14 = v5;
  id v15 = v8;
  dispatch_async(v12, block);

  unint64_t v16 = v22;
  double v17 = v13;

  return v17;
}

void __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  id v2 = [v22 managedObjectContext];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = [MEMORY[0x1E4F8AB80] entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sceneIdentifier == %@", *(void *)(a1 + 32)];
  [v5 setPredicate:v6];

  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__81175;
  long long v42 = __Block_byref_object_dispose__81176;
  id v43 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_2;
  v34[3] = &unk_1E5F2E0D0;
  id v21 = v2;
  id v35 = v21;
  id v7 = v5;
  id v36 = v7;
  id v37 = &v38;
  [v22 performBlockAndWait:v34];
  uint64_t v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = (id)v39[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v14 = +[PUSceneDebugInspectorViewController highestConfidenceForAsset:v13 sceneIdentifier:*(void *)(a1 + 32)];
        id v15 = [v13 localIdentifier];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v10);
  }

  unint64_t v16 = (void *)v39[5];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_3;
  v28[3] = &unk_1E5F2BA70;
  id v17 = v8;
  id v29 = v17;
  long long v18 = [v16 sortedArrayUsingComparator:v28];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_4;
  block[3] = &unk_1E5F2D098;
  id v24 = v18;
  id v25 = *(id *)(a1 + 40);
  id v26 = *(id *)(a1 + 48);
  id v27 = v17;
  id v19 = v17;
  id v20 = v18;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v38, 8);
}

void __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:0];
  uint64_t v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "assetAttributes", (void)v20);
        uint64_t v11 = [v10 asset];
        uint64_t v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v14 = [v9 assetAttributesForTemporalSceneClassifications];
          id v13 = [v14 asset];
        }
        [v3 addObject:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  id v15 = (void *)MEMORY[0x1E4F8A950];
  unint64_t v16 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v17 = objc_msgSend(v15, "pl_PHAssetsForManagedAssets:photoLibrary:", v3, v16);
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

uint64_t __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 localIdentifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v6 localIdentifier];

  id v13 = [v11 objectForKeyedSubscript:v12];
  [v13 doubleValue];
  double v15 = v14;

  if (v10 > v15) {
    return -1;
  }
  else {
    return v10 != v15;
  }
}

void __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_4(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:*(void *)(a1 + 32) title:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)MEMORY[0x1E4F39008];
  v8[0] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v2 localizedTitle];
  id v6 = [v3 transientCollectionListWithCollections:v4 title:v5];

  uint64_t v7 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v6 options:0];
  [*(id *)(a1 + 48) setAssetsHighestConfidence:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) setAssetCollection:v2 fetchResultContainingAssetCollection:v7 filterPredicate:0];
}

+ (id)_commaSeparatedValueRepresentation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [&unk_1F078B540 componentsJoinedByString:@","];
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  long long v20 = v4;
  id v6 = [v4 stringByAppendingString:@"\n"];
  uint64_t v7 = (void *)[v5 initWithString:v6];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v8;
        double v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v10 = [&unk_1F078B540 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(&unk_1F078B540);
              }
              double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if ([v14 isEqualToString:@"isIndexed"])
              {
                int v15 = [v9 isIndexed];
                unint64_t v16 = @"NO";
                if (v15) {
                  unint64_t v16 = @"YES";
                }
                [v7 appendFormat:@"%@", v16];
              }
              else
              {
                if ([v14 isEqualToString:@"synonyms"]) {
                  [v9 concatenatedSynonyms];
                }
                else {
                uint64_t v17 = [v9 valueForKey:v14];
                }
                [v7 appendFormat:@"%@", v17];
              }
              uint64_t v18 = [&unk_1F078B540 lastObject];

              if (v14 != v18) {
                [v7 appendString:@","];
              }
            }
            uint64_t v11 = [&unk_1F078B540 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v11);
        }
        [v7 appendString:@"\n"];
        uint64_t v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  return v7;
}

+ (id)_titleForSortOrder:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Alphabetically";
  }
  else {
    return off_1E5F2BAB0[a3 - 1];
  }
}

+ (BOOL)_isAscendingForSortOrder:(unint64_t)a3
{
  return (a3 > 4) | (9u >> a3) & 1;
}

+ (id)_keyForSortOrder:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"keyword";
  }
  else {
    return off_1E5F2BA90[a3 - 1];
  }
}

+ (id)_shortTitlesForSectionTitles:(id)a3 SortOrder:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 - 1 < 3)
  {
    uint64_t v8 = objc_opt_new();
    if ([v7 count])
    {
      unint64_t v9 = 0;
      do
      {
        [v8 addObject:@"·"];
        ++v9;
      }
      while (v9 < [v7 count]);
    }
LABEL_17:
    id v4 = (id)objc_msgSend(v8, "copy", (void)v17);

    goto LABEL_18;
  }
  if (a4 == 4)
  {
    uint64_t v8 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "substringToIndex:", 1, (void)v17);
          [v8 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    goto LABEL_17;
  }
  if (!a4) {
    id v4 = v6;
  }
LABEL_18:

  return v4;
}

+ (id)_sectionTitleForSceneViewModel:(id)a3 sortOrder:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 0uLL:
      uint64_t v7 = [v5 keyword];
      a4 = [v7 substringToIndex:1];

      break;
    case 1uLL:
      unint64_t v8 = 100 * ([v5 count] / 0x64uLL);
      objc_msgSend(NSString, "stringWithFormat:", @"Count: %06lu ~ %06lu", v8, v8 + 100);
      goto LABEL_6;
    case 2uLL:
      [v5 libraryCoverage];
      objc_msgSend(NSString, "stringWithFormat:", @"Coverage: %.0lf%% ~ %.0lf%%", (double)(unint64_t)(v9 * 10.0) * 10.0, (double)(unint64_t)(v9 * 10.0) * 10.0 + 10.0);
      goto LABEL_6;
    case 3uLL:
      unint64_t v10 = 100 * ([v5 sceneIdentifier] / 0x64uLL);
      objc_msgSend(NSString, "stringWithFormat:", @"Identifier: %06lu ~ %06lu", v10, v10 + 100);
LABEL_6:
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      int v12 = [v5 isIndexed];
      uint64_t v13 = @"Non-searchable";
      if (v12) {
        uint64_t v13 = @"Searchable";
      }
      uint64_t v11 = v13;
LABEL_10:
      a4 = (unint64_t)v11;
      break;
    default:
      break;
  }

  return (id)a4;
}

+ (id)_sortedSceneViewModels:(id)a3 sortOrder:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = PXAssertGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v14 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Attempted to sort nil view models", v14, 2u);
    }
  }
  unint64_t v8 = [a1 _keyForSortOrder:a4];
  uint64_t v9 = [a1 _isAscendingForSortOrder:a4];
  unint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v8 ascending:v9];
  v15[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v12 = [v6 sortedArrayUsingDescriptors:v11];

  return v12;
}

@end