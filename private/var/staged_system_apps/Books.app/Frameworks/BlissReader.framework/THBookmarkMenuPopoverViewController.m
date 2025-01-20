@interface THBookmarkMenuPopoverViewController
- (BEHairlineDividerView)headerDividerView;
- (BOOL)isCurrentPageBookmarked;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tornDown;
- (NSFetchedResultsController)bookmarkFetchedResultsController;
- (THBookmarkMenuPopoverUserModelDelegate)delegate;
- (THBookmarkMenuPopoverViewController)init;
- (THBookmarkMenuPopoverViewDelegate)viewDelegate;
- (THReflowablePaginationController)reflowablePaginationController;
- (UITableView)tableView;
- (id)managedObjectContextDidSaveObserver;
- (id)p_addRemoveBookmarkIndexPath;
- (id)p_bookmarkTitleStringForLocation:(id)a3;
- (id)p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:(id)a3;
- (id)p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)addRemoveBookmark:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)dismissBookmarkMenu:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)p_applicationDidEnterBackground:(id)a3;
- (void)p_applyTheme;
- (void)p_cancelEditingOnAllVisibleCells;
- (void)p_handleNotificationVantageDidChange:(id)a3;
- (void)p_managedObjectContextDidSaveNotification:(id)a3;
- (void)p_navigationHistoryDidChange:(id)a3;
- (void)p_syncWithStatusAnimated:(BOOL)a3;
- (void)p_syncWithStatusForPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4;
- (void)setBookmarkFetchedResultsController:(id)a3;
- (void)setCurrentPageBookmarked:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderDividerView:(id)a3;
- (void)setManagedObjectContextDidSaveObserver:(id)a3;
- (void)setReflowablePaginationController:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTornDown:(BOOL)a3;
- (void)setViewDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)teardown;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation THBookmarkMenuPopoverViewController

- (THBookmarkMenuPopoverViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)THBookmarkMenuPopoverViewController;
  v2 = [(THBookmarkMenuPopoverViewController *)&v7 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    [(THBookmarkMenuPopoverViewController *)v2 setViewDelegate:v2];
    v4 = +[UITraitCollection bc_allAPITraits];
    id v5 = [(THBookmarkMenuPopoverViewController *)v3 registerForTraitChanges:v4 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v4 loadView];
  id v3 = objc_alloc_init((Class)UITableView);
  [v3 setDelegate:self];
  [v3 setDataSource:self];
  [(THBookmarkMenuPopoverViewController *)self setTableView:v3];
  [(THBookmarkMenuPopoverViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v29 viewDidLoad];
  id v3 = [(THBookmarkMenuPopoverViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];

  [v4 setTranslucent:0];
  [v4 _setHidesShadow:1];
  id v5 = [(THBookmarkMenuPopoverViewController *)self tableView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  [v5 setFrame:];
  [v5 setRowHeight:58.0];
  id v10 = objc_alloc_init((Class)UIView);
  [v5 setTableFooterView:v10];

  v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = 1.0 / v12;

  v14 = [objc_alloc((Class)BEHairlineDividerView) initWithFrame:v7, v9, 340.0, v13];
  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = v14;

  [(BEHairlineDividerView *)self->_headerDividerView setAutoresizingMask:2];
  [(BEHairlineDividerView *)self->_headerDividerView setHorizontal:1];
  v16 = [v4 superview];
  [v16 addSubview:self->_headerDividerView];

  v17 = [(THBookmarkMenuPopoverViewController *)self delegate];
  v18 = [v17 bookmarkFetchedResultsController];
  [(THBookmarkMenuPopoverViewController *)self setBookmarkFetchedResultsController:v18];

  v19 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  [v19 setDelegate:self];

  v20 = +[NSNotificationCenter defaultCenter];
  v21 = [v20 addNonBlockingObserver:self selector:"p_managedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:0];
  [(THBookmarkMenuPopoverViewController *)self setManagedObjectContextDidSaveObserver:v21];

  v22 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  id v28 = 0;
  [v22 performFetch:&v28];
  id v23 = v28;

  v24 = [(THBookmarkMenuPopoverViewController *)self view];
  [v24 frame];
  -[THBookmarkMenuPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v25, v26);

  [(THBookmarkMenuPopoverViewController *)self p_applyTheme];
  [(THBookmarkMenuPopoverViewController *)self p_syncWithStatusAnimated:0];
  v27 = +[NSNotificationCenter defaultCenter];
  [v27 addObserver:self selector:"p_handleNotificationVantageDidChange:" name:@"THVantageDidChangeNotification" object:0];
  [v27 addObserver:self selector:"p_navigationHistoryDidChange:" name:THNavigationHistoryDidChangeNotification object:0];
  [v27 addObserver:self selector:"p_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)dealloc
{
  if (![(THBookmarkMenuPopoverViewController *)self tornDown])
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookmarkMenuPopoverViewController dealloc]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookmarkMenuPopoverViewController.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:133 description:@"should have been torn down"];
  }
  [(THBookmarkMenuPopoverViewController *)self teardown];
  [(THBookmarkMenuPopoverViewController *)self setTableView:0];
  [(THBookmarkMenuPopoverViewController *)self setDelegate:0];
  [(THBookmarkMenuPopoverViewController *)self setViewDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v6 dealloc];
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v4 setTheme:a3];
  [(THBookmarkMenuPopoverViewController *)self p_applyTheme];
}

- (void)teardown
{
  id v3 = +[NSNotificationCenter defaultCenter];
  objc_super v4 = [(THBookmarkMenuPopoverViewController *)self managedObjectContextDidSaveObserver];
  [v3 removeObserver:v4];

  [(THBookmarkMenuPopoverViewController *)self setManagedObjectContextDidSaveObserver:0];
  id v5 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  [v5 setDelegate:0];

  [(THBookmarkMenuPopoverViewController *)self setBookmarkFetchedResultsController:0];
  id v7 = [(THBookmarkMenuPopoverViewController *)self tableView];
  [v7 setDelegate:0];
  [v7 setDataSource:0];
  [(THBookmarkMenuPopoverViewController *)self setDelegate:0];
  [(THBookmarkMenuPopoverViewController *)self setViewDelegate:0];
  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  [(THBookmarkMenuPopoverViewController *)self setReflowablePaginationController:0];
  [(THBookmarkMenuPopoverViewController *)self setTornDown:1];
}

- (void)setReflowablePaginationController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reflowablePaginationController);

  if (WeakRetained != obj)
  {
    id v5 = [(THBookmarkMenuPopoverViewController *)self reflowablePaginationController];
    [v5 unregisterObserver:self];

    objc_storeWeak((id *)&self->_reflowablePaginationController, obj);
    objc_super v6 = [(THBookmarkMenuPopoverViewController *)self reflowablePaginationController];
    [v6 registerObserver:self];
  }
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v16 viewWillLayoutSubviews];
  id v3 = [(THBookmarkMenuPopoverViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  id v5 = [v4 superview];

  tableView = self->_tableView;
  [(UITableView *)tableView bounds];
  -[UITableView convertRect:toView:](tableView, "convertRect:toView:", v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = +[UIScreen mainScreen];
  [v13 scale];
  double v15 = 1.0 / v14;

  -[BEHairlineDividerView setFrame:](self->_headerDividerView, "setFrame:", v8, v10, v12, v15);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v4 viewWillAppear:a3];
  [(THBookmarkMenuPopoverViewController *)self p_syncWithStatusAnimated:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  [(THBookmarkMenuPopoverViewController *)&v4 viewWillDisappear:a3];
  [(THBookmarkMenuPopoverViewController *)self teardown];
}

- (void)p_cancelEditingOnAllVisibleCells
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(THBookmarkMenuPopoverViewController *)self tableView];
  objc_super v4 = [v3 visibleCells];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) setEditing:0];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  double v9 = [(THBookmarkMenuPopoverViewController *)self tableView];
  [v9 reloadData];
}

- (void)addRemoveBookmark:(id)a3
{
  [(THBookmarkMenuPopoverViewController *)self p_cancelEditingOnAllVisibleCells];
  uint64_t v4 = [(THBookmarkMenuPopoverViewController *)self isCurrentPageBookmarked] ^ 1;

  [(THBookmarkMenuPopoverViewController *)self setCurrentPageBookmarked:v4];
}

- (BOOL)isCurrentPageBookmarked
{
  v2 = self;
  id v3 = [(THBookmarkMenuPopoverViewController *)self delegate];
  LOBYTE(v2) = [v3 isCurrentPageBookmarkedForBookmarkMenuPopoverViewController:v2];

  return (char)v2;
}

- (void)setCurrentPageBookmarked:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookmarkMenuPopoverViewController *)self delegate];
  [v5 setCurrentPageBookmarked:v3 forBookmarkMenuPopoverViewController:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  id v4 = [(THBookmarkMenuPopoverViewController *)self tableView];
  [v4 reloadData];
}

- (void)dismissBookmarkMenu:(BOOL)a3 completion:(id)a4
{
  id v6 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookmarkMenuPopoverViewController dismissBookmarkMenu:completion:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookmarkMenuPopoverViewController.m"];
  [v6 handleFailureInFunction:v4, v5, 250, @"Warning, dismissBookmarkMenu:completion: requested but not hooked up to anything" file lineNumber description];
}

- (void)p_syncWithStatusAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookmarkMenuPopoverViewController *)self delegate];
  -[THBookmarkMenuPopoverViewController p_syncWithStatusForPage:animated:](self, "p_syncWithStatusForPage:animated:", [v5 currentAbsolutePageIndexForBookmarks], v3);
}

- (id)p_addRemoveBookmarkIndexPath
{
  return +[NSIndexPath indexPathForRow:0 inSection:0];
}

- (void)p_syncWithStatusForPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(THBookmarkMenuPopoverViewController *)self tableView];
  uint64_t v7 = [(THBookmarkMenuPopoverViewController *)self p_addRemoveBookmarkIndexPath];
  v20 = v7;
  double v8 = +[NSArray arrayWithObjects:&v20 count:1];
  if (v4) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 5;
  }
  [v6 reloadRowsAtIndexPaths:v8 withRowAnimation:v9];

  long long v10 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  long long v11 = [v10 sections];
  long long v12 = [v11 objectAtIndex:0];

  id v13 = [v12 numberOfObjects];
  [v6 rowHeight];
  double v15 = v14;
  objc_super v16 = +[UIDevice currentDevice];
  BOOL v17 = (char *)[v16 orientation] - 1 < (unsigned char *)&dword_0 + 2;

  double v18 = dbl_344B00[v17];
  if (v15 * (double)((unint64_t)v13 + 1) < v18) {
    double v18 = v15 * (double)((unint64_t)v13 + 1);
  }
  double v19 = v15 * 3.0;
  if (v18 >= v15 * 3.0) {
    double v19 = v18;
  }
  -[THBookmarkMenuPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v19);
}

- (void)p_applyTheme
{
  if ([(THBookmarkMenuPopoverViewController *)self isViewLoaded])
  {
    BOOL v3 = [(THBookmarkMenuPopoverViewController *)self theme];

    if (v3)
    {
      BOOL v4 = [(THBookmarkMenuPopoverViewController *)self themePage];
      id v5 = [(THBookmarkMenuPopoverViewController *)self tableView];
      id v6 = [(THBookmarkMenuPopoverViewController *)self navigationController];
      uint64_t v7 = [v4 searchBackgroundColor];
      if (!v7)
      {
        uint64_t v7 = [v4 backgroundColorForTraitEnvironment:self];
      }
      [v5 setBackgroundColor:v7];
      double v8 = [v4 tableViewSeparatorColor];
      [v5 setSeparatorColor:v8];

      uint64_t v9 = [v6 popoverPresentationController];
      [v9 setBackgroundColor:v7];

      long long v10 = [v6 navigationBar];
      [v10 setBarStyle:[v4 isNight:self]];
      [v10 setBarTintColor:v7];
      NSAttributedStringKey v17 = NSForegroundColorAttributeName;
      long long v11 = [v4 popoverTitleColor];
      double v18 = v11;
      long long v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v10 setTitleTextAttributes:v12];

      id v13 = [v6 viewIfLoaded];
      double v14 = [v4 tintColor];
      [v13 setTintColor:v14];

      [v13 setBackgroundColor:v7];
      double v15 = [v4 separatorColor];
      [(BEHairlineDividerView *)self->_headerDividerView setDividerColor:v15];

      [(THBookmarkMenuPopoverViewController *)self setNeedsStatusBarAppearanceUpdate];
    }
    objc_super v16 = [(THBookmarkMenuPopoverViewController *)self tableView];
    [v16 reloadData];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (char *)[v7 section];
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    id v13 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
    double v15 = [v13 sections];
    double v14 = [v15 objectAtIndex:0];

    if ([v14 numberOfObjects])
    {
      objc_super v16 = [(THBookmarkMenuPopoverViewController *)self p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:v7];
      NSAttributedStringKey v17 = [(THBookmarkMenuPopoverViewController *)self delegate];
      double v18 = [v13 objectAtIndexPath:v16];
      double v19 = [v17 cachedAnnotationForFetchedObject:v18];

      v20 = +[THPageLocation pageLocationWithAnnotation:v19];
      [v6 deselectRowAtIndexPath:v7 animated:1];
      v21 = [(THBookmarkMenuPopoverViewController *)self delegate];
      v22 = [(THBookmarkMenuPopoverViewController *)self viewDelegate];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10C648;
      v25[3] = &unk_456D90;
      id v26 = v21;
      id v27 = v20;
      id v23 = v20;
      id v24 = v21;
      [v22 dismissBookmarkMenu:1 completion:v25];
    }
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v9 = [(THBookmarkMenuPopoverViewController *)self delegate];
    unsigned int v10 = [v9 isBookmarkApplicable];

    if (v10)
    {
      long long v11 = [(THBookmarkMenuPopoverViewController *)self delegate];
      long long v12 = [(THBookmarkMenuPopoverViewController *)self viewDelegate];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10C604;
      v28[3] = &unk_456D90;
      objc_super v29 = v11;
      v30 = self;
      id v13 = v11;
      [v12 dismissBookmarkMenu:1 completion:v28];

      double v14 = v29;
LABEL_7:
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 != 1) {
    return a4 == 0;
  }
  id v5 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  id v6 = [v5 sections];
  id v7 = [v6 objectAtIndex:0];

  id v8 = [v7 numberOfObjects];
  if ((unint64_t)v8 <= 1) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = (int64_t)v8;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  [a3 dequeueReusableCellWithIdentifier:@"BookmarkCell" forIndexPath:a4];
  BOOL v4 = (THBookmarkMenuTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    BOOL v4 = [[THBookmarkMenuTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"BookmarkCell"];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v75 = a4;
  id v7 = a5;
  id v8 = (char *)[v7 section];
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    v20 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
    v21 = [(__CFString *)v20 sections];
    v22 = [v21 objectAtIndex:0];

    v71 = v22;
    if ([v22 numberOfObjects])
    {
      id v73 = v7;
      id v23 = [(THBookmarkMenuPopoverViewController *)self p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:v7];
      id v24 = [(THBookmarkMenuPopoverViewController *)self delegate];
      double v25 = [(__CFString *)v20 objectAtIndexPath:v23];
      id v26 = [v24 cachedAnnotationForFetchedObject:v25];

      id v27 = +[THPageLocation pageLocationWithAnnotation:v26];
      id v28 = [v26 annotationAbsolutePhysicalPageIndex];
      objc_super v29 = [(THBookmarkMenuPopoverViewController *)self delegate];
      unsigned int v30 = [v29 hasThumbnailImageForAbsolutePageIndex:v28];

      if (v30
        && ([(THBookmarkMenuPopoverViewController *)self delegate],
            v31 = objc_claimAutoreleasedReturnValue(),
            id v32 = [v31 thumbnailImageForAbsolutePageIndex:v28],
            v31,
            v32))
      {
        uint64_t v33 = +[UIImage imageWithCGImage:v32];
      }
      else
      {
        uint64_t v33 = 0;
      }
      id v16 = [(THBookmarkMenuPopoverViewController *)self p_bookmarkTitleStringForLocation:v27];
      v37 = [(THBookmarkMenuPopoverViewController *)self theme];
      uint64_t v38 = [v37 bookmarkLabelColor];

      NSAttributedStringKey v17 = (void *)v38;
      v39 = [(THBookmarkMenuPopoverViewController *)self delegate];
      uint64_t v40 = [v39 pageNumberStringForLocation:v27];

      v34 = (void *)v40;
      uint64_t v35 = 3;
      id v7 = v73;
    }
    else
    {
      v41 = THBundle();
      id v16 = [v41 localizedStringForKey:@"No Bookmarks" value:&stru_46D7E8 table:0];

      id v23 = [(THBookmarkMenuPopoverViewController *)self theme];
      NSAttributedStringKey v17 = [v23 buttonTitleColorDisabled];
      v34 = 0;
      uint64_t v33 = 0;
      uint64_t v35 = 0;
    }
  }
  else
  {
    if (v8)
    {
      v34 = 0;
      NSAttributedStringKey v17 = 0;
      id v16 = 0;
      id v23 = 0;
      uint64_t v35 = 3;
      goto LABEL_28;
    }
    unsigned __int8 v9 = [(THBookmarkMenuPopoverViewController *)self isCurrentPageBookmarked];
    unsigned int v10 = [(THBookmarkMenuPopoverViewController *)self delegate];
    unsigned int v11 = [v10 isBookPortraitOnly];

    long long v12 = THBundle();
    v71 = [v12 localizedStringForKey:@"Add Bookmark" value:&stru_46D7E8 table:0];

    id v13 = [(THBookmarkMenuPopoverViewController *)self delegate];
    unsigned __int8 v14 = [v13 isBookmarkApplicable];

    if (v14)
    {
      if (v9)
      {
        double v15 = THBundle();
        id v16 = [v15 localizedStringForKey:@"Remove Bookmark" value:&stru_46D7E8 table:0];

        NSAttributedStringKey v17 = +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
        int v18 = 0;
        double v19 = @"ib_bookmarks_thumb_remove";
        if (v11) {
          double v19 = @"ib_bookmarks_thumb_remove_portrait";
        }
      }
      else
      {
        id v16 = v71;
        v42 = [(THBookmarkMenuPopoverViewController *)self theme];
        NSAttributedStringKey v17 = [v42 keyColor];

        double v19 = @"ib_bookmarks_thumb_add";
        if (v11) {
          double v19 = @"ib_bookmarks_thumb_add_portrait";
        }
        int v18 = 1;
      }
      uint64_t v36 = 3;
    }
    else
    {
      id v16 = v71;
      NSAttributedStringKey v17 = +[UIColor colorWithWhite:0.678431373 alpha:1.0];
      uint64_t v36 = 0;
      double v19 = @"ib_bookmarks_thumb_add-D";
      if (v11) {
        double v19 = @"ib_bookmarks_thumb_add_portrait-D";
      }
      int v18 = 1;
    }
    v20 = v19;
    v43 = +[UIImage th_imageNamed:v20];
    id v23 = v43;
    if (!v18)
    {
      v34 = 0;
      uint64_t v35 = v36;
      goto LABEL_27;
    }
    uint64_t v33 = [v43 imageWithRenderingMode:2];
    v34 = 0;
    uint64_t v35 = v36;
  }

  id v23 = (void *)v33;
LABEL_27:

LABEL_28:
  v44 = [(THBookmarkMenuPopoverViewController *)self themePage];
  objc_opt_class();
  v45 = TSUDynamicCast();
  v46 = v45;
  if (v45)
  {
    v47 = [v45 thumbnail];
    [v47 setImage:v23];

    id v48 = [v44 tableViewSeparatorColor];
    v70 = v34;
    id v74 = v7;
    id v49 = [v48 CGColor];
    [v46 thumbnail];
    v50 = uint64_t v72 = v35;
    [v50 layer];
    v51 = v46;
    v52 = v44;
    v53 = v23;
    v54 = self;
    v55 = v17;
    v57 = id v56 = v16;
    id v58 = v49;
    id v7 = v74;
    [v57 setBorderColor:v58];

    id v16 = v56;
    NSAttributedStringKey v17 = v55;
    self = v54;
    id v23 = v53;
    v44 = v52;
    v46 = v51;

    v59 = [v51 bookmarkTitleLabel];
    [v59 setText:v16];

    v60 = [v51 bookmarkTitleLabel];
    [v60 setTextColor:v17];

    v61 = [v51 pageNumberLabel];
    v34 = v70;
    [v61 setText:];

    v62 = [v44 bookmarkPageNumberColor];
    v63 = [v46 pageNumberLabel];
    [v63 setTextColor:v62];

    uint64_t v35 = v72;
  }
  [v75 setSelectionStyle:v35];
  id v64 = objc_alloc((Class)UIView);
  [v75 bounds];
  id v65 = [v64 initWithFrame:];
  [v75 setSelectedBackgroundView:v65];

  v66 = [v44 tableViewCellSelectedColor];
  v67 = [v75 selectedBackgroundView];
  [v67 setBackgroundColor:v66];

  v68 = [(THBookmarkMenuPopoverViewController *)self tableView];
  v69 = [v68 backgroundColor];
  [v75 setBackgroundColor:v69];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3) != (char *)&dword_0 + 1) {
    return 0;
  }
  id v5 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  id v6 = [v5 sections];
  id v7 = [v6 objectAtIndex:0];

  BOOL v8 = [v7 numberOfObjects] != 0;
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v18 = a5;
  BOOL v6 = [v18 section] == (char *)&dword_0 + 1;
  id v7 = v18;
  if (v6)
  {
    BOOL v8 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
    unsigned __int8 v9 = [v8 sections];
    unsigned int v10 = [v9 objectAtIndex:0];

    if ([v10 numberOfObjects])
    {
      unsigned int v11 = [(THBookmarkMenuPopoverViewController *)self delegate];
      unsigned int v12 = [v11 isAnnotationWriteEnabled];

      if (v12)
      {
        id v13 = [(THBookmarkMenuPopoverViewController *)self p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:v18];
        unsigned __int8 v14 = [(THBookmarkMenuPopoverViewController *)self delegate];
        double v15 = [v8 objectAtIndexPath:v13];
        id v16 = [v14 cachedAnnotationForFetchedObject:v15];

        NSAttributedStringKey v17 = [(THBookmarkMenuPopoverViewController *)self delegate];
        [v17 removeBookmark:v16];
      }
      else
      {
        id v13 = [(THBookmarkMenuPopoverViewController *)self delegate];
        [v13 denyBookmarkEdit];
      }
    }
    id v7 = v18;
  }
}

- (id)p_bookmarkTitleStringForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(THBookmarkMenuPopoverViewController *)self delegate];
  BOOL v6 = [v5 sectionTitleStringForLocation:v4];

  id v7 = [(THBookmarkMenuPopoverViewController *)self delegate];
  BOOL v8 = [v7 sectionNumberStringForLocation:v4];

  if (v8)
  {
    id v9 = +[NSString stringWithFormat:@"%@: %@", v8, v6];
  }
  else
  {
    id v9 = v6;
  }
  unsigned int v10 = v9;

  return v10;
}

- (void)p_managedObjectContextDidSaveNotification:(id)a3
{
  id v12 = a3;
  if (!+[NSThread isMainThread])
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookmarkMenuPopoverViewController p_managedObjectContextDidSaveNotification:]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookmarkMenuPopoverViewController.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:579 description:@"This operation must only be performed on the main thread."];
  }
  id v7 = [(THBookmarkMenuPopoverViewController *)self bookmarkFetchedResultsController];
  BOOL v8 = [v7 managedObjectContext];

  if (v8)
  {
    id v9 = [v12 object];
    unsigned int v10 = [v9 persistentStoreCoordinator];
    unsigned int v11 = [v8 persistentStoreCoordinator];

    if (v10 == v11) {
      [v8 mergeChangesFromContextDidSaveNotification:v12];
    }
  }
}

- (void)controllerWillChangeContent:(id)a3
{
  id v3 = [(THBookmarkMenuPopoverViewController *)self tableView];
  [v3 beginUpdates];
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v13 = a3;
  id v10 = a4;
  if (a6 == 2)
  {
    unsigned int v11 = [(THBookmarkMenuPopoverViewController *)self tableView];
    id v12 = +[NSIndexSet indexSetWithIndex:a5 + 1];
    [v11 deleteSections:v12 withRowAnimation:0];
  }
  else
  {
    if (a6 != 1) {
      goto LABEL_6;
    }
    unsigned int v11 = [(THBookmarkMenuPopoverViewController *)self tableView];
    id v12 = +[NSIndexSet indexSetWithIndex:a5 + 1];
    [v11 insertSections:v12 withRowAnimation:0];
  }

LABEL_6:
  [(THBookmarkMenuPopoverViewController *)self p_syncWithStatusAnimated:1];
}

- (id)p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [a3 row], 1);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [a3 row], 0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10 = a7;
  unsigned int v11 = [(THBookmarkMenuPopoverViewController *)self p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:a5];
  id v12 = [(THBookmarkMenuPopoverViewController *)self p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:v10];

  id v13 = [(THBookmarkMenuPopoverViewController *)self tableView];
  switch(a6)
  {
    case 3uLL:
      id v18 = v11;
      double v15 = +[NSArray arrayWithObjects:&v18 count:1];
      [v13 deleteRowsAtIndexPaths:v15 withRowAnimation:0];

      NSAttributedStringKey v17 = v12;
      unsigned __int8 v14 = &v17;
      goto LABEL_6;
    case 2uLL:
      double v19 = v11;
      id v16 = +[NSArray arrayWithObjects:&v19 count:1];
      [v13 deleteRowsAtIndexPaths:v16 withRowAnimation:0];
      goto LABEL_8;
    case 1uLL:
      v20 = v12;
      unsigned __int8 v14 = &v20;
LABEL_6:
      id v16 = +[NSArray arrayWithObjects:v14 count:1];
      [v13 insertRowsAtIndexPaths:v16 withRowAnimation:0];
LABEL_8:

      break;
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [a3 sections];
  id v5 = [v4 objectAtIndex:0];

  if (![v5 numberOfObjects])
  {
    BOOL v6 = [(THBookmarkMenuPopoverViewController *)self tableView];
    id v7 = +[NSIndexPath indexPathForRow:0 inSection:1];
    id v10 = v7;
    BOOL v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v6 insertRowsAtIndexPaths:v8 withRowAnimation:0];
  }
  id v9 = [(THBookmarkMenuPopoverViewController *)self tableView];
  [v9 endUpdates];

  [(THBookmarkMenuPopoverViewController *)self p_syncWithStatusAnimated:1];
}

- (void)p_handleNotificationVantageDidChange:(id)a3
{
}

- (void)p_navigationHistoryDidChange:(id)a3
{
  id v3 = [(THBookmarkMenuPopoverViewController *)self viewDelegate];
  [v3 dismissBookmarkMenu:1 completion:0];
}

- (void)p_applicationDidEnterBackground:(id)a3
{
  id v3 = [(THBookmarkMenuPopoverViewController *)self viewDelegate];
  [v3 dismissBookmarkMenu:0 completion:0];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSFetchedResultsController)bookmarkFetchedResultsController
{
  return self->_bookmarkFetchedResultsController;
}

- (void)setBookmarkFetchedResultsController:(id)a3
{
}

- (THBookmarkMenuPopoverUserModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (THBookmarkMenuPopoverUserModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (THBookmarkMenuPopoverViewDelegate)viewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);

  return (THBookmarkMenuPopoverViewDelegate *)WeakRetained;
}

- (void)setViewDelegate:(id)a3
{
}

- (THReflowablePaginationController)reflowablePaginationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reflowablePaginationController);

  return (THReflowablePaginationController *)WeakRetained;
}

- (BEHairlineDividerView)headerDividerView
{
  return self->_headerDividerView;
}

- (void)setHeaderDividerView:(id)a3
{
}

- (BOOL)tornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

- (id)managedObjectContextDidSaveObserver
{
  return self->_managedObjectContextDidSaveObserver;
}

- (void)setManagedObjectContextDidSaveObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_managedObjectContextDidSaveObserver, 0);
  objc_storeStrong((id *)&self->_headerDividerView, 0);
  objc_destroyWeak((id *)&self->_reflowablePaginationController);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmarkFetchedResultsController, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end