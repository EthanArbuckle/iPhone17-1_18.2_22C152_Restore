@interface BKLibraryUploadStatusViewController
+ (id)_titleForUploadError:(int64_t)a3 more:(BOOL)a4;
+ (id)_titleForUploading:(BOOL)a3;
+ (id)_titleForUploadingCount:(unint64_t)a3;
+ (id)titleForUploadButton;
+ (int64_t)_uploadErrorType;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BKLibraryUploadStatusViewController)initWithMetrics:(id)a3;
- (BKLibraryUploadStatusViewControllerDelegate)delegate;
- (BKUploadErrorHeaderView)errorHeaderView;
- (BOOL)presentedInPopover;
- (NSMutableDictionary)assetIdToState;
- (UITableView)tableView;
- (id)_uploadAssetAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numAssetsAdded;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustPreferredContentSize;
- (void)_configureThemeForCell:(id)a3;
- (void)_configureThemeForErrorHeaderView;
- (void)_dismiss;
- (void)_dismissWithCompletion:(id)a3;
- (void)_mergeAssets:(id)a3;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_presentUpgradeStorageFlow;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateTitle:(int64_t)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAssetIdToState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorHeaderView:(id)a3;
- (void)setMainHeaderMetrics:(id)a3;
- (void)setNumAssetsAdded:(int64_t)a3;
- (void)setPresentedInPopover:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setThemeForUserInterfaceStyle:(int64_t)a3;
- (void)uploadErrorHeaderViewUpgradeButtonPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKLibraryUploadStatusViewController

- (BKLibraryUploadStatusViewController)initWithMetrics:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryUploadStatusViewController;
  v6 = [(BKLibraryUploadStatusViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainHeaderMetrics, a3);
    v8 = +[UITraitCollection bc_allAPITraits];
    id v9 = [(BKLibraryUploadStatusViewController *)v7 registerForTraitChanges:v8 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100098E50;
  v6[3] = &unk_100A43D60;
  v6[4] = self;
  +[UIView performWithoutAnimation:v6];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)BKLibraryUploadStatusViewController;
  [(BKLibraryUploadStatusViewController *)&v20 viewDidLoad];
  id v3 = objc_alloc((Class)UITableView);
  v4 = [(BKLibraryUploadStatusViewController *)self view];
  [v4 bounds];
  id v5 = [v3 initWithFrame:0 style:];
  [(BKLibraryUploadStatusViewController *)self setTableView:v5];

  v6 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v6 setAutoresizingMask:18];

  v7 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v7 setDelegate:self];

  v8 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v8 setDataSource:self];

  id v9 = [(BKLibraryUploadStatusViewController *)self view];
  v10 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v9 addSubview:v10];

  objc_super v11 = [(BKLibraryUploadStatusViewController *)self tableView];
  v12 = +[UINib nibWithNibName:@"BKUploadStatusCell" bundle:0];
  [v11 registerNib:v12 forCellReuseIdentifier:@"BKUploadStatusCellIdentifier"];

  [(BKLibraryUploadStatusViewController *)self setPresentedInPopover:0];
  -[BKLibraryUploadStatusViewController _updateTitle:](self, "_updateTitle:", [(id)objc_opt_class() _uploadErrorType]);
  v13 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v13 setRowHeight:64.0];

  v14 = +[BKLibraryAssetStatusController sharedController];
  v15 = [v14 uploadAssets];

  [v15 addObserver:self forKeyPath:@"arrangedObjects" options:1 context:off_100B1CBD0];
  v16 = +[BKLibraryAssetStatusController sharedController];
  [v16 addObserver:self forKeyPath:@"uploadStatus" options:1 context:off_100B1CBD8];

  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"_networkReachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:0];

  sub_100098FA0(self);
  v18 = +[NSMutableDictionary dictionary];
  [(BKLibraryUploadStatusViewController *)self setAssetIdToState:v18];

  v19 = [v15 arrangedObjects];
  [(BKLibraryUploadStatusViewController *)self _mergeAssets:v19];
}

- (void)dealloc
{
  id v3 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v3 setDelegate:0];

  v4 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v4 setDataSource:0];

  id v5 = +[BKLibraryAssetStatusController sharedController];
  v6 = [v5 uploadAssets];

  [v6 removeObserver:self forKeyPath:@"arrangedObjects" context:off_100B1CBD0];
  v7 = +[BKLibraryAssetStatusController sharedController];
  [v7 removeObserver:self forKeyPath:@"uploadStatus" context:off_100B1CBD8];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)BKLibraryUploadStatusViewController;
  [(BKLibraryUploadStatusViewController *)&v9 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100B1CBD0 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100099D98;
    block[3] = &unk_100A43DD8;
    block[4] = self;
    id v16 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (off_100B1CBD8 == a6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100099E24;
    v14[3] = &unk_100A43D60;
    v14[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BKLibraryUploadStatusViewController;
    [(BKLibraryUploadStatusViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryUploadStatusViewController;
  [(BKLibraryUploadStatusViewController *)&v5 viewWillAppear:a3];
  sub_100098FA0(self);
  v4 = [(BKLibraryUploadStatusViewController *)self traitCollection];
  -[BKLibraryUploadStatusViewController setThemeForUserInterfaceStyle:](self, "setThemeForUserInterfaceStyle:", [v4 userInterfaceStyle]);
}

- (void)setThemeForUserInterfaceStyle:(int64_t)a3
{
  objc_super v5 = [(BKLibraryUploadStatusViewController *)self navigationController];
  v6 = [v5 navigationBar];
  NSAttributedStringKey v30 = NSForegroundColorAttributeName;
  v7 = +[UIColor bc_booksLabelColor];
  v31 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  [v6 setTitleTextAttributes:v8];

  objc_super v9 = +[UIColor bc_booksKeyColor];
  id v10 = [(BKLibraryUploadStatusViewController *)self navigationController];
  id v11 = [v10 navigationBar];
  [v11 setTintColor:v9];

  id v12 = +[UIColor bc_booksKeyColor];
  objc_super v13 = [(BKLibraryUploadStatusViewController *)self view];
  [v13 setTintColor:v12];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10009A1A8;
  v29[3] = &unk_100A43D60;
  v29[4] = self;
  +[UIView performWithoutAnimation:v29];
  v14 = +[UIColor bc_booksSeparatorColor];
  v15 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v15 setSeparatorColor:v14];

  id v16 = +[UIColor bc_booksBackground];
  v17 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v17 setBackgroundColor:v16];

  v18 = [(BKLibraryUploadStatusViewController *)self navigationController];
  v19 = [v18 navigationBar];
  objc_super v20 = +[UIColor bc_booksSecondaryBackground];
  [v19 setBarTintColor:v20];

  v21 = [(BKLibraryUploadStatusViewController *)self navigationController];
  v22 = [v21 navigationBar];
  BOOL v23 = a3 == 1;
  [v22 setTranslucent:v23];

  v24 = [(BKLibraryUploadStatusViewController *)self navigationController];
  v25 = [v24 toolbar];
  v26 = +[UIColor bc_booksSecondaryBackground];
  [v25 setBarTintColor:v26];

  v27 = [(BKLibraryUploadStatusViewController *)self navigationController];
  v28 = [v27 toolbar];
  [v28 setTranslucent:v23];

  [(BKLibraryUploadStatusViewController *)self _configureThemeForErrorHeaderView];
  [(BKLibraryUploadStatusViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a4 userInterfaceStyle:a3];
  v6 = [(BKLibraryUploadStatusViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = [(BKLibraryUploadStatusViewController *)self traitCollection];
    -[BKLibraryUploadStatusViewController setThemeForUserInterfaceStyle:](self, "setThemeForUserInterfaceStyle:", [v8 userInterfaceStyle]);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryUploadStatusViewController;
  [(BKLibraryUploadStatusViewController *)&v6 viewWillDisappear:a3];
  v4 = +[BKLibraryAssetStatusController sharedController];
  [v4 removeCompletedUploads];

  id v5 = +[BCLightLevelController sharedInstance];
  [v5 removeObserver:self];
}

- (void)setPresentedInPopover:(BOOL)a3
{
  self->_presentedInPopover = a3;
  if (a3)
  {
    id v5 = [(BKLibraryUploadStatusViewController *)self navigationItem];
    [v5 setLeftBarButtonItem:0];
  }
  else
  {
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismiss"];
    v4 = [(BKLibraryUploadStatusViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v5];
  }
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(BKLibraryUploadStatusViewController *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (void)_networkReachabilityChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A570;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_titleForUploading:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Uploading to iCloud…";
  }
  else {
    CFStringRef v6 = @"Uploaded to iCloud";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_100A70340 table:0];

  return v7;
}

+ (id)_titleForUploadingCount:(unint64_t)a3
{
  v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Syncing %lu item(s) to iCloud…" value:&stru_100A70340 table:0];
  CFStringRef v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3);

  return v6;
}

+ (id)_titleForUploadError:(int64_t)a3 more:(BOOL)a4
{
  if (a3 == 2)
  {
    id v7 = +[BCDevice deviceClass];
    if (v7 == (id)4)
    {
      id v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"Your Mac is Offline…";
      }
      else {
        CFStringRef v6 = @"Your Mac is Offline";
      }
    }
    else if (v7 == (id)3)
    {
      id v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"Your iPad is Offline…";
      }
      else {
        CFStringRef v6 = @"Your iPad is Offline";
      }
    }
    else if (v7 == (id)1)
    {
      id v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"Your iPhone is Offline…";
      }
      else {
        CFStringRef v6 = @"Your iPhone is Offline";
      }
    }
    else
    {
      id v5 = +[NSBundle mainBundle];
      if (a4) {
        CFStringRef v6 = @"Your device is Offline…";
      }
      else {
        CFStringRef v6 = @"Your device is Offline";
      }
    }
  }
  else
  {
    if (a3 != 1)
    {
      id v8 = 0;
      goto LABEL_23;
    }
    id v5 = +[NSBundle mainBundle];
    if (a4) {
      CFStringRef v6 = @"iCloud Storage Is Full…";
    }
    else {
      CFStringRef v6 = @"iCloud Storage Is Full";
    }
  }
  id v8 = [v5 localizedStringForKey:v6 value:&stru_100A70340 table:0];

LABEL_23:

  return v8;
}

+ (id)titleForUploadButton
{
  unint64_t v3 = (unint64_t)[(id)objc_opt_class() _uploadErrorType];
  if ((v3 | 2) != 2)
  {
    objc_super v9 = [a1 _titleForUploadError:v3 more:1];
    goto LABEL_16;
  }
  v4 = +[BKLibraryAssetStatusController sharedController];
  id v5 = [v4 uploadAssets];
  CFStringRef v6 = [v5 arrangedObjects];

  if ([v6 count])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    objc_super v13 = sub_10009AA18;
    v14 = &unk_100A44210;
    id v15 = v4;
    id v16 = &v17;
    [v6 enumerateObjectsUsingBlock:&v11];
    uint64_t v7 = v18[3];
    if (v3)
    {
      if (!v7)
      {
        objc_super v9 = 0;
LABEL_14:

        _Block_object_dispose(&v17, 8);
        goto LABEL_15;
      }
      uint64_t v8 = [a1 _titleForUploadError:v3 more:1 v11, v12, v13, v14];
    }
    else
    {
      if (v7) {
        [objc_opt_class() _titleForUploadingCount:v18[3] v11, v12, v13, v14];
      }
      else {
      uint64_t v8 = [objc_opt_class() _titleForUploading:0 v11, v12, v13, v14];
      }
    }
    objc_super v9 = (void *)v8;
    goto LABEL_14;
  }
  objc_super v9 = 0;
LABEL_15:

LABEL_16:

  return v9;
}

- (void)_updateTitle:(int64_t)a3
{
  if (a3)
  {
    v4 = [(id)objc_opt_class() _titleForUploadError:a3 more:0];
  }
  else
  {
    id v5 = [(BKLibraryUploadStatusViewController *)self assetIdToState];
    CFStringRef v6 = [v5 allValues];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue", (void)v12) == (id)9)
          {
            uint64_t v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    v4 = [(id)objc_opt_class() _titleForUploading:v8];
  }
  id v11 = [(BKLibraryUploadStatusViewController *)self navigationItem];
  [v11 setTitle:v4];
}

+ (int64_t)_uploadErrorType
{
  v2 = +[BKReachability sharedReachabilityForInternetConnection];
  unsigned int v3 = [v2 currentReachabilityStatus];

  v4 = +[BKLibraryAssetStatusController sharedController];
  id v5 = [v4 uploadStatus];

  if (v3) {
    return v5 == (id)2;
  }
  else {
    return 2;
  }
}

- (void)_mergeAssets:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  CFStringRef v6 = +[NSMutableArray array];
  +[BKLibraryAssetStatusController sharedController];
  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10009AE40;
  uint64_t v17 = &unk_100A44238;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = self;
  id v7 = v5;
  id v20 = v7;
  id v8 = v6;
  id v21 = v8;
  id v9 = v18;
  [v4 enumerateObjectsUsingBlock:&v14];

  if (objc_msgSend(v7, "count", v14, v15, v16, v17) || objc_msgSend(v8, "count"))
  {
    id v10 = [(BKLibraryUploadStatusViewController *)self tableView];
    [v10 beginUpdates];

    id v11 = [(BKLibraryUploadStatusViewController *)self tableView];
    [v11 insertRowsAtIndexPaths:v7 withRowAnimation:100];

    -[BKLibraryUploadStatusViewController setNumAssetsAdded:](self, "setNumAssetsAdded:", (char *)[v7 count] + -[BKLibraryUploadStatusViewController numAssetsAdded](self, "numAssetsAdded"));
    long long v12 = [(BKLibraryUploadStatusViewController *)self tableView];
    [v12 reloadRowsAtIndexPaths:v8 withRowAnimation:0];

    long long v13 = [(BKLibraryUploadStatusViewController *)self tableView];
    [v13 endUpdates];
  }
}

- (void)_adjustPreferredContentSize
{
  unsigned int v3 = [(BKLibraryUploadStatusViewController *)self tableView];
  [v3 rowHeight];
  double v5 = v4 * 5.0 + 0.0;

  CFStringRef v6 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];
  [v6 bounds];
  double v8 = v5 + v7;

  [(BKLibraryUploadStatusViewController *)self preferredContentSize];
  double v10 = v9;
  [(BKLibraryUploadStatusViewController *)self preferredContentSize];
  if (v12 != v10 || v11 != v8)
  {
    -[BKLibraryUploadStatusViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v8);
  }
}

- (void)_dismiss
{
}

- (void)_dismissWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009B0CC;
  v4[3] = &unk_100A44120;
  double v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKLibraryUploadStatusViewController *)v5 dismissViewControllerAnimated:1 completion:v4];
}

- (id)_uploadAssetAtIndex:(unint64_t)a3
{
  double v4 = +[BKLibraryAssetStatusController sharedController];
  double v5 = [v4 uploadAssets];
  id v6 = [v5 arrangedObjects];

  if ((unint64_t)[v6 count] <= a3)
  {
    double v9 = 0;
  }
  else
  {
    double v7 = +[BKLibraryManager defaultManager];
    double v8 = [v6 objectAtIndexedSubscript:a3];
    double v9 = [v7 libraryAssetOnMainQueueWithAssetID:v8];
  }

  return v9;
}

- (void)_presentUpgradeStorageFlow
{
  id v3 = [(BKLibraryUploadStatusViewController *)self delegate];
  double v4 = [v3 libraryUploadStatusPresentingViewController];
  double v5 = [v4 navigationController];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009B2D4;
  v7[3] = &unk_100A43D60;
  id v8 = v5;
  id v6 = v5;
  [(BKLibraryUploadStatusViewController *)self _dismissWithCompletion:v7];
}

- (void)_configureThemeForCell:(id)a3
{
  id v24 = a3;
  double v4 = +[UIColor bc_booksBackground];
  [v24 setBackgroundColor:v4];

  double v5 = +[UIColor bc_booksBackground];
  id v6 = [v24 textContainerView];
  [v6 setBackgroundColor:v5];

  double v7 = [(BKLibraryUploadStatusViewController *)self mainHeaderMetrics];

  if (v7)
  {
    id v8 = [(BKLibraryUploadStatusViewController *)self mainHeaderMetrics];
    double v9 = [v8 iCloudBookTitleFontAttributes];
    double v10 = [v9 font];
    double v11 = [v24 titleLabel];
    [v11 setFont:v10];

    double v12 = [(BKLibraryUploadStatusViewController *)self mainHeaderMetrics];
    long long v13 = [v12 iCloudBookTitleFontAttributes];
    long long v14 = [v13 foregroundColor];
    uint64_t v15 = [v24 titleLabel];
    [v15 setTextColor:v14];

    id v16 = [(BKLibraryUploadStatusViewController *)self mainHeaderMetrics];
    uint64_t v17 = [v16 iCloudBookStatusFontAttributes];
    id v18 = [v17 font];
    uint64_t v19 = [v24 statusLabel];
    [v19 setFont:v18];

    id v20 = [(BKLibraryUploadStatusViewController *)self mainHeaderMetrics];
    id v21 = [v20 iCloudBookStatusFontAttributes];
    v22 = [v21 foregroundColor];
    BOOL v23 = [v24 statusLabel];
    [v23 setTextColor:v22];
  }
  else
  {
    id v20 = +[UIColor bc_booksLabelColor];
    id v21 = [v24 titleLabel];
    [v21 setTextColor:v20];
  }
}

- (void)_configureThemeForErrorHeaderView
{
  id v3 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];

  if (v3)
  {
    double v4 = [(BKLibraryUploadStatusViewController *)self traitCollection];
    id v5 = [v4 userInterfaceStyle];

    uint64_t v6 = v5 == (id)2 ? 2 : 0;
    double v7 = +[UIBlurEffect effectWithStyle:v6];
    id v8 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];
    double v9 = [v8 visualEffectView];
    [v9 setEffect:v7];

    double v10 = +[UIColor bc_booksSeparatorColor];
    double v11 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];
    double v12 = [v11 underlineView];
    [v12 setBackgroundColor:v10];

    long long v13 = [(BKLibraryUploadStatusViewController *)self mainHeaderMetrics];

    if (!v13)
    {
      long long v14 = +[UIColor bc_booksSecondaryLabelColor];
      uint64_t v15 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];
      id v16 = [v15 errorLabel];
      [v16 setTextColor:v14];

      uint64_t v17 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];
      id v18 = [v17 upgradeButton];

      if (v18)
      {
        id v23 = +[UIColor bc_booksKeyColor];
        id v19 = [v23 CGColor];
        id v20 = [(BKLibraryUploadStatusViewController *)self errorHeaderView];
        id v21 = [v20 upgradeButton];
        v22 = [v21 layer];
        [v22 setBorderColor:v19];
      }
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPhone()) {
    return 26;
  }
  else {
    return 30;
  }
}

- (void)uploadErrorHeaderViewUpgradeButtonPressed:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[BKLibraryUploadStatusViewController _uploadAssetAtIndex:](self, "_uploadAssetAtIndex:", [v7 row]);
  if (!v8)
  {
    id v11 = [v7 row];
    BCReportAssertionFailureWithMessage();
  }
  double v9 = [v6 dequeueReusableCellWithIdentifier:@"BKUploadStatusCellIdentifier" forIndexPath:v7, v11];
  [(BKLibraryUploadStatusViewController *)self _configureThemeForCell:v9];
  [v9 configureForAsset:v8];

  return v9;
}

- (BKLibraryUploadStatusViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryUploadStatusViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)presentedInPopover
{
  return self->_presentedInPopover;
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (int64_t)numAssetsAdded
{
  return self->_numAssetsAdded;
}

- (void)setNumAssetsAdded:(int64_t)a3
{
  self->_numAssetsAdded = a3;
}

- (BKUploadErrorHeaderView)errorHeaderView
{
  return self->_errorHeaderView;
}

- (void)setErrorHeaderView:(id)a3
{
}

- (NSMutableDictionary)assetIdToState
{
  return self->_assetIdToState;
}

- (void)setAssetIdToState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdToState, 0);
  objc_storeStrong((id *)&self->_errorHeaderView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end