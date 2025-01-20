@interface MTATableViewController
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4;
- (MTATableViewController)initWithTableViewStyle:(int64_t)a3;
- (UIBarButtonItem)addButton;
- (float)itemsTableRowHeight;
- (id)addViewController;
- (id)noItemsText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfItems;
- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3;
- (void)_reloadData:(id)a3;
- (void)_reloadUI:(id)a3;
- (void)dealloc;
- (void)dismissAddViewController:(id)a3;
- (void)finishAddViewControllerDismissal:(BOOL)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)reloadState;
- (void)reloadState:(id)a3;
- (void)scrollToTop;
- (void)showAddView;
- (void)showAddViewWithCompletion:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTATableViewController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MTATableViewController *)self navigationController];
  [v5 setEditing:0 animated:0];

  v6.receiver = self;
  v6.super_class = (Class)MTATableViewController;
  [(MTATableViewController *)&v6 viewDidDisappear:v3];
}

- (void)_reloadData:(id)a3
{
  id v6 = a3;
  v4 = [(MTATableViewController *)self tableView];
  [v4 reloadData];

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

- (void)reloadState:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading table view state", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C734;
  v7[3] = &unk_1000A1BD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MTATableViewController *)self _reloadData:v7];
}

- (MTATableViewController)initWithTableViewStyle:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MTATableViewController;
  BOOL v3 = [(MTATableViewController *)&v14 initWithStyle:a3];
  if (v3)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:v3 action:"showAddView"];
    addButton = v3->_addButton;
    v3->_addButton = v4;

    id v6 = [(MTATableViewController *)v3 tableView];
    [v6 _marginWidth];
    double v8 = v7;
    v9 = [(MTATableViewController *)v3 tableView];
    [v9 setSeparatorInset:0.0, v8, 0.0, 0.0];

    v10 = v3->_addButton;
    v11 = [(MTATableViewController *)v3 navigationItem];
    [v11 setRightBarButtonItem:v10];

    v12 = v3;
  }

  return v3;
}

- (void)_reloadUI:(id)a3
{
  id v5 = a3;
  [(MTATableViewController *)self _numberOfItemsDidChangeAnimated:0];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTATableViewController *)self numberOfItemsIncludingSleep];
  BOOL v6 = v5 < 1 && v3;
  double v7 = 0.0;
  if (v5 > 0) {
    goto LABEL_11;
  }
  if (!self->_noItemsView
    && [(MTATableViewController *)self isViewLoaded]
    && (+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    double v8 = [(MTATableViewController *)self noItemsText];
    v9 = [_UIContentUnavailableView initWithFrame:v8 title:1 style:0 includeBackdrop:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    noItemsView = self->_noItemsView;
    self->_noItemsView = v9;

    [(_UIContentUnavailableView *)self->_noItemsView setVibrantOptions:0];
    v11 = self->_noItemsView;
    v12 = [(MTATableViewController *)self tableView];
    [v12 setBackgroundView:v11];
  }
  double v7 = 1.0;
  if (v6)
  {
    +[UIView beginAnimations:@"ShowHideNoItemsLabel", 1.0];
    [(_UIContentUnavailableView *)self->_noItemsView setAlpha:1.0];
    +[UIView endAnimations];
  }
  else
  {
LABEL_11:
    [(_UIContentUnavailableView *)self->_noItemsView setAlpha:v7];
  }
  uint64_t v13 = [(MTATableViewController *)self numberOfItemsIncludingSleep];
  if (v13 < 1)
  {
    id v15 = 0;
  }
  else
  {
    id v15 = [(MTATableViewController *)self editButtonItem];
  }
  objc_super v14 = [(MTATableViewController *)self navigationItem];
  [v14 setLeftBarButtonItem:v15];

  if (v13 >= 1)
  {
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)MTATableViewController;
  [(MTATableViewController *)&v9 viewDidLoad];
  BOOL v3 = [(MTATableViewController *)self tableView];
  [(MTATableViewController *)self itemsTableRowHeight];
  [v3 setRowHeight:v4];

  uint64_t v5 = [(MTATableViewController *)self tableView];
  [v5 setSeparatorStyle:1];

  BOOL v6 = [(MTATableViewController *)self tableView];
  [v6 _setTopPadding:0.0];

  double v7 = [(MTATableViewController *)self tableView];
  [v7 _setBottomPadding:0.0];

  double v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"reloadState" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (float)itemsTableRowHeight
{
  return 0.0;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)reloadState
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C820;
  v3[3] = &unk_1000A1428;
  v3[4] = self;
  [(MTATableViewController *)self _reloadData:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = [(MTATableViewController *)self tableView];
  [v3 flashScrollIndicators];
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)showAddView
{
}

- (void)showAddViewWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTATableViewController *)self addViewController];
  BOOL v6 = [v5 presentationController];
  [v6 setDelegate:self];
  if (MTUIIsVeryWidePhoneSize() && MTUIIsPhoneIdiom()) {
    [v5 setModalPresentationStyle:2];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E82C;
  v8[3] = &unk_1000A1BD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(MTATableViewController *)self presentViewController:v5 animated:1 completion:v8];
}

- (void)dismissAddViewController:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  uint64_t v5 = [v4 isSuspended] ^ 1;

  [(MTATableViewController *)self finishAddViewControllerDismissal:v5];
  id v6 = [(MTATableViewController *)self navigationController];
  [v6 dismissViewControllerAnimated:v5 completion:0];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  uint64_t v5 = [v4 isSuspended] ^ 1;

  [(MTATableViewController *)self finishAddViewControllerDismissal:v5];
}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTATableViewController *)self tableView];
  id v6 = [(MTATableViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:0];

  [(MTATableViewController *)self _numberOfItemsDidChangeAnimated:v3];
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)MTATableViewController;
  [(MTATableViewController *)&v4 dealloc];
}

- (void)viewDidUnload
{
  noItemsView = self->_noItemsView;
  self->_noItemsView = 0;

  v4.receiver = self;
  v4.super_class = (Class)MTATableViewController;
  [(MTATableViewController *)&v4 viewDidUnload];
}

- (void)scrollToTop
{
  double y = CGPointZero.y;
  objc_super v4 = [(MTATableViewController *)self tableView];
  [v4 adjustedContentInset];
  double v6 = y - v5;

  id v7 = [(MTATableViewController *)self tableView];
  [v7 setContentOffset:CGPointZero.x animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    if (a5) {
      [(MTATableViewController *)self _numberOfItemsDidChangeAnimated:1];
    }
  }
}

- (id)noItemsText
{
  return &stru_1000A2560;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (id)addViewController
{
  return 0;
}

- (UIBarButtonItem)addButton
{
  return self->_addButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addButton, 0);

  objc_storeStrong((id *)&self->_noItemsView, 0);
}

@end