@interface HomeNotificationTableViewController
- (HMCameraSnapshot)snapshot;
- (HUItemCollectionViewController)nearbyAccessoriesViewController;
- (HUNCCameraPlayerViewController)playerViewController;
- (HomeNotificationTableViewController)initWithNotification:(id)a3 home:(id)a4 cameraProfile:(id)a5 notificationUUID:(id)a6 clipUUID:(id)a7 snapshot:(id)a8;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createNearbyAccessoryViewControllerWithSourceItem:(id)a3 supportsQuickControls:(BOOL)a4;
- (id)_currentSectionIdentifiers;
- (id)_identifierForSection:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_numberOfSectionsToShow;
- (int64_t)numberOfSectionsDisplayed;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)nearbyAccessoriesViewControllerDidUpdateWithViewController:(id)a3;
- (void)reloadAfterNotificationUpdate;
- (void)setNearbyAccessoriesViewController:(id)a3;
- (void)setNumberOfSectionsDisplayed:(int64_t)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)updateNearbyAccessoriesViewController;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HomeNotificationTableViewController

- (HomeNotificationTableViewController)initWithNotification:(id)a3 home:(id)a4 cameraProfile:(id)a5 notificationUUID:(id)a6 clipUUID:(id)a7 snapshot:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v38.receiver = self;
  v38.super_class = (Class)HomeNotificationTableViewController;
  v20 = [(HomeNotificationTableViewController *)&v38 initWithStyle:0];
  if (v20)
  {
    v21 = HFLogForCategory();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    id obj = a8;
    if (v19)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v17;
        __int16 v41 = 2112;
        id v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NotificationUUID:%@ launched with a snapshot. No player for clipUUID:%@", buf, 0x16u);
      }
    }
    else
    {
      id v36 = v15;
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v17;
        __int16 v41 = 2112;
        id v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NotificationUUID:%@ launched without a snapshot. Load player for clipUUID:%@", buf, 0x16u);
      }

      id v34 = objc_alloc((Class)HUNCCameraPlayerViewController);
      v21 = [v14 request];
      v35 = [v21 content];
      v23 = [v35 attachments];
      v24 = [v23 firstObject];
      [v24 URL];
      v26 = id v25 = v14;
      v27 = (HUNCCameraPlayerViewController *)[v34 initWithCameraProfile:v16 notificationUUID:v17 clipUUID:v18 imageURL:v26];
      playerViewController = v20->_playerViewController;
      v20->_playerViewController = v27;

      id v14 = v25;
      id v15 = v36;
    }

    id v29 = objc_alloc((Class)HFCameraItem);
    v30 = [v15 hf_characteristicValueManager];
    id v31 = [v29 initWithProfile:v16 valueSource:v30];

    v32 = [(HomeNotificationTableViewController *)v20 _createNearbyAccessoryViewControllerWithSourceItem:v31 supportsQuickControls:0];
    [(HomeNotificationTableViewController *)v20 setNearbyAccessoriesViewController:v32];

    objc_storeStrong((id *)&v20->_snapshot, obj);
  }

  return v20;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)HomeNotificationTableViewController;
  [(HomeNotificationTableViewController *)&v23 viewDidLoad];
  [(HomeNotificationTableViewController *)self setSectionContentInsetFollowsLayoutMargins:0];
  v3 = [(HomeNotificationTableViewController *)self tableView];
  [v3 setScrollEnabled:0];

  v4 = [(HomeNotificationTableViewController *)self tableView];
  [v4 setAllowsSelection:0];

  v5 = [(HomeNotificationTableViewController *)self tableView];
  [v5 setShowsHorizontalScrollIndicator:0];

  v6 = +[UIColor clearColor];
  v7 = [(HomeNotificationTableViewController *)self tableView];
  [v7 setBackgroundColor:v6];

  v8 = [(HomeNotificationTableViewController *)self tableView];
  [v8 setSeparatorStyle:0];

  v9 = [(HomeNotificationTableViewController *)self tableView];
  [v9 setContentInsetAdjustmentBehavior:2];

  v10 = [(HomeNotificationTableViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v10 registerClass:v11 forCellReuseIdentifier:v13];

  id v14 = +[UIColor systemBackgroundColor];
  id v15 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
  id v16 = [v15 view];
  [v16 setBackgroundColor:v14];

  objc_initWeak(&location, self);
  id v17 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
  id v18 = [v17 hu_preloadContent];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008CF4;
  v20[3] = &unk_100018900;
  objc_copyWeak(&v21, &location);
  id v19 = [v18 addCompletionBlock:v20];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HomeNotificationTableViewController;
  [(HomeNotificationTableViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(HomeNotificationTableViewController *)self tableView];
  [v3 contentSize];
  -[HomeNotificationTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)updateNearbyAccessoriesViewController
{
  v3 = [(HomeNotificationTableViewController *)self numberOfSectionsDisplayed];
  if (v3 != (void *)[(HomeNotificationTableViewController *)self _numberOfSectionsToShow])
  {
    id v4 = [(HomeNotificationTableViewController *)self tableView];
    [v4 reloadData];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  [(HomeNotificationTableViewController *)self setNumberOfSectionsDisplayed:[(HomeNotificationTableViewController *)self _numberOfSectionsToShow]];

  return [(HomeNotificationTableViewController *)self numberOfSectionsDisplayed];
}

- (void)reloadAfterNotificationUpdate
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notification has been updated. Force reload.", v5, 2u);
  }

  id v4 = [(HomeNotificationTableViewController *)self playerViewController];
  [v4 reloadAfterNotificationUpdate];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[HomeNotificationTableViewController _identifierForSection:](self, "_identifierForSection:", [v7 section]);
  if ([v8 isEqualToString:@"notificationMediaViewerSection"])
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

    v12 = [(HomeNotificationTableViewController *)self snapshot];

    if (v12)
    {
      v13 = +[UIColor blackColor];
      [v11 setBackgroundColor:v13];

      id v14 = [objc_alloc((Class)HUCameraBadgeView) initWithSize:1];
      id v15 = [objc_alloc((Class)HUCameraView) initWithBadgeView:v14];
      [v15 setBadgeHidden:0];
      id v16 = [(HomeNotificationTableViewController *)self snapshot];
      [v15 setCameraSource:v16];

      [v15 setAutoresizingMask:18];
      [v6 bounds];
      double v18 = v17;
      [v6 bounds];
      double v20 = v19;
      id v21 = [v15 cameraSource];
      [v21 aspectRatio];
      [v15 setFrame:0.0, 0.0, v18, v20 / v22];

      objc_super v23 = [v11 contentView];
      [v23 addSubview:v15];
    }
    else
    {
      id v40 = [(HomeNotificationTableViewController *)self playerViewController];

      if (v40)
      {
        __int16 v41 = +[UIColor systemBlackColor];
        [v11 setBackgroundColor:v41];

        id v42 = [(HomeNotificationTableViewController *)self playerViewController];
        [v11 setViewController:v42];

        double left = UIEdgeInsetsZero.left;
        double bottom = UIEdgeInsetsZero.bottom;
        double right = UIEdgeInsetsZero.right;
        [v11 setLayoutMargins:UIEdgeInsetsZero.top, left, bottom, right];
        [v11 setSeparatorInset:UIEdgeInsetsZero.top, left, bottom, right];
      }
    }
  }
  else if ([v8 isEqualToString:@"notificationNearbyAccessorySection"])
  {
    v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    uint64_t v11 = [v6 dequeueReusableCellWithIdentifier:v25 forIndexPath:v7];

    v26 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];

    if (v26)
    {
      v27 = +[UIColor clearColor];
      [v11 setBackgroundColor:v27];

      v28 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
      [v11 setViewController:v28];

      id v29 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
      v30 = [v29 collectionView];
      [v30 setScrollEnabled:0];

      double v31 = UIEdgeInsetsZero.left;
      double v32 = UIEdgeInsetsZero.bottom;
      double v33 = UIEdgeInsetsZero.right;
      id v34 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
      v35 = [v34 collectionView];
      [v35 setContentInset:UIEdgeInsetsZero.top, v31, v32, v33];

      id v36 = +[UIColor clearColor];
      v37 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
      objc_super v38 = [v37 collectionView];
      [v38 setBackgroundColor:v36];

      v39 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
      [v39 setWantsPreferredContentSize:1];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[HomeNotificationTableViewController _identifierForSection:](self, "_identifierForSection:", [v7 section]);
  uint64_t v9 = [(HomeNotificationTableViewController *)self snapshot];
  if (v9
    && (v10 = (void *)v9,
        unsigned int v11 = [v8 isEqualToString:@"notificationMediaViewerSection"],
        v10,
        v11))
  {
    v12 = [(HomeNotificationTableViewController *)self tableView];
    [v12 bounds];
    double v14 = v13;
    id v15 = [(HomeNotificationTableViewController *)self snapshot];
    [v15 aspectRatio];
    double v17 = v14 / v16;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)HomeNotificationTableViewController;
    [(HomeNotificationTableViewController *)&v20 tableView:v6 heightForRowAtIndexPath:v7];
    double v17 = v18;
  }

  return v17;
}

- (int64_t)_numberOfSectionsToShow
{
  v2 = [(HomeNotificationTableViewController *)self nearbyAccessoriesViewController];
  v3 = [v2 itemManager];
  id v4 = [v3 allDisplayedItems];
  if ([v4 count]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (id)_currentSectionIdentifiers
{
  v4[0] = @"notificationMediaViewerSection";
  v4[1] = @"notificationNearbyAccessorySection";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_identifierForSection:(unint64_t)a3
{
  id v4 = [(HomeNotificationTableViewController *)self _currentSectionIdentifiers];
  if ((unint64_t)[v4 count] <= a3) {
    NSLog(@"Received identifier request for section (%lu), but only have (%lu) sections", a3, [v4 count]);
  }
  if ((unint64_t)[v4 count] <= a3)
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (HUNCCameraPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (HUItemCollectionViewController)nearbyAccessoriesViewController
{
  return self->_nearbyAccessoriesViewController;
}

- (void)setNearbyAccessoriesViewController:(id)a3
{
}

- (HMCameraSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (int64_t)numberOfSectionsDisplayed
{
  return self->_numberOfSectionsDisplayed;
}

- (void)setNumberOfSectionsDisplayed:(int64_t)a3
{
  self->_numberOfSectionsDisplayed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesViewController, 0);

  objc_storeStrong((id *)&self->_playerViewController, 0);
}

- (id)_createNearbyAccessoryViewControllerWithSourceItem:(id)a3 supportsQuickControls:(BOOL)a4
{
  id v6 = objc_allocWithZone((Class)sub_10000E9C0());
  id v7 = a3;
  v8 = self;
  uint64_t v9 = (void *)sub_10000E9B0();
  sub_10000E16C();
  swift_unknownObjectRetain();
  sub_10000E9A0();

  return v9;
}

- (void)nearbyAccessoriesViewControllerDidUpdateWithViewController:(id)a3
{
}

@end