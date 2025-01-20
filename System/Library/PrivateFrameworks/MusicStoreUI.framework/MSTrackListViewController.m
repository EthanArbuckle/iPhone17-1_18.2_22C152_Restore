@interface MSTrackListViewController
- (MSTrackListViewController)init;
- (id)_headerArtworkImage;
- (id)_headerArtworkItemImage;
- (id)_newImageDataProvider;
- (id)_newPlaceholderImage;
- (id)newTermsAndConditionsFooter;
- (id)purchasableItemsForHeaderView:(id)a3;
- (void)_delayedReloadForWebViews;
- (void)_reloadFooterView;
- (void)_reloadHeaderView;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_webViewsLoaded:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)reloadData;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MSTrackListViewController

- (MSTrackListViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListViewController;
  v2 = [(MSStructuredPageViewController *)&v5 init];
  if (v2)
  {
    [(SUStructuredPageViewController *)v2 setDataSourceClass:objc_opt_class()];
    [(SUTableViewController *)v2 setTableViewStyle:0];
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x263F536E0] object:0];
    [v3 addObserver:v2 selector:sel__webViewsLoaded_ name:*MEMORY[0x263F89748] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F89748] object:0];
  [(MSTrackListHeaderView *)self->_headerView setDelegate:0];

  self->_headerView = 0;
  v4.receiver = self;
  v4.super_class = (Class)MSTrackListViewController;
  [(MSStructuredPageViewController *)&v4 dealloc];
}

- (id)newTermsAndConditionsFooter
{
  return 0;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)MSTrackListViewController;
  [(SUTableViewController *)&v9 loadView];
  v3 = [(SUTableViewController *)self tableView];
  [(UITableView *)v3 setBackgroundColor:MSGetTrackListOddRowColor()];
  [(UITableView *)v3 setSeparatorColor:MSGetTrackListBorderColor()];
  [(UITableView *)v3 setSeparatorStyle:0];
  headerView = self->_headerView;
  if (headerView)
  {
    [(MSTrackListHeaderView *)headerView frame];
    double v6 = v5;
    double v8 = v7;
    [(UITableView *)v3 frame];
    -[MSTrackListHeaderView setFrame:](self->_headerView, "setFrame:", v6, v8);
    [(UITableView *)v3 setTableHeaderView:self->_headerView];
  }
}

- (void)reloadData
{
  v3 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa+ (int)*MEMORY[0x263F89728]), "structuredPage"), "itemList");
  objc_super v4 = (void *)[[(SUStructuredPageViewController *)self structuredPage] item];
  double v5 = (void *)[v4 firstItemLinkForType:9];
  if ([v5 URL])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F89608]);
    [v6 setItemDisplayType:10000];
    [v6 setItemType:3];
    objc_msgSend(v6, "setReviewStatistics:", objc_msgSend(v4, "reviewStatistics"));
    double v7 = (void *)[v5 copy];
    [v7 setLinkType:0];
    objc_msgSend(v6, "setItemLinks:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v7));

    if ([v3 numberOfItems]
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "itemsForSectionAtIndex:", 0), "objectAtIndex:", 0), "itemDisplayType") == 10000)
    {
      uint64_t v8 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      objc_msgSend(v3, "replaceItemAtIndexPath:withItems:", v8, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v6));
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
      objc_msgSend(v3, "insertItems:atIndexPath:", v9, objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", 0, 0));
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)MSTrackListViewController;
  [(SUStructuredPageViewController *)&v10 reloadData];
  -[UITableView setSeparatorStyle:](-[SUTableViewController tableView](self, "tableView"), "setSeparatorStyle:", [v3 numberOfItems] > 0);
  [(MSTrackListViewController *)self _reloadHeaderView];
  [(MSTrackListViewController *)self _reloadFooterView];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedReloadForWebViews object:0];
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListViewController;
  [(MSStructuredPageViewController *)&v5 viewWillDisappear:v3];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(-[MSTrackListViewController _headerArtworkItemImage](self, "_headerArtworkItemImage"), "URL"), "isEqual:", objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "URL")))
  {
    [(MSTrackListHeaderView *)self->_headerView setArtworkImage:a4];
    headerView = self->_headerView;
    [(MSTrackListHeaderView *)headerView reloadView];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MSTrackListViewController;
    [(SUStructuredPageViewController *)&v8 operation:a3 finishedWithOutput:a4];
  }
}

- (id)purchasableItemsForHeaderView:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa+ (int)*MEMORY[0x263F89728]), "structuredPage"), "itemList"), "copyItems");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isDownloadable]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_delayedReloadForWebViews
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  [(MSTrackListViewController *)self reloadData];
}

- (void)_restrictionsChangedNotification:(id)a3
{
  BOOL v3 = (void *)[(MSTrackListViewController *)self mainThreadProxy];
  [v3 reloadData];
}

- (void)_webViewsLoaded:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedReloadForWebViews object:0];
  [(MSTrackListViewController *)self performSelector:sel__delayedReloadForWebViews withObject:0 afterDelay:0.0];
}

- (id)_headerArtworkImage
{
  BOOL v3 = [(MSTrackListHeaderView *)self->_headerView artworkImage];
  id v4 = [(MSTrackListViewController *)self _headerArtworkItemImage];
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    if (v3) {
      return v3;
    }
  }
  else
  {
    uint64_t v7 = v4;
    id v8 = objc_alloc_init(MEMORY[0x263F89528]);
    id v9 = [(MSTrackListViewController *)self _newImageDataProvider];
    [v7 imageScale];
    objc_msgSend(v9, "setInputImageScale:");
    [v8 setDataProvider:v9];
    objc_super v10 = objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(v7, "URL"));
    [v8 setRequestProperties:v10];

    [(SUViewController *)self trackOperation:v8 cancelOnDealloc:1];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F895D8], "sharedController"), "imageOperationPool"), "addOperation:withFlags:", v8, 1);
  }
  id v11 = [(MSTrackListViewController *)self _newPlaceholderImage];
  return v11;
}

- (id)_headerArtworkItemImage
{
  v2 = objc_msgSend((id)-[SUStructuredPage item](-[SUStructuredPageViewController structuredPage](self, "structuredPage"), "item"), "itemImageCollection");
  return (id)objc_msgSend(v2, "bestImageForSize:", 88.0, 88.0);
}

- (id)_newImageDataProvider
{
  id v2 = objc_alloc_init(MEMORY[0x263F89600]);
  objc_msgSend(v2, "setFillColor:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"));
  objc_msgSend(v2, "setFinalSize:", 88.0, 88.0);
  id v3 = objc_alloc_init(MEMORY[0x263F896B0]);
  objc_msgSend(v3, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.200000003));
  id v4 = objc_alloc_init(MEMORY[0x263F895F0]);
  [v4 setShouldSizeDownToFit:1];
  [v4 setSizingMask:45];
  id v5 = objc_alloc_init(MEMORY[0x263F895B8]);
  objc_msgSend(v5, "setModifiers:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, v3, 0));
  [v2 setModifier:v5];

  return v2;
}

- (id)_newPlaceholderImage
{
  id v2 = [(MSTrackListViewController *)self _newImageDataProvider];
  id v3 = objc_msgSend(v2, "newImageFromImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"PlaceholderBig.png", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class())));

  return v3;
}

- (void)_reloadFooterView
{
  id v3 = [(SUStructuredPageViewController *)self structuredPage];
  uint64_t v4 = objc_msgSend((id)-[SUStructuredPage item](v3, "item"), "copyrightString");
  if (v4 || (uint64_t v4 = objc_msgSend((id)-[SUStructuredPage protocol](v3, "protocol"), "copyright")) != 0)
  {
    id v5 = [MSTrackListCopyrightFooterView alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    uint64_t v7 = -[MSTrackListCopyrightFooterView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);
    [(MSTrackListCopyrightFooterView *)v7 setBackgroundColor:MSGetTrackListOddRowColor()];
    [(MSTrackListCopyrightFooterView *)v7 setText:v4];
    [(MSTrackListCopyrightFooterView *)v7 sizeToFit];
    [(UITableView *)[(SUTableViewController *)self tableView] setTableFooterView:v7];
  }
  else
  {
    uint64_t v6 = [(SUTableViewController *)self tableView];
    [(UITableView *)v6 setTableFooterView:0];
  }
}

- (void)_reloadHeaderView
{
  uint64_t v3 = [[(SUStructuredPageViewController *)self structuredPage] item];
  uint64_t v4 = [(SUTableViewController *)self tableView];
  headerView = self->_headerView;
  if (v3)
  {
    if (headerView) {
      goto LABEL_16;
    }
    uint64_t v6 = [MSTrackListHeaderView alloc];
    if (v4)
    {
      [(UITableView *)v4 bounds];
    }
    else
    {
      double v7 = *MEMORY[0x263F001A8];
      double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    id v11 = -[MSTrackListHeaderView initWithFrame:](v6, "initWithFrame:", v7, v8, v9, v10);
    self->_headerView = v11;
    [(MSTrackListHeaderView *)v11 setAutoresizingMask:2];
    [(MSTrackListHeaderView *)self->_headerView setBackgroundColor:MSGetTrackListOddRowColor()];
    [(MSTrackListHeaderView *)self->_headerView setClipsToBounds:1];
    [(MSTrackListHeaderView *)self->_headerView setDelegate:self];
    if (self->_headerView)
    {
LABEL_16:
      [(MSTrackListHeaderView *)self->_headerView setArtworkImage:[(MSTrackListViewController *)self _headerArtworkImage]];
      [(MSTrackListHeaderView *)self->_headerView setItem:v3];
      [(MSTrackListHeaderView *)self->_headerView reloadView];
      [(MSTrackListHeaderView *)self->_headerView sizeToFit];
      long long v12 = self->_headerView;
      if (v12) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    [(MSTrackListHeaderView *)headerView setDelegate:0];

    self->_headerView = 0;
  }
  [(UITableView *)v4 tableHeaderView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  long long v12 = self->_headerView;
LABEL_11:
  [(UITableView *)v4 setTableHeaderView:v12];
}

@end