@interface SettingsTableViewController
- (BOOL)_usesCompactMetrics;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)useCompactVerticalLayout;
- (SettingsController)settingsController;
- (SettingsTableViewController)init;
- (double)desiredHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_attributionCell;
- (id)_cellForMapModeSelector;
- (id)_cellForMenuItem:(int64_t)a3;
- (id)_cellWithIdentifier:(id)a3 setupBlock:(id)a4;
- (id)_displayableSectionsInTableView;
- (id)_environmentInfoCell;
- (id)_mapModeSelector;
- (id)_menuCellWithText:(id)a3;
- (id)_menuCellWithText:(id)a3 identifier:(id)a4;
- (id)_menuItemsInSection:(int64_t)a3;
- (id)_menuItemsPerSections:(id)a3;
- (id)_viewModeSelectionCellWithText:(id)a3;
- (id)indexPathForMenuItem:(int64_t)a3;
- (id)mapAttributionButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_sectionAtIndex:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_consumeUpdatedUnpairedVehicles:(id)a3;
- (void)_consumeUpdatedVirtualGarage:(id)a3;
- (void)_environmnentNotification;
- (void)_handleSelectedMenuItem:(int64_t)a3;
- (void)_reloadMyVehiclesVisibility;
- (void)_updateTableViewCells;
- (void)dealloc;
- (void)mapViewModeGridSelector:(id)a3 selectedMapMode:(int64_t)a4;
- (void)reloadData;
- (void)setSettingsController:(id)a3;
- (void)setUseCompactVerticalLayout:(BOOL)a3;
- (void)setupConstraints;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateTheme;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SettingsTableViewController

- (SettingsTableViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)SettingsTableViewController;
  v2 = [(SettingsTableViewController *)&v14 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"reloadData" name:@"SettingsControllerDidChange" object:0];

    if (MapsFeature_IsEnabled_Alberta())
    {
      v2->_shouldShowMyVehicles = 1;
    }
    else if (MapsFeature_IsEnabled_EVRouting())
    {
      objc_initWeak(&location, v2);
      v5 = +[VGVirtualGarageService sharedService];
      [v5 registerObserver:v2];

      v6 = +[VGVirtualGarageService sharedService];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1008E59CC;
      v11[3] = &unk_1012E65A8;
      objc_copyWeak(&v12, &location);
      [v6 virtualGarageGetGarageWithReply:v11];

      v7 = +[VGVirtualGarageService sharedService];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1008E5AC0;
      v9[3] = &unk_1012E6E78;
      objc_copyWeak(&v10, &location);
      [v7 virtualGarageGetListOfUnpairedVehiclesWithReply:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4 = +[VGVirtualGarageService sharedService];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SettingsTableViewController;
  [(SettingsTableViewController *)&v5 dealloc];
}

- (void)setupConstraints
{
  v23 = [(SettingsTableViewController *)self tableView];
  v21 = [v23 leadingAnchor];
  v22 = [(SettingsTableViewController *)self view];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(SettingsTableViewController *)self tableView];
  v16 = [v18 trailingAnchor];
  v17 = [(SettingsTableViewController *)self view];
  v15 = [v17 trailingAnchor];
  objc_super v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  v13 = [(SettingsTableViewController *)self tableView];
  v3 = [v13 bottomAnchor];
  v4 = [(SettingsTableViewController *)self view];
  objc_super v5 = [v4 bottomAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  v7 = [(SettingsTableViewController *)self tableView];
  v8 = [v7 topAnchor];
  v9 = [(SettingsTableViewController *)self view];
  id v10 = [v9 topAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  id v12 = +[NSArray arrayWithObjects:v24 count:4];

  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SettingsTableViewController;
  [(SettingsTableViewController *)&v12 viewDidLoad];
  v3 = [(SettingsTableViewController *)self tableView];
  [v3 setOpaque:0];
  v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:0];

  [v3 _setHeaderAndFooterViewsFloat:0];
  objc_super v5 = objc_opt_new();
  [v3 setTableFooterView:v5];

  [v3 setSeparatorStyle:0];
  [v3 setScrollEnabled:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SettingsTableViewController *)self setupConstraints];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"SettingsTableViewCell_SegementedControl"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"SettingsTableViewCell_ViewModeMenuItem"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"SettingsTableViewCell_MenuItem"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"SettingsTableViewCell_Attribution"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"SettingsTableViewCell_Spacer"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"SettingsTableViewCell_Environment"];
  [(SettingsTableViewController *)self reloadData];
  [(SettingsTableViewController *)self desiredHeight];
  -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v6);
  objc_initWeak(&location, self);
  v7 = (const char *)GEOActiveTileGroupChangedNotification;
  id v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008E6144;
  v9[3] = &unk_1012F6090;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v7, &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SettingsTableViewController;
  [(SettingsTableViewController *)&v6 viewWillAppear:a3];
  v4 = +[UIColor clearColor];
  objc_super v5 = [(SettingsTableViewController *)self tableView];
  [v5 setBackgroundColor:v4];
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController willMoveToParentViewController:](&v6, "willMoveToParentViewController:");
  if (a3)
  {
    [(SettingsTableViewController *)self desiredHeight];
    -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v5);
    [(SettingsTableViewController *)self reloadData];
  }
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SettingsTableViewController;
  [(SettingsTableViewController *)&v14 viewDidLayoutSubviews];
  v3 = [(SettingsTableViewController *)self tableView];
  [v3 frame];
  double v5 = v4;

  if (v5 > 0.0)
  {
    [(SettingsTableViewController *)self desiredHeight];
    -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v6);
  }
  v7 = [(SettingsTableViewController *)self tableView];
  [v7 frame];
  double v9 = v8;

  id v10 = [(SettingsTableViewController *)self tableView];
  [v10 contentSize];
  double v12 = v11;

  v13 = [(SettingsTableViewController *)self tableView];
  [v13 setScrollEnabled:v12 > v9];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(SettingsTableViewController *)self desiredHeight];
  -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v8);
  [(SettingsTableViewController *)self reloadData];
  v9.receiver = self;
  v9.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SettingsTableViewController;
  [(SettingsTableViewController *)&v5 viewDidAppear:a3];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"SettingsTableViewControllerDidAppearNotification" object:self];

  [(SettingsTableViewController *)self _reloadMyVehiclesVisibility];
  [(SettingsTableViewController *)self reloadData];
}

- (void)setUseCompactVerticalLayout:(BOOL)a3
{
  self->_useCompactVerticalLayout = a3;
  -[NSLayoutConstraint setActive:](self->_compactHeightConstraint, "setActive:");
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
}

- (void)_consumeUpdatedVirtualGarage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008E6550;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_consumeUpdatedUnpairedVehicles:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008E6680;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_reloadMyVehiclesVisibility
{
  int shouldShowMyVehicles = self->_shouldShowMyVehicles;
  if (MapsFeature_IsEnabled_Alberta())
  {
    int v4 = 1;
    self->_int shouldShowMyVehicles = 1;
  }
  else
  {
    id v5 = [(VGVirtualGarage *)self->_virtualGarage vehicles];
    if ([v5 count]) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = [(NSArray *)self->_unpairedVehicles count] != 0;
    }
    self->_int shouldShowMyVehicles = v6;

    int v4 = self->_shouldShowMyVehicles;
  }
  if (shouldShowMyVehicles != v4 && [(SettingsTableViewController *)self isViewLoaded])
  {
    id v7 = sub_1000519B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = self->_shouldShowMyVehicles;
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Settings TableVC, shouldShowMyVehicles: %d, will update UI.", (uint8_t *)v9, 8u);
    }

    [(SettingsTableViewController *)self reloadData];
  }
}

- (void)_environmnentNotification
{
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"EnableEnvironmentSelectionInSettings"];

  if (v4)
  {
    id v5 = [(SettingsTableViewController *)self tableView];
    [v5 reloadData];
  }
}

- (void)reloadData
{
  if ([(SettingsTableViewController *)self isViewLoaded])
  {
    if (!self->_isReloadingData)
    {
      self->_isReloadingData = 1;
      v3 = [(SettingsTableViewController *)self _displayableSectionsInTableView];
      displaySections = self->_displaySections;
      self->_displaySections = v3;

      id v5 = [(SettingsTableViewController *)self _menuItemsPerSections:self->_displaySections];
      menuItemsPerSections = self->_menuItemsPerSections;
      self->_menuItemsPerSections = v5;

      [(SettingsTableViewController *)self _updateTableViewCells];
      id v7 = (NSArray *)[(NSArray *)self->_displaySections copy];
      lastDisplaySections = self->_lastDisplaySections;
      self->_lastDisplaySections = v7;

      objc_super v9 = (NSDictionary *)[(NSDictionary *)self->_menuItemsPerSections copy];
      lastMenuItemsPerSections = self->_lastMenuItemsPerSections;
      self->_lastMenuItemsPerSections = v9;

      double v11 = +[NSNotificationCenter defaultCenter];
      [v11 postNotificationName:@"SettingsTableViewControllerDidReloadDataNotification" object:self];

      self->_isReloadingData = 0;
    }
  }
}

- (void)_updateTableViewCells
{
  if (!self->_lastDisplaySections || !self->_lastMenuItemsPerSections) {
    return;
  }
  v39 = +[NSMutableArray array];
  v38 = +[NSMutableArray array];
  v29 = +[NSMutableArray array];
  v32 = +[NSMutableIndexSet indexSet];
  v31 = +[NSMutableIndexSet indexSet];
  v30 = +[NSMutableIndexSet indexSet];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)qword_10160FF08;
  id v35 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v35) {
    goto LABEL_34;
  }
  uint64_t v34 = *(void *)v45;
  do
  {
    for (i = 0; i != v35; i = (char *)i + 1)
    {
      if (*(void *)v45 != v34) {
        objc_enumerationMutation(obj);
      }
      unsigned int v4 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      id v5 = [(id)qword_10160FF10 objectForKeyedSubscript:v4];
      BOOL v6 = [(NSDictionary *)self->_menuItemsPerSections objectForKeyedSubscript:v4];
      id v7 = [(NSDictionary *)self->_lastMenuItemsPerSections objectForKeyedSubscript:v4];
      if (![v6 count] && objc_msgSend(v7, "count"))
      {
        NSUInteger v17 = [(NSArray *)self->_lastDisplaySections indexOfObject:v4];
        v18 = v32;
        goto LABEL_31;
      }
      if ([v6 count] && !objc_msgSend(v7, "count"))
      {
        NSUInteger v17 = [(NSArray *)self->_displaySections indexOfObject:v4];
        v18 = v31;
        goto LABEL_31;
      }
      v36 = v5;
      v37 = i;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v41;
        do
        {
          for (j = 0; j != v10; j = (char *)j + 1)
          {
            if (*(void *)v41 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
            if (([v6 containsObject:v13] & 1) == 0
              && [v7 containsObject:v13])
            {
              objc_super v14 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v7 indexOfObject:v13], -[NSArray indexOfObject:](self->_lastDisplaySections, "indexOfObject:", v4));
              v15 = v39;
LABEL_22:
              [v15 addObject:v14];

              continue;
            }
            if ([v6 containsObject:v13]
              && ([v7 containsObject:v13] & 1) == 0)
            {
              objc_super v14 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v6 indexOfObject:v13], -[NSArray indexOfObject:](self->_displaySections, "indexOfObject:", v4));
              v15 = v38;
              goto LABEL_22;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v10);
      }

      id v5 = v36;
      i = v37;
      if ([v4 isEqual:&off_1013A9280])
      {
        NSUInteger v16 = [(NSArray *)self->_lastDisplaySections indexOfObject:v4];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v17 = v16;
          v18 = v30;
LABEL_31:
          [v18 addIndex:v17];
        }
      }
    }
    id v35 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v35);
LABEL_34:

  if ([v39 count]
    || [v38 count]
    || [v29 count]
    || [v31 count]
    || [v32 count])
  {
    v19 = [(SettingsTableViewController *)self tableView];
    v20 = [v19 superview];

    if (v20)
    {
      v21 = [(SettingsTableViewController *)self tableView];
      [v21 beginUpdates];

      if ([v39 count])
      {
        v22 = [(SettingsTableViewController *)self tableView];
        [v22 deleteRowsAtIndexPaths:v39 withRowAnimation:0];
      }
      if ([v38 count])
      {
        v23 = [(SettingsTableViewController *)self tableView];
        [v23 insertRowsAtIndexPaths:v38 withRowAnimation:0];
      }
      if ([v29 count])
      {
        v24 = [(SettingsTableViewController *)self tableView];
        [v24 reloadRowsAtIndexPaths:v29 withRowAnimation:100];
      }
      if ([v31 count])
      {
        v25 = [(SettingsTableViewController *)self tableView];
        [v25 insertSections:v31 withRowAnimation:0];
      }
      if ([v32 count])
      {
        v26 = [(SettingsTableViewController *)self tableView];
        [v26 deleteSections:v32 withRowAnimation:0];
      }
      if ([v30 count])
      {
        v27 = [(SettingsTableViewController *)self tableView];
        [v27 reloadSections:v30 withRowAnimation:100];
      }
      v28 = [(SettingsTableViewController *)self tableView];
      [v28 endUpdates];
    }
  }
}

- (BOOL)_usesCompactMetrics
{
  v2 = [(SettingsTableViewController *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == (id)1 && [v2 verticalSizeClass] == (id)1;

  return v3;
}

- (double)desiredHeight
{
  v2 = [(SettingsTableViewController *)self tableView];
  [v2 contentSize];
  double v4 = v3;

  return v4;
}

- (id)_displayableSectionsInTableView
{
  id v3 = [(id)qword_10160FF08 mutableCopy];
  double v4 = [(SettingsTableViewController *)self _menuItemsInSection:0];
  id v5 = [v4 count];

  if (!v5) {
    [v3 removeObject:&off_1013A9250];
  }
  BOOL v6 = [(SettingsTableViewController *)self settingsController];
  unsigned __int8 v7 = [v6 showsEnvironments];

  if ((v7 & 1) == 0) {
    [v3 removeObject:&off_1013A9268];
  }
  id v8 = [v3 copy];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_displaySections count];
}

- (int64_t)_sectionAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSArray *)self->_displaySections count] <= a3) {
    return -1;
  }
  id v5 = [(NSArray *)self->_displaySections objectAtIndexedSubscript:a3];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (id)_menuItemsInSection:(int64_t)a3
{
  double v4 = (void *)qword_10160FF10;
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 mutableCopy];

  if ((unint64_t)a3 > 2) {
    id v8 = 0;
  }
  else {
    id v8 = [v7 copy];
  }

  return v8;
}

- (id)_menuItemsPerSections:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v12 = -[self _menuItemsInSection:[v11 integerValue]];
        if ([v12 count]) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];

  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(SettingsTableViewController *)self _sectionAtIndex:a4];
  if (v5 == -1) {
    return 0;
  }
  menuItemsPerSections = self->_menuItemsPerSections;
  id v7 = +[NSNumber numberWithInteger:v5];
  id v8 = [(NSDictionary *)menuItemsPerSections objectForKeyedSubscript:v7];
  id v9 = [v8 count];

  return (int64_t)v9;
}

- (id)_viewModeSelectionCellWithText:(id)a3
{
  return [(SettingsTableViewController *)self _menuCellWithText:a3 identifier:@"SettingsTableViewCell_ViewModeMenuItem"];
}

- (id)_menuCellWithText:(id)a3
{
  return [(SettingsTableViewController *)self _menuCellWithText:a3 identifier:@"SettingsTableViewCell_MenuItem"];
}

- (id)_menuCellWithText:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = [(SettingsTableViewController *)self _cellWithIdentifier:a4 setupBlock:0];
  id v8 = [v7 textLabel];
  [v8 setText:v6];

  id v9 = [v7 textLabel];
  [v9 setNumberOfLines:0];

  [v7 setAccessoryType:0];
  [v7 setUserInteractionEnabled:1];

  return v7;
}

- (id)_attributionCell
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008E7560;
  v4[3] = &unk_1012FFEC0;
  v4[4] = self;
  v2 = [(SettingsTableViewController *)self _cellWithIdentifier:@"SettingsTableViewCell_Attribution" setupBlock:v4];
  [v2 setAccessibilityIdentifier:@"SettingsAttributionCell"];

  return v2;
}

- (id)_cellWithIdentifier:(id)a3 setupBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SettingsTableViewCell *))a4;
  id v8 = [(SettingsTableViewController *)self tableView];
  id v9 = [v8 dequeueReusableCellWithIdentifier:v6];

  if (v9)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = [[SettingsTableViewCell alloc] initWithReuseIdentifier:v6];
  if (v7) {
LABEL_3:
  }
    v7[2](v7, v9);
LABEL_4:

  return v9;
}

- (id)_cellForMapModeSelector
{
  id v3 = [(SettingsTableViewController *)self _mapModeSelector];
  [v3 refresh];
  id v4 = [(SettingsTableViewController *)self _cellWithIdentifier:@"SettingsTableViewCell_SegementedControl" setupBlock:0];
  int64_t v5 = [v3 superview];
  id v6 = [v4 contentView];

  if (v5 != v6)
  {
    [v4 setSelectionStyle:0];
    id v7 = [v4 contentView];
    [v7 addSubview:v3];

    v24 = [v3 topAnchor];
    v25 = [v4 contentView];
    v23 = [v25 topAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v20 = [v3 bottomAnchor];
    v21 = [v4 contentView];
    v19 = [v21 bottomAnchor];
    long long v18 = [v20 constraintEqualToAnchor:v19];
    v26[1] = v18;
    long long v17 = [v3 leadingAnchor];
    id v8 = [v4 contentView];
    id v9 = [v8 leadingAnchor];
    id v10 = [v17 constraintEqualToAnchor:v9];
    v26[2] = v10;
    uint64_t v11 = [v3 trailingAnchor];
    double v12 = [v4 contentView];
    id v13 = [v12 trailingAnchor];
    objc_super v14 = [v11 constraintEqualToAnchor:v13];
    v26[3] = v14;
    long long v15 = +[NSArray arrayWithObjects:v26 count:4];
    +[NSLayoutConstraint activateConstraints:v15];
  }

  return v4;
}

- (id)_environmentInfoCell
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"EnableEnvironmentSelectionInSettings"];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008E7E3C;
  v13[3] = &unk_1012FFEE0;
  unsigned __int8 v14 = v4;
  int64_t v5 = [(SettingsTableViewController *)self _cellWithIdentifier:@"SettingsTableViewCell_Environment" setupBlock:v13];
  id v6 = +[GEOResourceManifestManager modernManager];
  id v7 = [v6 activeTileGroup];
  id v8 = [v7 releaseInfo];

  CFStringRef v9 = @"Unknown";
  if (v8) {
    CFStringRef v9 = v8;
  }
  id v10 = +[NSString stringWithFormat:@"Environment: %@", v9];
  uint64_t v11 = [v5 textLabel];
  [v11 setText:v10];

  return v5;
}

- (id)_cellForMenuItem:(int64_t)a3
{
  if (a3 == 3)
  {
    id v3 = [(SettingsTableViewController *)self _environmentInfoCell];
  }
  else if (a3 == 2)
  {
    id v3 = [(SettingsTableViewController *)self _attributionCell];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(SettingsTableViewController *)self _cellForMapModeSelector];
  }

  return v3;
}

- (id)indexPathForMenuItem:(int64_t)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = [(SettingsTableViewController *)self tableView];
  unsigned __int8 v4 = [v3 visibleCells];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = [v9 textLabel];
        uint64_t v11 = [v10 text];
        double v12 = [(SettingsTableViewController *)self _cellForMenuItem:a3];
        id v13 = [v12 textLabel];
        unsigned __int8 v14 = [v13 text];
        unsigned int v15 = [v11 isEqual:v14];

        if (v15)
        {
          long long v17 = [(SettingsTableViewController *)self tableView];
          long long v16 = [v17 indexPathForCell:v9];

          goto LABEL_11;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v16 = 0;
LABEL_11:

  return v16;
}

- (id)mapAttributionButton
{
  id v3 = +[MapsThemeButton buttonWithType:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned __int8 v4 = [v3 titleLabel];
  [v4 setNumberOfLines:0];

  id v5 = [v3 titleLabel];
  [v5 setTextAlignment:4];

  id v6 = [(SettingsTableViewController *)self settingsController];
  [v3 addTarget:v6 action:"presentAttributions" forControlEvents:64];

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 updateBeforeDisplayWithTextAlignment:4];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = -[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", [v5 section]);
  if (v6 == -1)
  {
    id v13 = 0;
  }
  else
  {
    menuItemsPerSections = self->_menuItemsPerSections;
    id v8 = +[NSNumber numberWithInteger:v6];
    CFStringRef v9 = [(NSDictionary *)menuItemsPerSections objectForKeyedSubscript:v8];

    id v10 = [v5 row];
    if (v10 >= [v9 count])
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v11 = [v9 objectAtIndexedSubscript:[v5 row]];
      id v12 = [v11 integerValue];

      id v13 = [(SettingsTableViewController *)self _cellForMenuItem:v12];
    }
  }

  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (void)updateTheme
{
  id v3 = [(SettingsTableViewController *)self tableView];
  unsigned __int8 v4 = [v3 visibleCells];

  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_displaySections;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "unsignedIntegerValue", (void)v13) == (id)2)
          {
            uint64_t v11 = [(SettingsTableViewController *)self tableView];
            id v12 = +[NSIndexSet indexSetWithIndex:(char *)v10 + v8];
            [v11 reloadSections:v12 withRowAnimation:5];
          }
          id v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        v8 += (uint64_t)v10;
      }
      while (v7);
    }
  }
}

- (id)_mapModeSelector
{
  mapModeSelector = self->_mapModeSelector;
  if (!mapModeSelector)
  {
    unsigned __int8 v4 = objc_alloc_init(MapViewModeGridSelector);
    id v5 = self->_mapModeSelector;
    self->_mapModeSelector = v4;

    [(MapViewModeGridSelector *)self->_mapModeSelector setDelegate:self];
    id v6 = [(SettingsTableViewController *)self settingsController];
    [(MapViewModeGridSelector *)self->_mapModeSelector setSettingsController:v6];

    [(MapViewModeGridSelector *)self->_mapModeSelector setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = [(MapViewModeGridSelector *)self->_mapModeSelector heightAnchor];
    uint64_t v8 = [v7 constraintEqualToConstant:260.0];
    compactHeightConstraint = self->_compactHeightConstraint;
    self->_compactHeightConstraint = v8;

    [(NSLayoutConstraint *)self->_compactHeightConstraint setActive:self->_useCompactVerticalLayout];
    mapModeSelector = self->_mapModeSelector;
  }

  return mapModeSelector;
}

- (void)mapViewModeGridSelector:(id)a3 selectedMapMode:(int64_t)a4
{
  id v6 = [(SettingsTableViewController *)self settingsController];
  id v7 = [v6 selectedViewMode];

  if (v7 != (id)a4)
  {
    uint64_t v8 = [(SettingsTableViewController *)self settingsController];
    [v8 setSelectedViewMode:a4 animated:1];

    uint64_t v9 = [(SettingsTableViewController *)self settingsController];
    unint64_t v10 = (unint64_t)[v9 mapViewMode];

    uint64_t v11 = +[MKMapService sharedService];
    id v12 = v11;
    if (v10 > 7) {
      unint64_t v13 = 0;
    }
    else {
      unint64_t v13 = qword_100F728D0[v10];
    }
    if (((v13 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0) {
      unint64_t v13 = 2;
    }
    if (v13 > 7) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = dword_100F72910[v13];
    }
    if (v10 + 1 > 7) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = dword_100F72930[v10 + 1];
    }
    [v11 captureUserAction:v14 onTarget:601 eventValue:0 mapRegion:0 zoomLevel:v15 mapType:0.0];

    [(SettingsTableViewController *)self reloadData];
  }
}

- (void)_handleSelectedMenuItem:(int64_t)a3
{
  if (a3 == 3)
  {
    id v3 = [(SettingsTableViewController *)self settingsController];
    [v3 proceedToEnvironmentsSelector];
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    id v3 = [(SettingsTableViewController *)self settingsController];
    [v3 presentAttributions];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  int64_t v7 = -[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", [v6 section]);
  if (v7 != -1)
  {
    menuItemsPerSections = self->_menuItemsPerSections;
    uint64_t v9 = +[NSNumber numberWithInteger:v7];
    unint64_t v10 = [(NSDictionary *)menuItemsPerSections objectForKeyedSubscript:v9];

    id v11 = [v6 row];
    if (v11 < [v10 count])
    {
      id v12 = [v10 objectAtIndexedSubscript:[v6 row]];
      id v13 = [v12 integerValue];

      [(SettingsTableViewController *)self _handleSelectedMenuItem:v13];
    }
  }
  [v14 deselectRowAtIndexPath:v6 animated:1];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return (id)-[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(a4, "section", a3)) == (id)1;
}

- (BOOL)useCompactVerticalLayout
{
  return self->_useCompactVerticalLayout;
}

- (SettingsController)settingsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);

  return (SettingsController *)WeakRetained;
}

- (void)setSettingsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsController);
  objc_storeStrong((id *)&self->_compactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_mapModeSelector, 0);
  objc_storeStrong((id *)&self->_lastMenuItemsPerSections, 0);
  objc_storeStrong((id *)&self->_lastDisplaySections, 0);
  objc_storeStrong((id *)&self->_menuItemsPerSections, 0);

  objc_storeStrong((id *)&self->_displaySections, 0);
}

@end