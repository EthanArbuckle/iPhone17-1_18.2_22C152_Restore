@interface SUUICategoryTableViewController
- (BOOL)isRoot;
- (NSArray)metricsLocations;
- (NSURL)defaultURL;
- (NSURL)selectedURL;
- (SUUICategory)category;
- (SUUICategoryArtworkLoader)artworkLoader;
- (SUUICategoryTableViewControllerDelegate)delegate;
- (SUUIClientContext)clientContext;
- (id)_categoryAtIndexPath:(id)a3;
- (id)_metricsLocationsToPushIndexPath:(id)a3;
- (id)metricsPageContextForCategoryTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_metricsLocationPostionForIndexPath:(id)a3;
- (int64_t)numberOfHiddenRows;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonAction:(id)a3;
- (void)_recordClickEventForIndexPath:(id)a3 category:(id)a4 actionType:(id)a5;
- (void)categoryArtworkLoader:(id)a3 didLoadImage:(id)a4 forCategory:(id)a5;
- (void)categoryTableView:(id)a3 didSelectCategory:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setArtworkLoader:(id)a3;
- (void)setCategory:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDefaultURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetricsLocations:(id)a3;
- (void)setNumberOfHiddenRows:(int64_t)a3;
- (void)setRoot:(BOOL)a3;
- (void)setSelectedURL:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUICategoryTableViewController

- (void)dealloc
{
  [(SUUICategoryArtworkLoader *)self->_artworkLoader removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SUUICategoryTableViewController;
  [(SUUICategoryTableViewController *)&v3 dealloc];
}

- (void)setArtworkLoader:(id)a3
{
  v5 = (SUUICategoryArtworkLoader *)a3;
  artworkLoader = self->_artworkLoader;
  if (artworkLoader != v5)
  {
    v7 = v5;
    [(SUUICategoryArtworkLoader *)artworkLoader removeObserver:self];
    objc_storeStrong((id *)&self->_artworkLoader, a3);
    artworkLoader = (SUUICategoryArtworkLoader *)[(SUUICategoryArtworkLoader *)self->_artworkLoader addObserver:self];
    v5 = v7;
  }
  MEMORY[0x270F9A758](artworkLoader, v5);
}

- (void)setCategory:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = (SUUICategory *)a3;
  p_category = &self->_category;
  if (self->_category != v5)
  {
    objc_storeStrong((id *)&self->_category, a3);
    self->_childrenHaveArtwork = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = [(SUUICategory *)*p_category children];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) artworkProvider];

          if (v12)
          {
            self->_childrenHaveArtwork = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if ([(SUUICategoryTableViewController *)self isViewLoaded])
    {
      v13 = [(SUUICategoryTableViewController *)self tableView];
      [v13 reloadData];
    }
    v14 = [(SUUICategory *)*p_category name];
    [(SUUICategoryTableViewController *)self setTitle:v14];
  }
}

- (void)setNumberOfHiddenRows:(int64_t)a3
{
  if (self->_numberOfHiddenRows != a3)
  {
    self->_numberOfHiddenRows = a3;
    id v3 = [(SUUICategoryTableViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SUUICategoryTableViewController;
  [(SUUICategoryTableViewController *)&v7 loadView];
  id v3 = [(SUUICategoryTableViewController *)self tableView];
  v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  v6 = [MEMORY[0x263F825C8] clearColor];
  }
  [v3 setBackgroundColor:v6];

  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"a"];
  [v3 setSeparatorStyle:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUUICategoryTableViewController *)self presentingViewController];

  if (v5)
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"CATEGORY_SHEET_CANCEL_BUTTON"];
    }
    else {
    objc_super v7 = +[SUUIClientContext localizedStringForKey:@"CATEGORY_SHEET_CANCEL_BUTTON" inBundles:0];
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v7 style:2 target:self action:sel__doneButtonAction_];
    uint64_t v9 = [(SUUICategoryTableViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  uint64_t v10 = [(SUUICategoryTableViewController *)self tableView];
  v11 = [v10 indexPathForSelectedRow];

  if (v11)
  {
    v12 = [(SUUICategoryTableViewController *)self tableView];
    [v12 deselectRowAtIndexPath:v11 animated:1];
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUICategoryTableViewController;
  [(SUUICategoryTableViewController *)&v13 viewWillAppear:v3];
}

- (void)categoryArtworkLoader:(id)a3 didLoadImage:(id)a4 forCategory:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SUUICategoryTableViewController *)self tableView];
  uint64_t v10 = [v9 indexPathsForVisibleRows];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        -[SUUICategoryTableViewController _categoryAtIndexPath:](self, "_categoryAtIndexPath:", v16, (void)v21);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17 == v8)
        {
          long long v18 = [(SUUICategoryTableViewController *)self tableView];
          v19 = [v18 cellForRowAtIndexPath:v16];

          uint64_t v20 = [v19 imageView];
          [v20 setImage:v7];

          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)categoryTableView:(id)a3 didSelectCategory:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 categoryTableView:self didSelectCategory:v8];
  }
}

- (id)metricsPageContextForCategoryTableView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 metricsPageContextForCategoryTableView:self];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"a" forIndexPath:v6];
  id v8 = [(SUUICategoryTableViewController *)self _categoryAtIndexPath:v6];
  uint64_t v9 = [v7 textLabel];
  if ([v6 section]) {
    [(SUUICategory *)v8 name];
  }
  else {
  uint64_t v10 = [(SUUICategory *)v8 parentLabel];
  }
  [v9 setText:v10];

  if ([v6 section] == 1)
  {
    id v11 = [(SUUICategory *)v8 children];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = 1;
      goto LABEL_14;
    }
  }
  uint64_t v14 = [(SUUICategory *)v8 URL];
  if ([v14 isEqual:self->_selectedURL])
  {

LABEL_9:
    uint64_t v13 = 3;
    goto LABEL_14;
  }
  if (self->_isRoot && v8 == self->_category)
  {
    char v24 = [(NSURL *)self->_defaultURL isEqual:self->_selectedURL];

    if (v24) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v13 = 0;
LABEL_14:
  [v7 setAccessoryType:v13];
  long long v15 = [MEMORY[0x263F82670] currentDevice];
  if ([v15 userInterfaceIdiom])
  {

LABEL_16:
    double v16 = *MEMORY[0x263F001B0];
    double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
LABEL_17:
    objc_msgSend(v7, "setExpectedImageSize:", v16, v17);
    goto LABEL_18;
  }
  BOOL childrenHaveArtwork = self->_childrenHaveArtwork;

  if (!childrenHaveArtwork) {
    goto LABEL_16;
  }
  uint64_t v20 = [(SUUICategory *)v8 artworkProvider];

  artworkLoader = self->_artworkLoader;
  if (!v20)
  {
    [(SUUICategoryArtworkLoader *)artworkLoader imageSize];
    goto LABEL_17;
  }
  long long v22 = [(SUUICategoryArtworkLoader *)artworkLoader cachedImageForCategory:v8];
  if (!v22)
  {
    [(SUUICategoryArtworkLoader *)self->_artworkLoader loadImageForCategory:v8 reason:1];
    long long v22 = [(SUUICategoryArtworkLoader *)self->_artworkLoader placeholderImage];
  }
  long long v23 = [v7 imageView];
  [v23 setImage:v22];

LABEL_18:
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return self->_numberOfHiddenRows == 0;
  }
  uint64_t v5 = [(SUUICategory *)self->_category children];
  uint64_t v6 = [v5 count];
  int64_t numberOfHiddenRows = self->_numberOfHiddenRows;
  if (numberOfHiddenRows) {
    int64_t v8 = 1 - numberOfHiddenRows;
  }
  else {
    int64_t v8 = 0;
  }
  int64_t v9 = v8 + v6;

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  uint64_t v5 = [(SUUICategoryTableViewController *)self _categoryAtIndexPath:v13];
  if ([v13 section] == 1
    && ([v5 children],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    [(SUUICategoryTableViewController *)self _recordClickEventForIndexPath:v13 category:v5 actionType:*MEMORY[0x263F7BB38]];
    int64_t v8 = objc_alloc_init(SUUICategoryTableViewController);
    [(SUUICategoryTableViewController *)v8 setArtworkLoader:self->_artworkLoader];
    [(SUUICategoryTableViewController *)v8 setCategory:v5];
    [(SUUICategoryTableViewController *)v8 setClientContext:self->_clientContext];
    [(SUUICategoryTableViewController *)self preferredContentSize];
    -[SUUICategoryTableViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
    int64_t v9 = [(SUUICategoryTableViewController *)self _metricsLocationsToPushIndexPath:v13];
    [(SUUICategoryTableViewController *)v8 setMetricsLocations:v9];

    [(SUUICategoryTableViewController *)v8 setDelegate:self];
    [(SUUICategoryTableViewController *)v8 setSelectedURL:self->_selectedURL];
    uint64_t v10 = [(SUUICategoryTableViewController *)self navigationController];
    [v10 pushViewController:v8 animated:1];
  }
  else
  {
    [(SUUICategoryTableViewController *)self _recordClickEventForIndexPath:v13 category:v5 actionType:*MEMORY[0x263F7BB30]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
    int64_t v8 = (SUUICategoryTableViewController *)objc_loadWeakRetained((id *)&self->_delegate);
    [(SUUICategoryTableViewController *)v8 categoryTableView:self didSelectCategory:v5];
  }

LABEL_7:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v5 = (void *)MEMORY[0x263F825C8];
  id v6 = a4;
  uint64_t v7 = [v5 clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = [MEMORY[0x263F825C8] colorWithWhite:0.756 alpha:1.0];
  [v6 setSelectionTintColor:v8];
}

- (void)_doneButtonAction:(id)a3
{
}

- (id)_categoryAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  category = self->_category;
  if (v5)
  {
    uint64_t v7 = [(SUUICategory *)category children];
    uint64_t v8 = [v4 row];
    int64_t numberOfHiddenRows = self->_numberOfHiddenRows;
    BOOL v10 = numberOfHiddenRows != 0;
    int64_t v11 = numberOfHiddenRows - 1;
    if (!v10) {
      int64_t v11 = 0;
    }
    char v12 = [v7 objectAtIndex:v11 + v8];
  }
  else
  {
    char v12 = category;
  }

  return v12;
}

- (int64_t)_metricsLocationPostionForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  if (v6 == 1 && !self->_numberOfHiddenRows) {
    ++v5;
  }
  return v5;
}

- (id)_metricsLocationsToPushIndexPath:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F7B250];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  int64_t v7 = [(SUUICategoryTableViewController *)self _metricsLocationPostionForIndexPath:v5];

  [v6 setLocationPosition:v7];
  [v6 setLocationType:*MEMORY[0x263F7BBC0]];
  uint64_t v8 = (void *)[(NSArray *)self->_metricsLocations mutableCopy];
  if (v8)
  {
    int64_t v9 = v8;
    [v8 insertObject:v6 atIndex:0];
  }
  else
  {
    int64_t v9 = [MEMORY[0x263EFF980] arrayWithObject:v6];
  }

  return v9;
}

- (void)_recordClickEventForIndexPath:(id)a3 category:(id)a4 actionType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v10 row];
  uint64_t v12 = [v10 section];

  if (v12 == 1 && !self->_numberOfHiddenRows) {
    ++v11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    double v16 = [v15 metricsPageContextForCategoryTableView:self];
  }
  else
  {
    double v16 = 0;
  }
  double v17 = [(SUUICategoryTableViewController *)self clientContext];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __85__SUUICategoryTableViewController__recordClickEventForIndexPath_category_actionType___block_invoke;
  v21[3] = &unk_265406FC8;
  id v22 = v9;
  id v23 = v16;
  v25 = self;
  uint64_t v26 = v11;
  id v24 = v8;
  id v18 = v8;
  id v19 = v16;
  id v20 = v9;
  [v17 getDefaultMetricsControllerWithCompletionBlock:v21];
}

void __85__SUUICategoryTableViewController__recordClickEventForIndexPath_category_actionType___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 canRecordEventWithType:*MEMORY[0x263F7BB50]])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F7B228]);
    [v4 setActionType:*(void *)(a1 + 32)];
    [v4 setPageContext:*(void *)(a1 + 40)];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(*(id *)(a1 + 48), "categoryIdentifier"));
    [v4 setTargetIdentifier:v5];

    uint64_t v6 = *MEMORY[0x263F7BBC8];
    [v4 setTargetType:*MEMORY[0x263F7BBC8]];
    int64_t v7 = [*(id *)(a1 + 48) URL];
    id v8 = [v7 absoluteString];
    [v4 setTargetURL:v8];

    id v9 = [v3 locationWithPosition:*(void *)(a1 + 64) type:v6 fieldData:0];
    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 56) + 1056);
      if (v10)
      {
        uint64_t v11 = (void *)[v10 mutableCopy];
        [v11 insertObject:v9 atIndex:0];
      }
      else
      {
        v12[0] = v9;
        uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      }
      [v4 setLocationWithEventLocations:v11];
    }
    [v3 recordEvent:v4];
  }
}

- (SUUICategoryArtworkLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SUUICategory)category
{
  return self->_category;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (void)setDefaultURL:(id)a3
{
}

- (SUUICategoryTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUICategoryTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)metricsLocations
{
  return self->_metricsLocations;
}

- (void)setMetricsLocations:(id)a3
{
}

- (int64_t)numberOfHiddenRows
{
  return self->_numberOfHiddenRows;
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (NSURL)selectedURL
{
  return self->_selectedURL;
}

- (void)setSelectedURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_selectedURL, 0);
  objc_storeStrong((id *)&self->_metricsLocations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end