@interface SUUIProductPageTableViewController
- (NSArray)sections;
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)colorScheme;
- (SUUILayoutCache)textLayoutCache;
- (SUUIProductPageChildViewController)delegateSender;
- (SUUIProductPageChildViewControllerDelegate)delegate;
- (SUUIProductPageHeaderViewController)headerViewController;
- (SUUIProductPageTableViewController)initWithInAppPurchases:(id)a3 clientContext:(id)a4;
- (SUUIProductPageTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUUIProductPageTableViewController)initWithReleaseNotes:(id)a3 clientContext:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_tableView;
- (id)_textLayoutRequestWithText:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addHeaderView;
- (void)dealloc;
- (void)loadView;
- (void)scrollToView:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateSender:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setSections:(id)a3;
- (void)setTextLayoutCache:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIProductPageTableViewController

- (SUUIProductPageTableViewController)initWithInAppPurchases:(id)a3 clientContext:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUIProductPageTableViewController;
  v8 = [(SUUIProductPageTableViewController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    p_clientContext = (id *)&v8->_clientContext;
    objc_storeStrong((id *)&v8->_clientContext, a4);
    if (*p_clientContext) {
      [*p_clientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inTable:@"ProductPage"];
    }
    else {
    v11 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageTableViewController *)v9 setTitle:v11];

    v12 = [[SUUIProductPageTableInAppPurchasesSection alloc] initWithInAppPurchases:v6 clientContext:v7];
    [(SUUIProductPageTableInAppPurchasesSection *)v12 setExpanded:1];
    [(SUUITableViewSection *)v12 setHidesHeaderView:1];
    v16[0] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [(SUUIProductPageTableViewController *)v9 setSections:v13];
  }
  return v9;
}

- (SUUIProductPageTableViewController)initWithReleaseNotes:(id)a3 clientContext:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SUUIProductPageTableViewController;
  v8 = [(SUUIProductPageTableViewController *)&v31 init];
  if (v8)
  {
    if ([v6 count])
    {
      objc_storeStrong((id *)&v8->_clientContext, a4);
      if (v8->_clientContext) {
        [(SUUIClientContext *)v8->_clientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inTable:@"ProductPage"];
      }
      else {
      v10 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inBundles:0 inTable:@"ProductPage"];
      }
      -[SUUIProductPageTableViewController setTitle:](v8, "setTitle:", v10, v7);

      v9 = [[SUUIProductPageTableUpdateHistorySection alloc] initWithClientContext:v8->_clientContext];
      [(SUUIProductPageTableUpdateHistorySection *)v9 setExpanded:1];
      [(SUUITableViewSection *)v9 setHidesHeaderView:1];
      [(SUUIProductPageTableUpdateHistorySection *)v9 setReleaseNotes:v6];
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v26 = v6;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) changeNotes];
            v18 = (void *)v17;
            if (v17) {
              v19 = (__CFString *)v17;
            }
            else {
              v19 = &stru_2704F8130;
            }
            v20 = [(SUUIProductPageTableViewController *)v8 _textLayoutRequestWithText:v19];
            [v11 addObject:v20];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v14);
      }

      v21 = objc_alloc_init(SUUILayoutCache);
      textLayoutCache = v8->_textLayoutCache;
      v8->_textLayoutCache = v21;

      [(SUUILayoutCache *)v8->_textLayoutCache populateCacheWithLayoutRequests:v11];
      [(SUUIProductPageTableUpdateHistorySection *)v9 setTextLayoutCache:v8->_textLayoutCache];
      [(SUUIProductPageTableViewController *)v8 setTextLayoutCache:v8->_textLayoutCache];
      v32 = v9;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      [(SUUIProductPageTableViewController *)v8 setSections:v23];

      id v7 = v25;
      id v6 = v26;
    }
    else
    {
      v9 = (SUUIProductPageTableUpdateHistorySection *)v8;
      v8 = 0;
    }
  }
  return v8;
}

- (SUUIProductPageTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIProductPageTableViewController;
  v4 = [(SUUIProductPageTableViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
    color = v4->_color;
    v4->_color = (UIColor *)v5;
  }
  return v4;
}

- (void)dealloc
{
  [(SUUIProductPageTableView *)self->_tableView setDataSource:0];
  [(SUUIProductPageTableView *)self->_tableView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageTableViewController;
  [(SUUIProductPageTableViewController *)&v3 dealloc];
}

- (void)scrollToView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 topContentOffset];
    double v9 = v8;
    double v11 = v10;

    [v13 bounds];
    objc_msgSend(v13, "convertPoint:toView:", self->_tableView);
    -[SUUIProductPageTableView setContentOffset:animated:](self->_tableView, "setContentOffset:animated:", v4, v9, v11 + v12);
  }
}

- (void)setColorScheme:(id)a3
{
  uint64_t v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    double v12 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    id v7 = [(SUUIColorScheme *)*p_colorScheme backgroundColor];
    double v8 = v7;
    if (!v7)
    {
      double v8 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
    }
    objc_storeStrong((id *)&self->_color, v8);
    if (!v7) {

    }
    tableView = self->_tableView;
    double v10 = [(SUUIColorScheme *)*p_colorScheme backgroundColor];
    if (v10)
    {
      [(SUUIProductPageTableView *)tableView setBackgroundColor:v10];
    }
    else
    {
      double v11 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
      [(SUUIProductPageTableView *)tableView setBackgroundColor:v11];
    }
    uint64_t v5 = v12;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    uint64_t v5 = obj;
    if (self->_tableView)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      id v7 = objc_loadWeakRetained((id *)&self->_delegateSender);
      [v6 productPageChildViewControllerDidLoadScrollView:v7];

      uint64_t v5 = obj;
    }
  }
}

- (void)setHeaderViewController:(id)a3
{
  p_headerViewController = &self->_headerViewController;
  id v7 = (SUUIProductPageHeaderViewController *)a3;
  if (*p_headerViewController != v7)
  {
    [(SUUIProductPageTableView *)self->_tableView setProductPageHeaderView:0];
    id v6 = [(SUUIProductPageHeaderViewController *)*p_headerViewController view];
    [v6 removeFromSuperview];

    [(SUUIProductPageHeaderViewController *)*p_headerViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUIProductPageTableViewController addChildViewController:](self, "addChildViewController:");
      if (self->_tableView) {
        [(SUUIProductPageTableViewController *)self _addHeaderView];
      }
    }
  }
}

- (void)setSections:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_sections != a3)
  {
    BOOL v4 = (NSArray *)[a3 copy];
    sections = self->_sections;
    self->_sections = v4;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_sections;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setClientContext:", self->_clientContext, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)loadView
{
  id v3 = [(SUUIProductPageTableViewController *)self _tableView];
  [(SUUIProductPageTableViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUUIProductPageTableView *)self->_tableView indexPathForSelectedRow];
  if (v5) {
    [(SUUIProductPageTableView *)self->_tableView deselectRowAtIndexPath:v5 animated:v3];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageTableViewController;
  [(SUUIProductPageTableViewController *)&v6 viewWillAppear:v3];
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = objc_loadWeakRetained((id *)&self->_delegateSender);
  [WeakRetained productPageChildViewControllerDidScroll:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  uint64_t v9 = [v8 tableViewCellForTableView:v7 indexPath:v6];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 numberOfRowsInSection];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", [v7 section]);
  uint64_t v9 = [v8 selectionActionForTableView:v6 indexPath:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    switch([v9 actionType])
    {
      case 0:
        v26[0] = v7;
        v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
        [v6 reloadRowsAtIndexPaths:v19 withRowAnimation:100];

        break;
      case 1:
      case 2:
        long long v11 = [v10 URL];
        if (!v11) {
          goto LABEL_16;
        }
        p_delegate = &self->_delegate;
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        char v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) == 0) {
          goto LABEL_16;
        }
        uint64_t v15 = objc_loadWeakRetained((id *)p_delegate);
        uint64_t v16 = [v10 viewControllerBlock];
        uint64_t v17 = v15;
        v18 = v11;
        goto LABEL_14;
      case 3:
        long long v11 = [(SUUIProductPageTableViewController *)self navigationController];
        if (v11)
        {
          uint64_t v15 = [v10 viewController];
          [v11 pushViewController:v15 animated:1];
        }
        else
        {
          v23 = &self->_delegate;
          id v24 = objc_loadWeakRetained((id *)v23);
          char v25 = objc_opt_respondsToSelector();

          if ((v25 & 1) == 0) {
            goto LABEL_16;
          }
          uint64_t v15 = objc_loadWeakRetained((id *)v23);
          uint64_t v16 = [v10 viewControllerBlock];
          uint64_t v17 = v15;
          v18 = 0;
LABEL_14:
          [v17 productPageChildOpenURL:v18 viewControllerBlock:v16];
        }
LABEL_15:

LABEL_16:
        [v6 deselectRowAtIndexPath:v7 animated:1];

        break;
      case 4:
        long long v11 = [v10 item];
        if (!v11) {
          goto LABEL_16;
        }
        v20 = &self->_delegate;
        id v21 = objc_loadWeakRetained((id *)v20);
        char v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0) {
          goto LABEL_16;
        }
        uint64_t v15 = objc_loadWeakRetained((id *)v20);
        [v15 productPageChildOpenItem:v11];
        goto LABEL_15;
      default:
        break;
    }
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  sections = self->_sections;
  id v6 = a3;
  id v7 = [(NSArray *)sections objectAtIndex:a4];
  uint64_t v8 = [v7 footerViewForTableView:v6];

  if (v8)
  {
    [v8 frame];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  sections = self->_sections;
  id v6 = a3;
  id v7 = [(NSArray *)sections objectAtIndex:a4];
  uint64_t v8 = [v7 headerViewForTableView:v6];

  if (v8)
  {
    [v8 frame];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  [v8 heightForCellInTableView:v7 indexPath:v6];
  double v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  sections = self->_sections;
  id v7 = a3;
  uint64_t v8 = [(NSArray *)sections objectAtIndex:a4];
  double v9 = [v8 footerViewForTableView:v7];

  if (v9) {
    [v9 setBackgroundColor:self->_color];
  }

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  sections = self->_sections;
  id v7 = a3;
  uint64_t v8 = [(NSArray *)sections objectAtIndex:a4];
  double v9 = [v8 headerViewForTableView:v7];

  if (v9) {
    [v9 setBackgroundColor:self->_color];
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)_addHeaderView
{
  id v8 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v8 setAutoresizingMask:2];
  [v8 frame];
  double v4 = v3;
  [(SUUIProductPageTableView *)self->_tableView bounds];
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  [(SUUIProductPageTableView *)self->_tableView _addContentSubview:v8 atBack:0];
  int64_t v5 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v5 setAutoresizingMask:2];
  [v5 frame];
  double v7 = v6;
  [(SUUIProductPageTableView *)self->_tableView bounds];
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  [(SUUIProductPageTableView *)self->_tableView setProductPageHeaderView:v5];
}

- (id)_tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    double v4 = objc_alloc_init(SUUIProductPageTableView);
    int64_t v5 = self->_tableView;
    self->_tableView = v4;

    double v6 = self->_tableView;
    double v7 = [(SUUIColorScheme *)self->_colorScheme backgroundColor];
    if (v7)
    {
      [(SUUIProductPageTableView *)v6 setBackgroundColor:v7];
    }
    else
    {
      id v8 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
      [(SUUIProductPageTableView *)v6 setBackgroundColor:v8];
    }
    [(SUUIProductPageTableView *)self->_tableView setDataSource:self];
    [(SUUIProductPageTableView *)self->_tableView setDelegate:self];
    [(SUUIProductPageTableView *)self->_tableView _setHeaderAndFooterViewsFloat:0];
    [(SUUIProductPageTableView *)self->_tableView setSeparatorStyle:0];
    if (self->_headerViewController) {
      [(SUUIProductPageTableViewController *)self _addHeaderView];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = objc_loadWeakRetained((id *)&self->_delegateSender);
    [WeakRetained productPageChildViewControllerDidLoadScrollView:v10];

    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_textLayoutRequestWithText:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_alloc_init(SUUITextLayoutRequest);
  [(SUUITextLayoutRequest *)v5 setNumberOfLines:5];
  [(SUUITextLayoutRequest *)v5 setText:v4];

  +[SUUIProductPageDetailsViewController defaultPageWidthForUserInterfaceIdiom:SUUIUserInterfaceIdiom(self->_clientContext)];
  [(SUUITextLayoutRequest *)v5 setWidth:v6 + -30.0];
  return v5;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIProductPageChildViewController)delegateSender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateSender);
  return (SUUIProductPageChildViewController *)WeakRetained;
}

- (void)setDelegateSender:(id)a3
{
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIProductPageChildViewControllerDelegate *)WeakRetained;
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (NSArray)sections
{
  return self->_sections;
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_evenColor, 0);
  objc_destroyWeak((id *)&self->_delegateSender);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end