@interface SUReviewsListingViewController
- (BOOL)_canWriteReview;
- (id)_accessoryView;
- (id)_headerItem;
- (id)newTermsAndConditionsFooter;
- (void)_reloadHeaderView;
- (void)_writeAReview:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)reloadData;
- (void)reloadForChangedRowCount:(int64_t)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUReviewsListingViewController

- (void)dealloc
{
  [(SUGradientButton *)[(SUButtonAccessoryView *)self->_accessoryView button] removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_accessoryView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUReviewsListingViewController;
  [(SUStructuredPageViewController *)&v3 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SUReviewsListingViewController;
  [(SUTableViewController *)&v4 loadView];
  objc_super v3 = [(SUTableViewController *)self tableView];
  [(UITableView *)v3 setBackgroundColor:SUGetReviewListOddRowColor()];
  [(UITableView *)v3 setTopExtensionViewColor:SUGetReviewListEvenRowColor()];
  [(SUReviewsListingViewController *)self _reloadHeaderView];
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)SUReviewsListingViewController;
  [(SUStructuredPageViewController *)&v3 reloadData];
  [(SUReviewsListingViewController *)self _reloadHeaderView];
}

- (void)reloadForChangedRowCount:(int64_t)a3
{
  if (a3) {
    uint64_t v5 = SUGetReviewListOddRowColor();
  }
  else {
    uint64_t v5 = SUGetReviewListEvenRowColor();
  }
  [(UITableView *)[(SUTableViewController *)self tableView] setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUReviewsListingViewController;
  [(SUTableViewController *)&v6 reloadForChangedRowCount:a3];
}

- (id)newTermsAndConditionsFooter
{
  v4.receiver = self;
  v4.super_class = (Class)SUReviewsListingViewController;
  id v2 = [(SUStructuredPageViewController *)&v4 newTermsAndConditionsFooter];
  [v2 setStyle:2];
  return v2;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SUReviewsListingViewController;
  -[SUTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v8, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3);
  if ([a5 row]) {
    uint64_t v7 = SUGetReviewListOddRowColor();
  }
  else {
    uint64_t v7 = SUGetReviewListEvenRowColor();
  }
  [a4 setBackgroundColor:v7];
  [a4 setBottomBorderColor:SUGetReviewListBorderColor()];
  [a4 setTopBorderColor:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUGradientButton *)[(SUButtonAccessoryView *)self->_accessoryView button] setSelected:0];
  v5.receiver = self;
  v5.super_class = (Class)SUReviewsListingViewController;
  [(SUStructuredPageViewController *)&v5 viewWillAppear:v3];
}

- (void)_writeAReview:(id)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend(-[SUReviewsListingViewController _headerItem](self, "_headerItem", a3), "itemLinksForType:", 3), "objectAtIndex:", 0);
  objc_super v5 = [(SUViewController *)self clientInterface];
  objc_super v6 = -[SUViewControllerFactory newComposeReviewViewControllerWithCompositionURL:](-[SUClientInterface viewControllerFactory](v5, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", [v4 URL]);
  if (!v6) {
    objc_super v6 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", [v4 URL]);
  }
  uint64_t v7 = v6;
  [(SUViewController *)v6 setClientInterface:v5];
  +[SUClientDispatch composeReviewWithViewController:v7 animated:1];
}

- (id)_accessoryView
{
  id result = self->_accessoryView;
  if (!result)
  {
    self->_accessoryView = [[SUButtonAccessoryView alloc] initWithDefaultSize];
    [(SUButtonAccessoryView *)self->_accessoryView setBackgroundColor:SUGetReviewListEvenRowColor()];
    [(SUGradientButton *)[(SUButtonAccessoryView *)self->_accessoryView button] addTarget:self action:sel__writeAReview_ forControlEvents:64];
    return self->_accessoryView;
  }
  return result;
}

- (BOOL)_canWriteReview
{
  return objc_msgSend(-[SUReviewsListingViewController _headerItem](self, "_headerItem"), "itemLinksForType:", 3) != 0;
}

- (id)_headerItem
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](self->super.super.super._dataSource, "structuredPage"), "itemList"), "copyItems");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
      if ([v7 itemType] == 10) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_reloadHeaderView
{
  if ([(SUReviewsListingViewController *)self _canWriteReview])
  {
    id v3 = [(SUReviewsListingViewController *)self _accessoryView];
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[SUReviewsListingViewController _headerItem](self, "_headerItem"), "itemLinksForType:", 3), "objectAtIndex:", 0), "title");
    if (![v4 length]) {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"WRITE_A_REVIEW", &stru_26DB8C5F8, 0);
    }
    objc_msgSend((id)objc_msgSend(v3, "button"), "setTitle:forState:", v4, 0);
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v5 = [(SUTableViewController *)self tableView];

  [(UITableView *)v5 setTableHeaderView:v3];
}

@end