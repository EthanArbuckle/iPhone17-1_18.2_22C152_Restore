@interface SUStructuredPageViewController
- (BOOL)_gotoURLForItem:(id)a3 withURLIndex:(int64_t)a4;
- (BOOL)_handleLoadMoreForIndexPath:(id)a3;
- (BOOL)canSelectRowAtIndexPath:(id)a3;
- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4;
- (BOOL)hasDisplayableContent;
- (BOOL)loadMoreWithURL:(id)a3;
- (CGRect)documentBounds;
- (Class)dataSourceClass;
- (SUStructuredPage)structuredPage;
- (SUStructuredPageViewController)init;
- (id)newDataSource;
- (id)newNoItemsOverlayLabel;
- (id)newTermsAndConditionsFooter;
- (id)storePageProtocol;
- (void)_loadMoreOperation:(id)a3 finishedWithOutput:(id)a4;
- (void)_loadMoreWithURL:(id)a3;
- (void)_reloadLoadMoreCellAtIndexPath:(id)a3;
- (void)_reloadNoItemsLabel;
- (void)_reloadTermsAndConditions;
- (void)bannerCell:(id)a3 tappedButtonAtIndex:(int64_t)a4;
- (void)dealloc;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)reloadData;
- (void)reloadWithStorePage:(id)a3 forURL:(id)a4;
- (void)setDataSourceClass:(Class)a3;
- (void)setSkLoading:(BOOL)a3;
- (void)setStructuredPage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUStructuredPageViewController

- (SUStructuredPageViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUStructuredPageViewController;
  v2 = [(SUItemTableViewController *)&v4 init];
  if (v2) {
    [(SUStructuredPageViewController *)v2 setDataSourceClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageViewController;
  [(SUItemTableViewController *)&v3 dealloc];
}

- (id)newDataSource
{
  id v3 = objc_alloc_init(self->_dataSourceClass);
  objc_msgSend(v3, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  int64_t v4 = [(SUStructuredPage *)self->_structuredPage type];
  if (v4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4 == 7;
  }
  [v3 setStyle:v5];
  return v3;
}

- (id)newNoItemsOverlayLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
  objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 18.0));
  if ([(SUStructuredPage *)self->_structuredPage type] == 7) {
    objc_msgSend(v3, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"NO_MATCHES", &stru_26DB8C5F8, 0));
  }
  return v3;
}

- (id)newTermsAndConditionsFooter
{
  if ([(SUTableDataSource *)[(SUTableViewController *)self dataSource] numberOfSections] < 1)return 0; {
  id v3 = objc_alloc_init(SUTermsAndConditionsView);
  }
  [(SUTermsAndConditionsView *)v3 setClientInterface:[(SUViewController *)self clientInterface]];
  [(SUTermsAndConditionsView *)v3 setDelegate:self];
  BOOL v4 = [(SUTableDataSource *)[(SUTableViewController *)self dataSource] style] == 1
    || [(SUStructuredPage *)self->_structuredPage shouldHideSignInButton];
  [(SUTermsAndConditionsView *)v3 setHideAccountButton:v4];
  if (([(SUTableView *)self->super.super._tableView isIndexHidden] & 1) == 0)
  {
    [(SUTableView *)self->super.super._tableView indexFrame];
    [(SUTermsAndConditionsView *)v3 setRightMargin:v5];
  }
  [(SUTermsAndConditionsView *)v3 sizeToFit];
  return v3;
}

- (BOOL)canSelectRowAtIndexPath:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3), "itemLinks"), "count") != 0;
}

- (CGRect)documentBounds
{
  tableView = self->super.super._tableView;
  if (tableView)
  {
    double v3 = *MEMORY[0x263F001A8];
    double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
    [(SUTableView *)tableView contentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v3 = *MEMORY[0x263F001A0];
    double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v9 = v3;
  double v10 = v4;
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  double v6 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource", a3, a4), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if ([v6 itemType] == 4)
  {
    LOBYTE(v7) = [(SUStructuredPageViewController *)self _handleLoadMoreForIndexPath:a3];
  }
  else if ([v6 itemType] == 3 {
         && [(SUTableDataSource *)[(SUTableViewController *)self dataSource] style] == 1)
  }
  {
    double v8 = (void *)[v6 itemLinksForType:0];
    uint64_t v7 = [v8 count];
    if (v7)
    {
      double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "URL"));
      BOOL v10 = [(UIViewController *)self reloadWithURLRequestProperties:v9];

      LOBYTE(v7) = v10;
    }
  }
  else
  {
    LOBYTE(v7) = [(SUStructuredPageViewController *)self _gotoURLForItem:v6 withURLIndex:0];
  }
  return v7;
}

- (BOOL)hasDisplayableContent
{
  return [(SUStructuredPage *)self->_structuredPage hasDisplayableContent];
}

- (BOOL)loadMoreWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUStructuredPageViewController;
  if (!-[UIViewController loadMoreWithURL:](&v6, sel_loadMoreWithURL_)) {
    [(SUStructuredPageViewController *)self _loadMoreWithURL:a3];
  }
  return 1;
}

- (void)reloadData
{
  double v3 = [(SUStructuredPageViewController *)self structuredPage];
  [(SUViewController *)self setTitle:[(SUStructuredPage *)v3 title] changeTabBarItem:0];
  uint64_t v4 = [(SUTableDataSource *)[(SUTableViewController *)self dataSource] structuredPage];
  if ([(SUViewController *)self isSkLoading]) {
    double v5 = 0;
  }
  else {
    double v5 = v3;
  }
  if ((SUStructuredPage *)v4 != v5)
  {
    id v6 = [(SUStructuredPageViewController *)self newDataSource];
    [v6 setStructuredPage:v3];
    [(SUTableViewController *)self setDataSource:v6];
  }
  [(SUStructuredPageViewController *)self _reloadNoItemsLabel];
  [(SUStructuredPageViewController *)self _reloadTermsAndConditions];
  v7.receiver = self;
  v7.super_class = (Class)SUStructuredPageViewController;
  [(SUItemTableViewController *)&v7 reloadData];
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUStructuredPageViewController.m", 180, @"Page must be structured");
    }
  }
  -[SUStructuredPageViewController setStructuredPage:](self, "setStructuredPage:", a3, a4);
  [(SUStructuredPageViewController *)self reloadData];
  objc_super v7 = [(SUStructuredPage *)self->_structuredPage sectionsGroup];

  [(UIViewController *)self reloadForSectionsWithGroup:v7];
}

- (void)setSkLoading:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIViewController *)self isSkLoaded];
  v9.receiver = self;
  v9.super_class = (Class)SUStructuredPageViewController;
  [(SUViewController *)&v9 setSkLoading:v3];
  if (v5 != [(UIViewController *)self isSkLoaded])
  {
    id v6 = [(SUTableViewController *)self tableView];
    objc_super v7 = v6;
    if (v3) {
      double v8 = 0;
    }
    else {
      double v8 = self;
    }
    [(UITableView *)v6 setDataSource:v8];
    [(UITableView *)v7 setDelegate:v8];
    [(SUStructuredPageViewController *)self reloadData];
  }
}

- (id)storePageProtocol
{
  return [(SUStructuredPage *)self->_structuredPage protocol];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SUStructuredPage *)self->_structuredPage protocol];
  id v6 = [(SUStorePageProtocol *)v5 focusedItemIdentifier];
  if (v6)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "indexPathOfItemWithIdentifier:", -[NSNumber itemIdentifierValue](v6, "itemIdentifierValue"));
    if (v7) {
      [(SUTableViewController *)self scrollToRowAtIndexPath:v7 atScrollPosition:1 animated:0];
    }
    [(SUStorePageProtocol *)v5 setFocusedItemIdentifier:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)SUStructuredPageViewController;
  [(SUTableViewController *)&v8 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  structuredPage = self->_structuredPage;
  if (structuredPage) {
    [(UIViewController *)self reloadForSectionsWithGroup:[(SUStructuredPage *)structuredPage sectionsGroup]];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUStructuredPageViewController;
  [(SUTableViewController *)&v6 viewWillAppear:v3];
}

- (void)setDataSourceClass:(Class)a3
{
  Class dataSourceClass = self->_dataSourceClass;
  if (dataSourceClass != a3)
  {

    self->_Class dataSourceClass = a3;
  }
}

- (void)setStructuredPage:(id)a3
{
  structuredPage = self->_structuredPage;
  if (structuredPage != a3)
  {

    self->_structuredPage = (SUStructuredPage *)a3;
    [(SUViewController *)self storePageProtocolDidChange];
  }
}

- (void)bannerCell:(id)a3 tappedButtonAtIndex:(int64_t)a4
{
  objc_super v6 = [(UITableView *)[(SUTableViewController *)self tableView] indexPathForCell:a3];
  if (v6)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", v6);
    [(SUStructuredPageViewController *)self _gotoURLForItem:v7 withURLIndex:a4];
  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v7 = (id)[(SUTableDataSource *)[(SUTableViewController *)self dataSource] activeLoadMoreItem];
  if (v7)
  {
    objc_super v8 = v7;
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "indexPathOfItem:", v7);
    [(SUTableDataSource *)[(SUTableViewController *)self dataSource] setActiveLoadMoreItem:0];
    if (v9)
    {
      BOOL v10 = [(SUTableViewController *)self tableView];
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v10, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v9, 0), 5);
    }
    [(SUViewController *)self presentDialogForError:a4 pendUntilVisible:1];
  }
  [(SUStructuredPageViewController *)self setSkLoading:0];
  v11.receiver = self;
  v11.super_class = (Class)SUStructuredPageViewController;
  [(SUViewController *)&v11 operation:a3 failedWithError:a4];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  [(SUStructuredPageViewController *)self setSkLoading:0];
  if ([(SUTableDataSource *)[(SUTableViewController *)self dataSource] activeLoadMoreItem])
  {
    [(SUStructuredPageViewController *)self _loadMoreOperation:a3 finishedWithOutput:a4];
  }
}

- (BOOL)_handleLoadMoreForIndexPath:(id)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  [(SUTableDataSource *)[(SUTableViewController *)self dataSource] setActiveLoadMoreItem:v5];
  [(UITableView *)[(SUTableViewController *)self tableView] deselectRowAtIndexPath:a3 animated:1];
  [(SUStructuredPageViewController *)self performSelector:sel__reloadLoadMoreCellAtIndexPath_ withObject:a3 afterDelay:0.25];
  if ([v5 itemType] == 4)
  {
    objc_super v6 = (void *)[v5 itemLinksForType:0];
    if ([v6 count])
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "URL");
      if ([v5 BOOLValueForProperty:@"reload-in-place"]) {
        [(SUStructuredPageViewController *)self loadMoreWithURL:v7];
      }
      else {
        [(SUStructuredPageViewController *)self _loadMoreWithURL:v7];
      }
    }
  }
  return 1;
}

- (BOOL)_gotoURLForItem:(id)a3 withURLIndex:(int64_t)a4
{
  objc_super v6 = (void *)[a3 itemLinks];
  if ([v6 count] <= (unint64_t)a4) {
    return 0;
  }
  uint64_t v7 = (void *)[v6 objectAtIndex:a4];
  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(v7, "URL"));
  if ([v7 linkType] == 1)
  {
    uint64_t v9 = objc_alloc_init(SUAccountViewController);
    [(SUViewController *)v9 setClientInterface:[(SUViewController *)self clientInterface]];
    [(SUStorePageViewController *)v9 setURLRequestProperties:v8];
    char v10 = +[SUClientDispatch enterAccountFlowWithViewController:v9 animated:1];
  }
  else if ([v7 linkTarget] == 1)
  {
    objc_super v11 = [(SUTableViewController *)self tableView];
    [(UITableView *)v11 deselectRowAtIndexPath:[(UITableView *)v11 indexPathForSelectedRow] animated:1];
    char v10 = SUOpenExternalURL([v8 URL], -[SUViewController clientInterface](self, "clientInterface"));
  }
  else
  {
    v12 = objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", -[UIViewController section](self, "section"));
    objc_msgSend(v12, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    [v12 setURLRequestProperties:v8];
    char v10 = -[UIViewController pushStorePage:withTarget:animated:](self, "pushStorePage:withTarget:animated:", v12, [v7 linkTarget], 1);
  }
  return v10;
}

- (void)_loadMoreOperation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = (id)[(SUTableDataSource *)[(SUTableViewController *)self dataSource] activeLoadMoreItem];
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "indexPathOfItem:", v8);
  if (v9)
  {
    uint64_t v10 = v9;
    [(SUTableDataSource *)[(SUTableViewController *)self dataSource] setActiveLoadMoreItem:0];
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadLoadMoreCellAtIndexPath_ object:v10];
    if (objc_msgSend((id)objc_msgSend(a3, "dataProvider"), "outputType"))
    {
      objc_super v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        int v22 = 138412290;
        uint64_t v23 = objc_opt_class();
        LODWORD(v21) = 12;
        v20 = &v22;
        uint64_t v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v22, v21);
          free(v15);
          v20 = (int *)v16;
          SSFileLog();
        }
      }
      v17 = [(SUTableViewController *)self tableView];
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v17, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v10, 0), 5);
      [(SUViewController *)self presentDialogForError:SSError() pendUntilVisible:1];
    }
    else
    {
      v18 = objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList");
      if ([v8 BOOLValueForProperty:@"reload-in-place"])
      {
        -[SUStructuredPageViewController reloadWithStorePage:forURL:](self, "reloadWithStorePage:forURL:", a4, objc_msgSend((id)objc_msgSend(a3, "response"), "URL"));
      }
      else
      {
        v19 = objc_msgSend((id)objc_msgSend(a4, "itemList"), "copyItems");
        [v18 replaceItemAtIndexPath:v10 withItems:v19];
        [(SUStructuredPageViewController *)self reloadData];
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUStructuredPageViewController.m", 349, @"Load more operation finished without an index path");
    [(SUTableDataSource *)[(SUTableViewController *)self dataSource] setActiveLoadMoreItem:0];
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadLoadMoreCellAtIndexPath_ object:0];
  }
}

- (void)_loadMoreWithURL:(id)a3
{
  id v6 = objc_alloc_init(MEMORY[0x263F89528]);
  objc_msgSend(v6, "setDataProvider:", +[ISDataProvider provider](SUStorePageDataProvider, "provider"));
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:a3];
  [v6 setRequestProperties:v5];

  [(SUViewController *)self enqueueOperation:v6 cancelOnDealloc:1];
}

- (void)_reloadLoadMoreCellAtIndexPath:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:a3];
  BOOL v5 = [(SUTableViewController *)self tableView];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);

  [(UITableView *)v5 reloadRowsAtIndexPaths:v6 withRowAnimation:5];
}

- (void)_reloadNoItemsLabel
{
  BOOL v3 = (void *)[(SUStructuredPageViewController *)self view];
  if ([(UIViewController *)self isSkLoaded]
    || objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "numberOfItems") >= 1)
  {
    [(UILabel *)self->_noItemsLabel removeFromSuperview];

    self->_noItemsLabel = 0;
  }
  else if (!self->_noItemsLabel)
  {
    id v11 = [(SUStructuredPageViewController *)self newNoItemsOverlayLabel];
    if (objc_msgSend((id)objc_msgSend(v11, "text"), "length"))
    {
      uint64_t v4 = (UILabel *)v11;
      self->_noItemsLabel = v4;
      [(UILabel *)v4 setAutoresizingMask:43];
      [(UILabel *)self->_noItemsLabel sizeToFit];
      [v3 addSubview:self->_noItemsLabel];
      [v3 bounds];
      double v6 = v5;
      double v8 = v7;
      [(UILabel *)self->_noItemsLabel frame];
      -[UILabel setFrame:](self->_noItemsLabel, "setFrame:", floor((v6 - v9) * 0.5), floor((v8 - v10) * 0.5));
    }
  }
}

- (void)_reloadTermsAndConditions
{
  BOOL v3 = [(SUTableViewController *)self tableView];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([(UIViewController *)self isSkLoaded])
    {
      [(UITableView *)v4 setTableFooterView:0];
    }
    else
    {
      id v5 = [(SUStructuredPageViewController *)self newTermsAndConditionsFooter];
      [(UITableView *)v4 setTableFooterView:v5];
    }
  }
}

- (Class)dataSourceClass
{
  return self->_dataSourceClass;
}

- (SUStructuredPage)structuredPage
{
  return self->_structuredPage;
}

@end