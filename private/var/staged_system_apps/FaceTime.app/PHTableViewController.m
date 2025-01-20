@interface PHTableViewController
- (BOOL)contentUnavailable;
- (BOOL)isEditingRow;
- (BOOL)isReloadingData;
- (BOOL)needsReloadData;
- (BOOL)shouldNavigationControllerPresentLargeTitles;
- (BOOL)tableViewCanPerformReloadData:(id)a3;
- (NSCache)rowHeightCache;
- (NSOperationQueue)dataSourcePrefetchingOperationQueue;
- (NSString)contentUnavailableViewTitle;
- (PHContentUnavailable)contentUnavailableView;
- (PHTableViewController)initWithCoder:(id)a3;
- (PHTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHTableViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (int64_t)whitePointAdaptivityStyle;
- (void)commonInit;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3;
- (void)makeUIForDefaultPNG;
- (void)reloadDataIfNeeded;
- (void)setContentUnavailable:(BOOL)a3;
- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentUnavailableView:(id)a3;
- (void)setContentUnavailableViewTitle:(id)a3;
- (void)setEditingRow:(BOOL)a3;
- (void)setNeedsReloadData:(BOOL)a3;
- (void)setReloadingData:(BOOL)a3;
- (void)setRowHeightCache:(id)a3;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performReloadRowsAtIndexPaths:(id)a4 withRowAnimation:(int64_t)a5 completion:(id)a6;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitleDisplayModeIfNeeded;
- (void)updateTitleDisplayModeIfNeeded:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHTableViewController

- (PHTableViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHTableViewController;
  v3 = [(PHTableViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(PHTableViewController *)v3 commonInit];
  }
  return v4;
}

- (PHTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHTableViewController;
  v4 = [(PHTableViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(PHTableViewController *)v4 commonInit];
  }
  return v5;
}

- (PHTableViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHTableViewController;
  v3 = [(PHTableViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PHTableViewController *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_contentUnavailable = 0;
  self->_needsReloadData = 1;
  v3 = (NSCache *)objc_alloc_init((Class)NSCache);
  rowHeightCache = self->_rowHeightCache;
  self->_rowHeightCache = v3;

  self->_whitePointAdaptivityStyle = 0;
  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"handleUIApplicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  if ([(PHTableViewController *)self conformsToProtocol:&OBJC_PROTOCOL___PHTabBarItemProtocol])
  {
    v5 = self;
    id v6 = objc_alloc((Class)UITabBarItem);
    objc_super v7 = [(PHTableViewController *)v5 tabBarItemTitle];
    v8 = [(PHTableViewController *)v5 tabBarItemImage];
    v9 = [(PHTableViewController *)v5 tabBarItemSelectedImage];

    id v10 = [v6 initWithTitle:v7 image:v8 selectedImage:v9];
    goto LABEL_3;
  }
  if ([(PHTableViewController *)self conformsToProtocol:&OBJC_PROTOCOL___PHTabBarSystemItemProtocol])
  {
    objc_super v7 = self;
    id v10 = [objc_alloc((Class)UITabBarItem) initWithTabBarSystemItem:-[PHTableViewController tabBarSystemItem](v7, "tabBarSystemItem") tag:-[PHTableViewController tabBarSystemItemTag](v7, "tabBarSystemItemTag")];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_4;
    }
    v8 = [(PHTableViewController *)v7 tabBarSystemItemTitle];
    if ([v8 length]) {
      [v10 _setInternalTitle:v8];
    }
LABEL_3:

LABEL_4:
    goto LABEL_10;
  }
  id v10 = 0;
LABEL_10:
  [(PHTableViewController *)self setTabBarItem:v10];
}

- (void)dealloc
{
  v3 = [(PHTableViewController *)self dataSourcePrefetchingOperationQueue];
  [v3 cancelAllOperations];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  [(PHTableViewController *)&v5 dealloc];
}

- (NSOperationQueue)dataSourcePrefetchingOperationQueue
{
  dataSourcePrefetchingOperationQueue = self->_dataSourcePrefetchingOperationQueue;
  if (!dataSourcePrefetchingOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    objc_super v5 = self->_dataSourcePrefetchingOperationQueue;
    self->_dataSourcePrefetchingOperationQueue = v4;

    [(NSOperationQueue *)self->_dataSourcePrefetchingOperationQueue setMaxConcurrentOperationCount:1];
    dataSourcePrefetchingOperationQueue = self->_dataSourcePrefetchingOperationQueue;
  }

  return dataSourcePrefetchingOperationQueue;
}

- (void)didReceiveMemoryWarning
{
  v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ received memory warning, purging variables that can be dynamically restored.", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  [(PHTableViewController *)&v5 didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PHTableViewController;
  [(PHTableViewController *)&v7 viewDidLoad];
  v3 = [(PHTableViewController *)self navigationController];
  id v4 = [v3 navigationBar];
  [v4 setPrefersLargeTitles:1];

  objc_super v5 = [(PHTableViewController *)self tableView];
  [v5 setPrefetchDataSource:self];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleUIContentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  [(PHTableViewController *)&v5 viewWillAppear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleUIApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  [(PHTableViewController *)self updateTitleDisplayModeIfNeeded:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  [(PHTableViewController *)&v5 viewWillDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleUIApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  [v4 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)setContentUnavailable:(BOOL)a3
{
}

- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_contentUnavailable != a3)
  {
    BOOL v4 = a4;
    self->_contentUnavailable = a3;
    if (a3
      || ([(PHTableViewController *)self contentUnavailableView],
          objc_super v7 = objc_claimAutoreleasedReturnValue(),
          [v7 superview],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100043658;
      v14[3] = &unk_1000A2738;
      BOOL v15 = a3;
      v14[4] = self;
      v9 = objc_retainBlock(v14);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000436F8;
      v12[3] = &unk_1000A1DA0;
      BOOL v13 = a3;
      v12[4] = self;
      id v10 = objc_retainBlock(v12);
      id v11 = v10;
      if (v4)
      {
        +[UIView animateWithDuration:4 delay:v10 options:v9 animations:0.300000012 completion:0.0];
      }
      else
      {
        ((void (*)(void *))v10[2])(v10);
        ((void (*)(void *, uint64_t))v9[2])(v9, 1);
      }
    }
  }
}

- (void)reloadDataIfNeeded
{
  if ([(PHTableViewController *)self needsReloadData])
  {
    v3 = [(PHTableViewController *)self tableView];
    unsigned int v4 = [(PHTableViewController *)self tableViewCanPerformReloadData:v3];

    if (v4)
    {
      objc_super v5 = [(PHTableViewController *)self tableView];
      [v5 reloadData];

      [(PHTableViewController *)self setNeedsReloadData:0];
    }
  }
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return [(PHTableViewController *)self whitePointAdaptivityStyle];
}

- (PHContentUnavailable)contentUnavailableView
{
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    id v4 = objc_alloc((Class)_UIContentUnavailableView);
    objc_super v5 = [(PHTableViewController *)self view];
    [v5 bounds];
    id v6 = [v4 initWithFrame:self->_contentUnavailableViewTitle];
    objc_super v7 = self->_contentUnavailableView;
    self->_contentUnavailableView = v6;

    [(PHContentUnavailable *)self->_contentUnavailableView setAlpha:0.0];
    [(PHContentUnavailable *)self->_contentUnavailableView setAutoresizingMask:18];
    v8 = [(PHTableViewController *)self view];
    v9 = [v8 backgroundColor];
    [(PHContentUnavailable *)self->_contentUnavailableView setBackgroundColor:v9];

    [(PHContentUnavailable *)self->_contentUnavailableView setHidden:1];
    contentUnavailableView = self->_contentUnavailableView;
  }

  return contentUnavailableView;
}

- (void)setContentUnavailableViewTitle:(id)a3
{
  objc_super v5 = (NSString *)a3;
  if (self->_contentUnavailableViewTitle != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_contentUnavailableViewTitle, a3);
    [(PHContentUnavailable *)self->_contentUnavailableView setTitle:self->_contentUnavailableViewTitle];
    objc_super v5 = v6;
  }
}

- (void)makeUIForDefaultPNG
{
  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    id v4 = [(PHTableViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:0];
    [v4 setRightBarButtonItem:0];
    [v4 setTitleView:0];
    [(PHTableViewController *)self setContentUnavailableViewTitle:0];
    [(PHTableViewController *)self setTabBarItem:0];
    v3 = [(PHTableViewController *)self tableView];
    [v3 setHidden:1];

    [(PHTableViewController *)self setTitle:0];
  }
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  return 0;
}

- (void)updateTitleDisplayModeIfNeeded
{
}

- (void)updateTitleDisplayModeIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHTableViewController *)self isViewLoaded])
  {
    unsigned int v5 = [(PHTableViewController *)self shouldNavigationControllerPresentLargeTitles];
    uint64_t v6 = v5 ? 1 : 2;
    objc_super v7 = [(PHTableViewController *)self navigationItem];
    id v8 = [v7 largeTitleDisplayMode];

    if (v8 != (id)v6)
    {
      v9 = [(PHTableViewController *)self navigationItem];
      [v9 setLargeTitleDisplayMode:v6];

      if ((v3 & v5) == 1)
      {
        id v10 = [(PHTableViewController *)self navigationController];
        id v11 = [v10 visibleViewController];

        if (v11 == self)
        {
          id v13 = [(PHTableViewController *)self navigationController];
          v12 = [v13 navigationBar];
          [v12 sizeToFit];
        }
      }
    }
  }
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  if (self->_whitePointAdaptivityStyle != a3)
  {
    self->_whitePointAdaptivityStyle = a3;
    [(PHTableViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
  }
}

- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a4;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        objc_super v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(*((void *)&v25 + 1) + 8 * i) hash]);
        id v8 = +[NSString stringWithFormat:@"%@", v7];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v9 = [(PHTableViewController *)self dataSourcePrefetchingOperationQueue];
        id v10 = [v9 operations];

        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              BOOL v15 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              v16 = [v15 name];
              unsigned int v17 = [v16 isEqualToString:v8];

              if (v17) {
                [v15 cancel];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
}

- (BOOL)tableViewCanPerformReloadData:(id)a3
{
  id v4 = a3;
  if ([(PHTableViewController *)self isReloadingData]
    || ([v4 _isAnimatingScroll] & 1) != 0
    || ([v4 _isAnimatingZoom] & 1) != 0
    || ([v4 isEditing] & 1) != 0
    || ([v4 isDragging] & 1) != 0
    || ([v4 isDecelerating] & 1) != 0
    || ([v4 isTracking] & 1) != 0
    || ([v4 isZoomBouncing] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned int v5 = [v4 isZooming] ^ 1;
  }

  return v5;
}

- (void)tableView:(id)a3 performReloadRowsAtIndexPaths:(id)a4 withRowAnimation:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(PHTableViewController *)self tableViewCanPerformReloadData:v10])
  {
    [(PHTableViewController *)self setReloadingData:1];
    +[CATransaction begin];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    BOOL v15 = sub_100043FB8;
    v16 = &unk_1000A2760;
    unsigned int v17 = self;
    id v18 = v12;
    +[CATransaction setCompletionBlock:&v13];
    [v10 beginUpdates:v13, v14, v15, v16, v17];
    [v10 reloadRowsAtIndexPaths:v11 withRowAnimation:a5];
    [v10 endUpdates];
    +[CATransaction commit];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = a5;
    id v8 = [(PHTableViewController *)self rowHeightCache];
    [v8 removeObjectForKey:v7];
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v18 = [(PHTableViewController *)self rowHeightCache];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  unsigned int v17 = +[NSNumber numberWithCGFloat:CGRectGetHeight(v20)];
  [v18 setObject:v17 forKey:v7];
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(PHTableViewController *)self rowHeightCache];
  [v7 removeObjectForKey:v6];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PHTableViewController *)self rowHeightCache];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    [v7 CGFloatValue];
    double v9 = v8;
  }
  else
  {
    double v9 = UITableViewAutomaticDimension;
  }

  return v9;
}

- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(PHTableViewController *)self rowHeightCache];
  [v7 removeAllObjects];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHTableViewController;
  id v4 = a3;
  [(PHTableViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [(PHTableViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 && v7 != v6)
  {
    if ([(PHTableViewController *)self contentUnavailable])
    {
      [(PHTableViewController *)self setContentUnavailable:0];
      [(PHTableViewController *)self setContentUnavailableView:0];
      [(PHTableViewController *)self setContentUnavailable:1];
    }
  }
}

- (BOOL)contentUnavailable
{
  return self->_contentUnavailable;
}

- (void)setContentUnavailableView:(id)a3
{
}

- (NSString)contentUnavailableViewTitle
{
  return self->_contentUnavailableViewTitle;
}

- (BOOL)isEditingRow
{
  return self->_editingRow;
}

- (void)setEditingRow:(BOOL)a3
{
  self->_editingRow = a3;
}

- (BOOL)needsReloadData
{
  return self->_needsReloadData;
}

- (void)setNeedsReloadData:(BOOL)a3
{
  self->_needsReloadData = a3;
}

- (BOOL)isReloadingData
{
  return self->_reloadingData;
}

- (void)setReloadingData:(BOOL)a3
{
  self->_reloadingData = a3;
}

- (NSCache)rowHeightCache
{
  return self->_rowHeightCache;
}

- (void)setRowHeightCache:(id)a3
{
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowHeightCache, 0);
  objc_storeStrong((id *)&self->_contentUnavailableViewTitle, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);

  objc_storeStrong((id *)&self->_dataSourcePrefetchingOperationQueue, 0);
}

@end