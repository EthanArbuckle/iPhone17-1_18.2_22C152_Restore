@interface SUUIProductPageDetailsViewController
+ (double)defaultPageWidthForUserInterfaceIdiom:(int64_t)a3;
- (BOOL)askPermission;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIProductPage)productPage;
- (SUUIProductPageChildViewControllerDelegate)delegate;
- (SUUIProductPageDetailsViewController)initWithProductPage:(id)a3;
- (SUUIProductPageHeaderViewController)headerViewController;
- (UIScrollView)scrollView;
- (id)_bundledAppsSection;
- (id)_copyrightSection;
- (id)_descriptionSection;
- (id)_featuresSection;
- (id)_infoSection;
- (id)_parentBundlesSection;
- (id)_resourceLoader;
- (id)_screenshotsSection;
- (id)_storeNotesSection;
- (id)_tableViewController;
- (id)_textLayoutRequestWithText:(id)a3 widthOffset:(double)a4;
- (id)_whatsNewSection;
- (id)tableViewForTableViewSection:(id)a3;
- (void)_addTapRecognizerForView:(id)a3 action:(SEL)a4;
- (void)_configureSwooshSection:(id)a3;
- (void)_expandSection:(id)a3;
- (void)dealloc;
- (void)itemStateCenterRestrictionsChanged:(id)a3;
- (void)loadView;
- (void)screenshotsWillBeginDragging:(id)a3;
- (void)setAskPermission:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SUUIProductPageDetailsViewController

- (SUUIProductPageDetailsViewController)initWithProductPage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageDetailsViewController;
  v6 = [(SUUIProductPageDetailsViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_productPage, a3);
    v8 = +[SUUIItemStateCenter defaultCenter];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = +[SUUIItemStateCenter defaultCenter];
  [v3 removeObserver:self];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_sections;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setDelegate:0];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageDetailsViewController;
  [(SUUIProductPageDetailsViewController *)&v9 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageDetailsViewController;
  [(SUUIProductPageDetailsViewController *)&v4 viewDidAppear:a3];
  [(SUUIResourceLoader *)self->_resourceLoader enterForeground];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageDetailsViewController;
  [(SUUIProductPageDetailsViewController *)&v4 viewDidDisappear:a3];
  [(SUUIResourceLoader *)self->_resourceLoader enterBackground];
}

+ (double)defaultPageWidthForUserInterfaceIdiom:(int64_t)a3
{
  if (a3 == 1) {
    return 630.0;
  }
  if (!a3)
  {
    v3 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4) {
      return 320.0;
    }
  }
  uint64_t v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 bounds];
  double v5 = v7;

  return v5;
}

- (void)setClientContext:(id)a3
{
  double v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    if (*p_clientContext) {
      [(SUUIClientContext *)*p_clientContext localizedStringForKey:@"PRODUCT_PAGE_DETAILS_TAB" inTable:@"ProductPage"];
    }
    else {
    double v7 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_DETAILS_TAB" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageDetailsViewController *)self setTitle:v7];

    double v5 = v8;
  }
}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    if ([(NSMutableArray *)self->_sections count])
    {
      if ([(NSMutableArray *)self->_sections count])
      {
        unint64_t v4 = 0;
        do
        {
          double v5 = [(NSMutableArray *)self->_sections objectAtIndex:v4];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            double v7 = [SUUIProductPageTableLinksSection alloc];
            uint64_t v8 = [(SUUIProductPage *)self->_productPage item];
            objc_super v9 = [(SUUIProductPageTableLinksSection *)v7 initWithItem:v8 clientContext:self->_clientContext askPermission:self->_askPermission];

            long long v10 = [(SUUIProductPage *)self->_productPage uber];
            long long v11 = [v10 colorScheme];
            [(SUUIProductPageTableLinksSection *)v9 setColorScheme:v11];

            [(SUUITableViewSection *)v9 setSectionIndex:v4];
            [(NSMutableArray *)self->_sections replaceObjectAtIndex:v4 withObject:v9];
          }
          ++v4;
        }
        while (v4 < [(NSMutableArray *)self->_sections count]);
      }
      long long v12 = [MEMORY[0x263EFF980] arrayWithArray:self->_sections];
      sections = self->_sections;
      self->_sections = v12;

      id v14 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
      [v14 setSections:self->_sections];
    }
  }
}

- (void)loadView
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v3 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  unint64_t v4 = [v3 tableView];
  if (![(NSMutableArray *)self->_sections count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sections = self->_sections;
    self->_sections = v6;

    uint64_t v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    long long v10 = [(SUUIProductPage *)self->_productPage uber];
    uint64_t v64 = [v10 colorScheme];

    long long v11 = [(SUUIProductPage *)self->_productPage item];
    long long v12 = [(SUUIProductPageDetailsViewController *)self _storeNotesSection];
    v67 = v11;
    if (v12)
    {
      objc_msgSend(v12, "setStringIndex:", objc_msgSend(v5, "count"));
      long long v13 = [v11 storeNotes];
      id v14 = [v13 standardNotes];
      uint64_t v15 = [(SUUIProductPageDetailsViewController *)self _textLayoutRequestWithText:v14 widthOffset:0.0];
      [v5 addObject:v15];

      long long v11 = v67;
      objc_msgSend(v12, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v12];
    }
    v62 = v12;
    v16 = [(SUUIProductPageDetailsViewController *)self _bundledAppsSection];
    if (v16)
    {
      objc_msgSend(v16, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v16];
    }
    v61 = v16;
    v17 = [(SUUIProductPageDetailsViewController *)self _parentBundlesSection];
    v18 = (void *)v64;
    if (v17)
    {
      objc_msgSend(v17, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v17];
    }
    [(SUUIProductPageDetailsViewController *)self _screenshotsSection];
    v63 = v60 = v17;
    if (v63)
    {
      uint64_t v19 = [v11 parentalControlsRank];
      v20 = +[SUUIItemStateCenter defaultCenter];
      uint64_t v21 = [v20 parentalControlsRank];

      BOOL v22 = v19 < v21;
      long long v11 = v67;
      if (v22)
      {
        objc_msgSend(v63, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
        [(NSMutableArray *)self->_sections addObject:v63];
      }
    }
    v23 = [(SUUIProductPageDetailsViewController *)self _descriptionSection];
    v66 = v23;
    if (v23)
    {
      objc_msgSend(v23, "setStringIndex:", objc_msgSend(v5, "count"));
      v24 = [v11 itemDescription];
      v25 = [(SUUIProductPageDetailsViewController *)self _textLayoutRequestWithText:v24 widthOffset:0.0];
      [v5 addObject:v25];

      objc_msgSend(v66, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v66];
    }
    v26 = [(SUUIProductPageDetailsViewController *)self _whatsNewSection];
    v65 = v26;
    if (v26)
    {
      objc_msgSend(v26, "setStringIndex:", objc_msgSend(v5, "count"));
      v27 = [v11 updateDescription];
      v28 = [(SUUIProductPageDetailsViewController *)self _textLayoutRequestWithText:v27 widthOffset:0.0];
      [v5 addObject:v28];

      objc_msgSend(v65, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v65];
    }
    v29 = [(SUUIProductPageDetailsViewController *)self _featuresSection];
    if (v29)
    {
      objc_msgSend(v29, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v29];
    }
    v59 = v29;
    v30 = [(SUUIProductPageDetailsViewController *)self _infoSection];
    if (v30)
    {
      objc_msgSend(v30, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v30];
    }
    v58 = v30;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      v57 = v3;
      v31 = [v11 inAppPurchases];
      uint64_t v32 = [v31 count];

      if (v32)
      {
        v33 = [SUUIProductPageTableInAppPurchasesSection alloc];
        v34 = [v11 inAppPurchases];
        v35 = [(SUUIProductPageTableInAppPurchasesSection *)v33 initWithInAppPurchases:v34 clientContext:self->_clientContext];

        [(SUUIProductPageTableInAppPurchasesSection *)v35 setColorScheme:v64];
        [(SUUITableViewSection *)v35 setSectionIndex:[(NSMutableArray *)self->_sections count]];
        v36 = [(SUUIProductPageTableInAppPurchasesSection *)v35 headerViewForTableView:v4];
        [(SUUIProductPageDetailsViewController *)self _addTapRecognizerForView:v36 action:sel__expandSection_];

        [(NSMutableArray *)self->_sections addObject:v35];
      }
      v56 = v4;
      v37 = [v11 releaseNotes];
      id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v39 = v37;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v69 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = [*(id *)(*((void *)&v68 + 1) + 8 * i) changeNotes];
            v45 = (void *)v44;
            if (v44) {
              v46 = (__CFString *)v44;
            }
            else {
              v46 = &stru_2704F8130;
            }
            v47 = [(SUUIProductPageDetailsViewController *)self _textLayoutRequestWithText:v46 widthOffset:15.0];
            [v38 addObject:v47];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v68 objects:v72 count:16];
        }
        while (v41);
      }

      unint64_t v4 = v56;
      v18 = (void *)v64;
      if ([v39 count])
      {
        v48 = [[SUUIProductPageTableUpdateHistorySection alloc] initWithClientContext:self->_clientContext];
        v49 = [(SUUIProductPageTableUpdateHistorySection *)v48 headerViewForTableView:v56];
        [(SUUIProductPageDetailsViewController *)self _addTapRecognizerForView:v49 action:sel__expandSection_];

        [(SUUIProductPageTableUpdateHistorySection *)v48 setColorScheme:v64];
        -[SUUIProductPageTableUpdateHistorySection setFirstStringIndex:](v48, "setFirstStringIndex:", [v5 count]);
        [(SUUIProductPageTableUpdateHistorySection *)v48 setReleaseNotes:v39];
        [(SUUITableViewSection *)v48 setSectionIndex:[(NSMutableArray *)self->_sections count]];
        [(SUUIProductPageTableUpdateHistorySection *)v48 setTextLayoutCache:self->_textLayoutCache];
        v50 = [(SUUIProductPageTableUpdateHistorySection *)v48 headerViewForTableView:v56];
        [(SUUIProductPageDetailsViewController *)self _addTapRecognizerForView:v50 action:sel__expandSection_];

        [v5 addObjectsFromArray:v38];
        [(NSMutableArray *)self->_sections addObject:v48];
      }
      v3 = v57;
      long long v11 = v67;
    }
    v51 = [[SUUIProductPageTableLinksSection alloc] initWithItem:v11 clientContext:self->_clientContext askPermission:self->_askPermission];
    [(SUUIProductPageTableLinksSection *)v51 setColorScheme:v18];
    if ([(SUUIProductPageTableLinksSection *)v51 numberOfRowsInSection] >= 1)
    {
      [(SUUITableViewSection *)v51 setSectionIndex:[(NSMutableArray *)self->_sections count]];
      [(NSMutableArray *)self->_sections addObject:v51];
    }
    v52 = [(SUUIProductPageDetailsViewController *)self _copyrightSection];
    if (v52)
    {
      objc_msgSend(v52, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      [(NSMutableArray *)self->_sections addObject:v52];
    }
    [(SUUILayoutCache *)self->_textLayoutCache populateCacheWithLayoutRequests:v5];
    [v3 setTextLayoutCache:self->_textLayoutCache];
    [v3 setSections:self->_sections];
  }
  v53 = [v3 view];
  id v54 = objc_alloc(MEMORY[0x263F82E00]);
  [v53 frame];
  v55 = objc_msgSend(v54, "initWithFrame:");
  [v53 setAutoresizingMask:18];
  [v55 bounds];
  objc_msgSend(v53, "setFrame:");
  [v55 addSubview:v53];
  [(SUUIProductPageDetailsViewController *)self setView:v55];
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return [(SUUIProductPageTableViewController *)self->_tableViewController headerViewController];
}

- (void)setHeaderViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  [v5 setHeaderViewController:v4];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  id v6 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [v6 setDelegate:WeakRetained];
}

- (UIScrollView)scrollView
{
  v2 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  v3 = [v2 tableView];

  return (UIScrollView *)v3;
}

- (void)screenshotsWillBeginDragging:(id)a3
{
  if (!SUUIUserInterfaceIdiom(self->_clientContext))
  {
    id v6 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
    id v4 = [(SUUIProductPageDetailsViewController *)self _screenshotsSection];
    id v5 = [v4 headerView];
    [v6 scrollToView:v5 animated:1];
  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SUUIProductPageDetailsViewController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75__SUUIProductPageDetailsViewController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  id v19 = [*(id *)(a1 + 32) _screenshotsSection];
  BOOL v3 = [*(id *)(a1 + 32) isViewLoaded] == 0;
  v2 = v19;
  BOOL v3 = v3 || v19 == 0;
  if (!v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1024) item];
    uint64_t v5 = [v4 parentalControlsRank];
    id v6 = +[SUUIItemStateCenter defaultCenter];
    uint64_t v7 = [v6 parentalControlsRank];

    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1048) indexOfObjectIdenticalTo:v19];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v5 < v7)
    {
      BOOL v10 = v8 == 0x7FFFFFFFFFFFFFFFLL && v5 < v7;
      v2 = v19;
      if (!v10) {
        goto LABEL_20;
      }
      long long v11 = *(void **)(a1 + 32);
      long long v12 = (void *)v11[131];
      long long v13 = [v11 _storeNotesSection];
      [v12 insertObject:v19 atIndex:v13 != 0];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 1048) removeObjectIdenticalTo:v19];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 1048) count])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 1048) objectAtIndex:v14];
        [v15 setSectionIndex:v14];

        ++v14;
      }
      while (v14 < [*(id *)(*(void *)(a1 + 32) + 1048) count]);
    }
    v16 = [*(id *)(a1 + 32) _tableViewController];
    [v16 setSections:*(void *)(*(void *)(a1 + 32) + 1048)];

    v17 = [*(id *)(a1 + 32) _tableViewController];
    v18 = [v17 tableView];
    [v18 reloadData];

    v2 = v19;
  }
LABEL_20:
}

- (id)tableViewForTableViewSection:(id)a3
{
  return [(SUUIProductPageTableViewController *)self->_tableViewController tableView];
}

- (void)_expandSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  id v6 = [v5 tableView];

  [v4 locationInView:v6];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  sections = self->_sections;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__SUUIProductPageDetailsViewController__expandSection___block_invoke;
  v13[3] = &unk_265408A48;
  id v14 = v6;
  uint64_t v15 = v8;
  uint64_t v16 = v10;
  id v12 = v6;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v13];
}

uint64_t __55__SUUIProductPageDetailsViewController__expandSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  [*(id *)(a1 + 32) rectForHeaderInSection:a3];
  uint64_t v7 = CGRectContainsPoint(v15, *(CGPoint *)(a1 + 40));
  id v8 = v13;
  if (v7)
  {
    uint64_t v7 = [v13 isExpanded];
    if ((v7 & 1) == 0)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v13 setExpanded:1];
      if ([v13 numberOfRowsInSection] >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          long long v11 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:a3];
          [v9 addObject:v11];

          ++v10;
        }
        while (v10 < [v13 numberOfRowsInSection]);
      }
      [*(id *)(a1 + 32) insertRowsAtIndexPaths:v9 withRowAnimation:2];
    }
    *a4 = 1;
    id v8 = v13;
  }
  return MEMORY[0x270F9A758](v7, v8);
}

- (void)_addTapRecognizerForView:(id)a3 action:(SEL)a4
{
  id v6 = (objc_class *)MEMORY[0x263F82CB0];
  id v7 = a3;
  id v10 = (id)[[v6 alloc] initWithTarget:self action:a4];
  id v8 = [(SUUIProductPageTableViewController *)self->_tableViewController tableView];
  id v9 = [v8 panGestureRecognizer];
  [v10 requireGestureRecognizerToFail:v9];

  [v7 addGestureRecognizer:v10];
}

- (id)_bundledAppsSection
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUUIProductPage *)self->_productPage item];
  if ([v3 itemKind] == 17)
  {
    v29 = self;
    id v4 = [v3 childItemIdentifiers];
    long long v36 = 0uLL;
    uint64_t v37 = 0;
    SUUILockupStyleDefault((uint64_t)&v36);
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v12 = [v3 childItemForIdentifier:v11];
          id v13 = [SUUILockupComponent alloc];
          id v14 = v13;
          if (v12)
          {
            long long v30 = v36;
            uint64_t v31 = v37;
            uint64_t v15 = [(SUUILockupComponent *)v13 initWithItem:v12 style:&v30];
          }
          else
          {
            uint64_t v16 = [v11 longLongValue];
            long long v30 = v36;
            uint64_t v31 = v37;
            uint64_t v15 = [(SUUILockupComponent *)v14 initWithItemIdentifier:v16 style:&v30];
          }
          v17 = (void *)v15;
          if (v15) {
            [v5 addObject:v15];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v8);
    }

    uint64_t v18 = [v5 count];
    if (v18 < 1)
    {
      BOOL v22 = 0;
    }
    else
    {
      uint64_t v19 = v18;
      id v20 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v20 setNumberStyle:1];
      clientContext = v29->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_BUNDLED_APPS_%@" inTable:@"ProductPage"];
      }
      else {
      v23 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_BUNDLED_APPS_%@" inBundles:0 inTable:@"ProductPage"];
      }
      v24 = NSString;
      v25 = [NSNumber numberWithInteger:v19];
      v26 = [v20 stringFromNumber:v25];
      v27 = [v24 stringWithValidatedFormat:v23, @"%@", 0, v26 validFormatSpecifiers error];

      BOOL v22 = [[SUUIProductPageTableSwooshSection alloc] initWithLockups:v5 title:v27];
      [(SUUIProductPageDetailsViewController *)v29 _configureSwooshSection:v22];
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_configureSwooshSection:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  id v6 = [(SUUIProductPageDetailsViewController *)self clientContext];
  [v4 setClientContext:v6];

  uint64_t v7 = [(SUUIProductPageDetailsViewController *)self _resourceLoader];
  [v4 setResourceLoader:v7];

  uint64_t v8 = [(SUUIProductPage *)self->_productPage uber];
  uint64_t v9 = [v8 colorScheme];

  if (!v9)
  {
    uint64_t v9 = objc_alloc_init(SUUIColorScheme);
    id v10 = [v5 tableView];
    long long v11 = [v10 backgroundColor];
    [(SUUIColorScheme *)v9 setBackgroundColor:v11];
  }
  [v4 setColorScheme:v9];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __64__SUUIProductPageDetailsViewController__configureSwooshSection___block_invoke;
  uint64_t v16 = &unk_265408A70;
  objc_copyWeak(&v17, &location);
  [v4 setActionBlock:&v13];
  id v12 = objc_msgSend(v4, "swooshViewController", v13, v14, v15, v16);
  [v5 addChildViewController:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __64__SUUIProductPageDetailsViewController__configureSwooshSection___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 125);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained(v4 + 125);
      [v7 productPageChildOpenItem:v8];
    }
  }
}

- (id)_copyrightSection
{
  copyrightSection = self->_copyrightSection;
  if (!copyrightSection)
  {
    id v4 = [(SUUIProductPage *)self->_productPage item];
    id v5 = [v4 copyrightString];

    if ([v5 length])
    {
      char v6 = objc_alloc_init(SUUIProductPageCopyrightView);
      id v7 = [(SUUIProductPage *)self->_productPage uber];
      id v8 = [v7 colorScheme];
      [(SUUIProductPageCopyrightView *)v6 setColorScheme:v8];

      [(SUUIProductPageCopyrightView *)v6 setCopyrightString:v5];
      [(SUUIProductPageCopyrightView *)v6 frame];
      double v10 = v9;
      double v12 = v11;
      uint64_t v13 = objc_opt_class();
      [v13 defaultPageWidthForUserInterfaceIdiom:SUUIUserInterfaceIdiom(self->_clientContext)];
      -[SUUIProductPageCopyrightView sizeThatFits:](v6, "sizeThatFits:");
      -[SUUIProductPageCopyrightView setFrame:](v6, "setFrame:", v10, v12, v14, v15);
      uint64_t v16 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
      id v17 = self->_copyrightSection;
      self->_copyrightSection = v16;

      [(SUUIProductPageTableHeaderOnlySection *)self->_copyrightSection setHeaderView:v6];
    }

    copyrightSection = self->_copyrightSection;
  }
  return copyrightSection;
}

- (id)_descriptionSection
{
  descriptionSection = self->_descriptionSection;
  if (!descriptionSection)
  {
    id v4 = [(SUUIProductPage *)self->_productPage item];
    id v5 = [v4 itemDescription];

    if (v5)
    {
      char v6 = [[SUUIProductPageTableTextBoxSection alloc] initWithClientContext:self->_clientContext];
      id v7 = self->_descriptionSection;
      self->_descriptionSection = v6;

      [(SUUIProductPageTableTextBoxSection *)self->_descriptionSection setTextLayoutCache:self->_textLayoutCache];
      id v8 = self->_descriptionSection;
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_DESCRIPTION_TITLE" inTable:@"ProductPage"];
      }
      else {
      double v10 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_DESCRIPTION_TITLE" inBundles:0 inTable:@"ProductPage"];
      }
      [(SUUIProductPageTableTextBoxSection *)v8 setTitle:v10];

      double v11 = self->_descriptionSection;
      double v12 = [(SUUIProductPage *)self->_productPage uber];
      uint64_t v13 = [v12 colorScheme];
      [(SUUIProductPageTableTextBoxSection *)v11 setColorScheme:v13];
    }
    descriptionSection = self->_descriptionSection;
  }
  return descriptionSection;
}

- (id)_featuresSection
{
  BOOL v3 = [(SUUIProductPage *)self->_productPage item];
  uint64_t v4 = [v3 supportedFeatures];

  id v5 = [(SUUIProductPage *)self->_productPage item];
  uint64_t v6 = [v5 supportedGameCenterFeatures];

  if (v4)
  {
    id v7 = objc_alloc_init(SUUIProductPageFeaturesView);
    [(SUUIProductPageFeaturesView *)v7 setClientContext:self->_clientContext];
    id v8 = [(SUUIProductPage *)self->_productPage uber];
    double v9 = [v8 colorScheme];
    [(SUUIProductPageFeaturesView *)v7 setColorScheme:v9];

    [(SUUIProductPageFeaturesView *)v7 setFeatures:v4 gameCenterFeatures:v6];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_SUPPORTS_TITLE" inTable:@"ProductPage"];
    }
    else {
    double v12 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_SUPPORTS_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageFeaturesView *)v7 setTitle:v12];

    [(SUUIProductPageFeaturesView *)v7 frame];
    double v14 = v13;
    double v16 = v15;
    id v17 = objc_opt_class();
    [v17 defaultPageWidthForUserInterfaceIdiom:SUUIUserInterfaceIdiom(self->_clientContext)];
    -[SUUIProductPageFeaturesView sizeThatFits:](v7, "sizeThatFits:");
    -[SUUIProductPageFeaturesView setFrame:](v7, "setFrame:", v14, v16, v18, v19);
    double v11 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
    [(SUUIProductPageTableHeaderOnlySection *)v11 setHeaderView:v7];
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (id)_infoSection
{
  BOOL v3 = [(SUUIProductPage *)self->_productPage item];
  uint64_t v4 = [(SUUIProductPage *)self->_productPage productInformation];
  if (!v4)
  {
    if (v3)
    {
      id v5 = [[SUUIProductPageInformationViewController alloc] initWithItem:v3 clientContext:self->_clientContext];
      if (v5) {
        goto LABEL_6;
      }
    }
    else
    {
      id v5 = 0;
    }
LABEL_8:
    id v20 = 0;
    goto LABEL_9;
  }
  id v5 = [[SUUIProductPageInformationViewController alloc] initWithProductInformation:v4 clientContext:self->_clientContext];
  if (!v5) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = [(SUUIProductPageDetailsViewController *)self operationQueue];
  [(SUUIProductPageInformationViewController *)v5 setOperationQueue:v6];

  id v7 = [(SUUIProductPageInformationViewController *)v5 view];
  id v8 = [(SUUIProductPage *)self->_productPage uber];
  double v9 = [v8 colorScheme];
  [v7 setColorScheme:v9];

  double v10 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
  [v10 addChildViewController:v5];

  double v11 = [(SUUIProductPageInformationViewController *)v5 view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v16 = objc_opt_class();
  [v16 defaultPageWidthForUserInterfaceIdiom:SUUIUserInterfaceIdiom(self->_clientContext)];
  double v18 = v17;
  objc_msgSend(v11, "sizeThatFits:");
  objc_msgSend(v11, "setFrame:", v13, v15, v18, v19);
  id v20 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
  [(SUUIProductPageTableHeaderOnlySection *)v20 setHeaderView:v11];

LABEL_9:
  uint64_t v21 = v20;

  return v21;
}

- (id)_parentBundlesSection
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUUIProductPage *)self->_productPage item];
  uint64_t v4 = [v3 parentBundleItemIdentifiers];

  long long v26 = 0uLL;
  uint64_t v27 = 0;
  if (objc_msgSend(v4, "count", SUUILockupStyleDefault((uint64_t)&v26)) == 1
    && SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    uint64_t v27 = 466;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v12 = [SUUILockupComponent alloc];
        uint64_t v13 = [v11 longLongValue];
        long long v20 = v26;
        uint64_t v21 = v27;
        double v14 = [(SUUILockupComponent *)v12 initWithItemIdentifier:v13 style:&v20];
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_PARENT_BUNDLE_TITLE" inTable:@"ProductPage"];
  }
  else {
  double v16 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_PARENT_BUNDLE_TITLE" inBundles:0 inTable:@"ProductPage"];
  }
  if ([v5 count] == 1)
  {
    double v17 = [[SUUIProductPageTableLockupsSection alloc] initWithLockups:v5 title:v16];
    [(SUUITableViewSection *)v17 setDelegate:self];
    double v18 = [(SUUIProductPageDetailsViewController *)self _resourceLoader];
    [(SUUIProductPageTableLockupsSection *)v17 setResourceLoader:v18];
  }
  else if ((unint64_t)[v5 count] < 2)
  {
    double v17 = 0;
  }
  else
  {
    double v17 = [[SUUIProductPageTableSwooshSection alloc] initWithLockups:v5 title:v16];
    [(SUUIProductPageDetailsViewController *)self _configureSwooshSection:v17];
  }

  return v17;
}

- (id)_resourceLoader
{
  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    uint64_t v4 = [SUUIResourceLoader alloc];
    id v5 = [(SUUIProductPageDetailsViewController *)self clientContext];
    id v6 = [(SUUIResourceLoader *)v4 initWithClientContext:v5];
    uint64_t v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    uint64_t v8 = self->_resourceLoader;
    uint64_t v9 = SUUIResourceLoaderGetNameForObject(self);
    [(SUUIResourceLoader *)v8 setName:v9];

    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (id)_screenshotsSection
{
  screenshotsSection = self->_screenshotsSection;
  if (!screenshotsSection)
  {
    uint64_t v4 = [(SUUIProductPage *)self->_productPage item];
    id v5 = [v4 screenshots];
    id v6 = [v4 videos];
    if ([v5 count] || objc_msgSend(v6, "count"))
    {
      uint64_t v7 = [SUUIScreenshotsViewController alloc];
      uint64_t v8 = [(SUUIProductPageDetailsViewController *)self clientContext];
      uint64_t v9 = [(SUUIScreenshotsViewController *)v7 initWithTrailers:v6 screenshots:v5 clientContext:v8];

      [(SUUIScreenshotsViewController *)v9 setDelegate:self];
      double v10 = [(SUUIProductPageDetailsViewController *)self operationQueue];
      [(SUUIScreenshotsViewController *)v9 setOperationQueue:v10];

      double v11 = [(SUUIProductPageDetailsViewController *)self _tableViewController];
      [v11 addChildViewController:v9];

      double v12 = [(SUUIScreenshotsViewController *)v9 view];
      [v12 setAutoresizingMask:2];
      uint64_t v13 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
      double v14 = self->_screenshotsSection;
      self->_screenshotsSection = v13;

      [(SUUIProductPageTableHeaderOnlySection *)self->_screenshotsSection setHeaderView:v12];
      [(SUUIScreenshotsViewController *)v9 reloadData];
    }
    screenshotsSection = self->_screenshotsSection;
  }
  return screenshotsSection;
}

- (id)_storeNotesSection
{
  storeNotesSection = self->_storeNotesSection;
  if (!storeNotesSection)
  {
    uint64_t v4 = [(SUUIProductPage *)self->_productPage item];
    id v5 = [v4 storeNotes];
    id v6 = [v5 standardNotes];

    if (v6)
    {
      uint64_t v7 = [[SUUIProductPageTableTextBoxSection alloc] initWithClientContext:self->_clientContext];
      uint64_t v8 = self->_storeNotesSection;
      self->_storeNotesSection = v7;

      [(SUUIProductPageTableTextBoxSection *)self->_storeNotesSection setTextLayoutCache:self->_textLayoutCache];
      uint64_t v9 = self->_storeNotesSection;
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_STORE_NOTES_TITLE" inTable:@"ProductPage"];
      }
      else {
      double v11 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_STORE_NOTES_TITLE" inBundles:0 inTable:@"ProductPage"];
      }
      [(SUUIProductPageTableTextBoxSection *)v9 setTitle:v11];

      double v12 = self->_storeNotesSection;
      uint64_t v13 = [(SUUIProductPage *)self->_productPage uber];
      double v14 = [v13 colorScheme];
      [(SUUIProductPageTableTextBoxSection *)v12 setColorScheme:v14];
    }
    storeNotesSection = self->_storeNotesSection;
  }
  return storeNotesSection;
}

- (id)_tableViewController
{
  tableViewController = self->_tableViewController;
  if (!tableViewController)
  {
    uint64_t v4 = objc_alloc_init(SUUIProductPageTableViewController);
    id v5 = self->_tableViewController;
    self->_tableViewController = v4;

    [(SUUIProductPageTableViewController *)self->_tableViewController setClientContext:self->_clientContext];
    [(SUUIProductPageTableViewController *)self->_tableViewController setDelegateSender:self];
    id v6 = self->_tableViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(SUUIProductPageTableViewController *)v6 setDelegate:WeakRetained];

    uint64_t v8 = self->_tableViewController;
    uint64_t v9 = [(SUUIProductPage *)self->_productPage uber];
    double v10 = [v9 colorScheme];
    [(SUUIProductPageTableViewController *)v8 setColorScheme:v10];

    [(SUUIProductPageTableViewController *)self->_tableViewController setSections:self->_sections];
    [(SUUIProductPageTableViewController *)self->_tableViewController setTextLayoutCache:self->_textLayoutCache];
    [(SUUIProductPageDetailsViewController *)self addChildViewController:self->_tableViewController];
    tableViewController = self->_tableViewController;
  }
  return tableViewController;
}

- (id)_textLayoutRequestWithText:(id)a3 widthOffset:(double)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SUUITextLayoutRequest);
  [(SUUITextLayoutRequest *)v7 setNumberOfLines:5];
  [(SUUITextLayoutRequest *)v7 setText:v6];

  uint64_t v8 = objc_opt_class();
  [v8 defaultPageWidthForUserInterfaceIdiom:SUUIUserInterfaceIdiom(self->_clientContext)];
  [(SUUITextLayoutRequest *)v7 setWidth:v9 + -30.0 - a4];
  return v7;
}

- (id)_whatsNewSection
{
  whatsNewSection = self->_whatsNewSection;
  if (!whatsNewSection)
  {
    uint64_t v4 = [(SUUIProductPage *)self->_productPage item];
    id v5 = [v4 updateDescription];
    if (v5)
    {
      id v6 = [[SUUIProductPageTableTextBoxSection alloc] initWithClientContext:self->_clientContext];
      uint64_t v7 = self->_whatsNewSection;
      self->_whatsNewSection = v6;

      [(SUUIProductPageTableTextBoxSection *)self->_whatsNewSection setTextLayoutCache:self->_textLayoutCache];
      uint64_t v8 = self->_whatsNewSection;
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_WHATS_NEW_TITLE" inTable:@"ProductPage"];
      }
      else {
      double v10 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_WHATS_NEW_TITLE" inBundles:0 inTable:@"ProductPage"];
      }
      [(SUUIProductPageTableTextBoxSection *)v8 setTitle:v10];

      double v11 = self->_whatsNewSection;
      double v12 = [(SUUIProductPage *)self->_productPage uber];
      uint64_t v13 = [v12 colorScheme];
      [(SUUIProductPageTableTextBoxSection *)v11 setColorScheme:v13];

      double v14 = [v4 lastUpdateDateString];
      if (v14) {
        [(SUUIProductPageTableTextBoxSection *)self->_whatsNewSection setSubtitle:v14];
      }
    }
    whatsNewSection = self->_whatsNewSection;
  }
  return whatsNewSection;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIProductPageChildViewControllerDelegate *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whatsNewSection, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_storeNotesSection, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_screenshotsSection, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_descriptionSection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_copyrightSection, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end