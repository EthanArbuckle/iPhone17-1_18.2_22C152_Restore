@interface SUReportConcernViewController
- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4;
- (SUReportConcernViewController)initWithItemIdentifier:(unint64_t)a3;
- (unint64_t)itemIdentifier;
- (void)_cancel:(id)a3;
- (void)_fetchConcerns;
- (void)_hideKeyboardDidStop:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)_showKeyboardDidStop:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)_submit:(id)a3;
- (void)keyboardWillHideWithInfo:(id)a3;
- (void)keyboardWillShowWithInfo:(id)a3;
- (void)loadView;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SUReportConcernViewController

- (SUReportConcernViewController)initWithItemIdentifier:(unint64_t)a3
{
  v4 = [(SUTableViewController *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_itemIdentifier = a3;
    [(SUTableViewController *)v4 setTableViewStyle:1];
    -[SUViewController setTitle:](v5, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REPORT_A_PROBLEM_PAGE_TITLE", &stru_26DB8C5F8, 0));
    id v6 = objc_alloc(MEMORY[0x263F1C468]);
    v7 = objc_msgSend(v6, "initWithTitle:style:target:action:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26DB8C5F8, 0), 0, v5, sel__cancel_);
    [(SUNavigationItem *)[(SUViewController *)v5 navigationItem] setLeftBarButtonItem:v7];

    id v8 = objc_alloc(MEMORY[0x263F1C468]);
    v9 = objc_msgSend(v8, "initWithTitle:style:target:action:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"REPORT", &stru_26DB8C5F8, 0), 2, v5, sel__submit_);
    [v9 setEnabled:0];
    [(SUNavigationItem *)[(SUViewController *)v5 navigationItem] setRightBarButtonItem:v9];

    v10 = objc_alloc_init(SUConcernListDataSource);
    [(SUTableViewController *)v5 setDataSource:v10];
  }
  return v5;
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  id v6 = [(SUTableViewController *)self tableView];
  uint64_t v7 = [(SUTableDataSource *)self->super._dataSource selectedConcernIndex];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v8 = v7, v7 == [a3 row])) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:0];
  }
  -[SUTableDataSource setSelectedConcernIndex:](self->super._dataSource, "setSelectedConcernIndex:", [a3 row]);
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v6, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, v9, 0), 5);
  [(UITableView *)v6 deselectRowAtIndexPath:a3 animated:1];
  objc_msgSend((id)-[SUTableDataSource textViewCell](self->super._dataSource, "textViewCell"), "resignFirstResponder");
  return 1;
}

- (void)keyboardWillHideWithInfo:(id)a3
{
  if (!self->_animatingKeyboard)
  {
    v5 = (void *)[a3 objectForKey:*MEMORY[0x263F1D3F8]];
    id v6 = (void *)[a3 objectForKey:*MEMORY[0x263F1D3F0]];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
    [(SUTableView *)self->super._tableView setScrollEnabled:0];
    self->_animatingKeyboard = 1;
    [(SUTableView *)self->super._tableView contentOffset];
    double v8 = v7;
    -[SUTableView setContentInset:](self->super._tableView, "setContentInset:", self->_originalTableInsets.top, self->_originalTableInsets.left, self->_originalTableInsets.bottom, self->_originalTableInsets.right);
    objc_msgSend((id)-[SUReportConcernViewController view](self, "view"), "bounds");
    double v10 = v9;
    [(SUTableView *)self->super._tableView frame];
    double v14 = v11;
    double v15 = v12;
    double v17 = v16 - v8;
    if (v10 >= v8 + v13 - self->_originalTableInsets.bottom + 12.0) {
      double v18 = v10;
    }
    else {
      double v18 = v8 + v13 - self->_originalTableInsets.bottom + 12.0;
    }
    -[SUTableView setFrame:](self->super._tableView, "setFrame:", v11, v17, v12, v18);
    -[SUTableView setContentOffset:](self->super._tableView, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    if (v5 && ([v5 doubleValue], double v20 = v19, v19 > 2.22044605e-16))
    {
      [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
      objc_msgSend(MEMORY[0x263F1CB60], "setAnimationCurve:", objc_msgSend(v6, "integerValue"));
      [MEMORY[0x263F1CB60] setAnimationDelegate:self];
      [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__hideKeyboardDidStop_finished_context_];
      [MEMORY[0x263F1CB60] setAnimationDuration:v20];
      -[SUTableView setFrame:](self->super._tableView, "setFrame:", v14, 0.0, v15, v10);
      [MEMORY[0x263F1CB60] commitAnimations];
    }
    else
    {
      -[SUTableView setFrame:](self->super._tableView, "setFrame:", v14, 0.0, v15, v10);
      -[SUReportConcernViewController _hideKeyboardDidStop:finished:context:](self, "_hideKeyboardDidStop:finished:context:", 0, [NSNumber numberWithBool:1], 0);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SUReportConcernViewController;
  [(UIViewController *)&v21 keyboardWillHideWithInfo:a3];
}

- (void)keyboardWillShowWithInfo:(id)a3
{
  uint64_t v5 = [a3 objectForKey:*MEMORY[0x263F1D428]];
  if (!self->_animatingKeyboard && v5 != 0)
  {
    double v7 = (void *)v5;
    [(SUTableView *)self->super._tableView contentOffset];
    double v33 = v8;
    double v10 = v9;
    [(SUTableView *)self->super._tableView frame];
    double v34 = v11;
    double v35 = v12;
    double v14 = v13;
    objc_msgSend((id)-[SUTableDataSource textViewCell](self->super._dataSource, "textViewCell"), "frame");
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v20 = v19;
    double v22 = v21 - v10;
    [v7 CGRectValue];
    objc_msgSend(MEMORY[0x263F1C920], "convertRect:toView:", self->super._tableView);
    double v24 = v23;
    double v26 = v25;
    v37.origin.x = v16;
    v37.origin.y = v22;
    v37.size.width = v18;
    v37.size.height = v20;
    if (v24 < CGRectGetMaxY(v37))
    {
      v27 = (void *)[a3 objectForKey:*MEMORY[0x263F1D3F8]];
      v28 = (void *)[a3 objectForKey:*MEMORY[0x263F1D3F0]];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
      [(SUTableView *)self->super._tableView setScrollEnabled:0];
      self->_animatingKeyboard = 1;
      double v29 = v14 - v26 - (v20 + 12.0);
      v38.origin.x = v16;
      v38.origin.y = v22;
      v38.size.width = v18;
      v38.size.height = v20;
      double v30 = v29 + CGRectGetMaxY(v38);
      if (v14 < v30) {
        double v14 = v30;
      }
      -[SUTableView setFrame:](self->super._tableView, "setFrame:", v34, 0.0, v35, v14);
      -[SUTableView setContentOffset:](self->super._tableView, "setContentOffset:", v33, v10);
      if (v27 && ([v27 doubleValue], double v32 = v31, v31 > 2.22044605e-16))
      {
        [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
        objc_msgSend(MEMORY[0x263F1CB60], "setAnimationCurve:", objc_msgSend(v28, "integerValue"));
        [MEMORY[0x263F1CB60] setAnimationDelegate:self];
        [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__showKeyboardDidStop_finished_context_];
        [MEMORY[0x263F1CB60] setAnimationDuration:v32];
        v39.origin.x = v16;
        v39.origin.y = v22;
        v39.size.width = v18;
        v39.size.height = v20;
        -[SUTableView setFrame:](self->super._tableView, "setFrame:", v34, v29 - CGRectGetMinY(v39) + 0.0, v35, v14);
        [MEMORY[0x263F1CB60] commitAnimations];
      }
      else
      {
        v40.origin.x = v16;
        v40.origin.y = v22;
        v40.size.width = v18;
        v40.size.height = v20;
        -[SUTableView setFrame:](self->super._tableView, "setFrame:", v34, v29 - CGRectGetMinY(v40) + 0.0, v35, v14);
        -[SUReportConcernViewController _showKeyboardDidStop:finished:context:](self, "_showKeyboardDidStop:finished:context:", 0, [NSNumber numberWithBool:1], 0);
      }
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)SUReportConcernViewController;
  [(UIViewController *)&v36 keyboardWillShowWithInfo:a3];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SUReportConcernViewController;
  [(SUTableViewController *)&v7 loadView];
  [(SUTableView *)self->super._tableView contentInset];
  self->_originalTableInsets.top = v3;
  self->_originalTableInsets.left = v4;
  self->_originalTableInsets.bottom = v5;
  self->_originalTableInsets.right = v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUReportConcernViewController *)self _fetchConcerns];
  v5.receiver = self;
  v5.super_class = (Class)SUReportConcernViewController;
  [(SUTableViewController *)&v5 viewDidAppear:v3];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v7 = +[SUDialogManager newDialogWithError:a4];
  [(SUClientInterface *)[(SUViewController *)self clientInterface] _presentDialog:v7];

  v8.receiver = self;
  v8.super_class = (Class)SUReportConcernViewController;
  [(SUViewController *)&v8 operation:a3 failedWithError:a4];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  objc_msgSend((id)-[SUNavigationItem rightBarButtonItem](-[SUViewController navigationItem](self, "navigationItem", a3), "rightBarButtonItem"), "setEnabled:", 1);
  uint64_t v6 = [a4 count];
  uint64_t v7 = v6 - 1;
  if (v6 < 1)
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = v6;
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", i), "isDefaultConcern")) {
        uint64_t v7 = i;
      }
    }
  }
  [(SUTableDataSource *)self->super._dataSource setConcerns:a4];
  [(SUTableDataSource *)self->super._dataSource setSelectedConcernIndex:v7];

  [(SUTableViewController *)self reloadData];
}

- (void)_hideKeyboardDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  self->_animatingKeyboard = 0;
  -[SUTableView setScrollEnabled:](self->super._tableView, "setScrollEnabled:", 1, a4, a5);
  objc_super v5 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  [v5 endIgnoringInteractionEvents];
}

- (void)_showKeyboardDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  [(SUTableView *)self->super._tableView contentOffset];
  double v27 = v7;
  double v28 = v6;
  [(SUTableView *)self->super._tableView frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(SUTableView *)self->super._tableView contentInset];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  objc_msgSend((id)-[SUReportConcernViewController view](self, "view"), "bounds");
  double v23 = v22;
  double v24 = (void *)[MEMORY[0x263F1C710] activeKeyboard];
  if (v24)
  {
    [v24 frame];
    double v19 = v25 + 12.0;
  }
  -[SUTableView setFrame:](self->super._tableView, "setFrame:", v9, 0.0, v13, v23);
  -[SUTableView setContentInset:](self->super._tableView, "setContentInset:", v15, v17, v19, v21);
  -[SUTableView setContentOffset:](self->super._tableView, "setContentOffset:", v28, v27 + fabs(v11));
  self->_animatingKeyboard = 0;
  [(SUTableView *)self->super._tableView setScrollEnabled:1];
  double v26 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  [v26 endIgnoringInteractionEvents];
}

- (void)_cancel:(id)a3
{
}

- (void)_submit:(id)a3
{
  uint64_t v4 = [(SUTableDataSource *)self->super._dataSource selectedConcernIndex];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v5 = -[SUPostConcernOperation initWithConcern:]([SUPostConcernOperation alloc], "initWithConcern:", objc_msgSend((id)-[SUTableDataSource concerns](self->super._dataSource, "concerns"), "objectAtIndex:", v4));
    -[SUPostConcernOperation setCommentText:](v5, "setCommentText:", objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource textViewCell](self->super._dataSource, "textViewCell"), "textContentView"), "text"));
    [(SUPostConcernOperation *)v5 setItemIdentifier:self->_itemIdentifier];
    [(SUViewController *)self enqueueOperation:SUMakeBackgroundTask((uint64_t)v5, @"com.apple.iTunesStoreUI.report-concern") cancelOnDealloc:0];
    [(SUReportConcernViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_fetchConcerns
{
  if (![(SUViewController *)self isSkLoading])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F89528]);
    objc_msgSend(v4, "setDataProvider:", +[ISDataProvider provider](SUConcernListDataProvider, "provider"));
    id v3 = objc_alloc_init(MEMORY[0x263F7B290]);
    [v3 setURLBagKey:@"p2-concern-list"];
    [v4 setRequestProperties:v3];

    [(SUViewController *)self setSkLoading:1];
    [(SUViewController *)self enqueueOperation:v4 cancelOnDealloc:1];
  }
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

@end