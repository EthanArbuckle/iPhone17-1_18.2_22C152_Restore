@interface NavShareETAViewController
- (NavActionCoordination)navActionCoordinator;
- (NavShareETACell)openContactsCell;
- (NavShareETAViewController)init;
- (double)_extraHeight;
- (double)_footerHeight;
- (double)_tableContentWidth;
- (double)heightForLayout:(unint64_t)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)contentView;
- (id)headerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismiss;
- (void)_reloadContactForFirstDisplay;
- (void)_updateSharingFooterWithIdentity:(id)a3;
- (void)_updateWithSharingIdentity:(id)a3;
- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4;
- (void)cellDidFinishRingAnimation:(id)a3;
- (void)dealloc;
- (void)dismissAfterDelay;
- (void)handleDismissAction:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)setNavActionCoordinator:(id)a3;
- (void)setOpenContactsCell:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4;
- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3;
- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NavShareETAViewController

- (NavShareETAViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)NavShareETAViewController;
  v2 = [(NavShareETAViewController *)&v13 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    v4 = [(ContaineeViewController *)v2 cardPresentationController];
    [v4 setBlurInCardView:0];

    v5 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v6 = [(ContaineeViewController *)v3 cardPresentationController];
    [v6 setCardColor:v5];

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellsByContactStringValue = v3->_cellsByContactStringValue;
    v3->_cellsByContactStringValue = v7;

    v9 = [[SharedTripSuggestionsDataSource alloc] initWithSoftCellCap:GEOConfigGetUInteger() includeActiveContacts:1];
    dataSource = v3->_dataSource;
    v3->_dataSource = v9;

    [(SharedTripSuggestionsDataSource *)v3->_dataSource setShowContactSearchItem:1];
    [(SharedTripSuggestionsDataSource *)v3->_dataSource setContactSearchItemPosition:1];
    [(SharedTripSuggestionsDataSource *)v3->_dataSource setDelegate:v3];
    v11 = +[MSPSharedTripService sharedInstance];
    [v11 addSendingObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  if (!self->_userInteracted) {
    [(SharedTripSuggestionsDataSource *)self->_dataSource abandon];
  }
  v3 = +[MSPSharedTripService sharedInstance];
  [v3 removeSendingObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NavShareETAViewController;
  [(NavShareETAViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v59.receiver = self;
  v59.super_class = (Class)NavShareETAViewController;
  [(ContaineeViewController *)&v59 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setEdgeAttachedRegularHeightDimmingBehavior:2];

  objc_super v4 = [(NavShareETAViewController *)self view];
  [v4 setAccessibilityIdentifier:@"NavShareETAView"];

  v5 = (ContainerHeaderView *)objc_opt_new();
  trayHeader = self->_trayHeader;
  self->_trayHeader = v5;

  [(ContainerHeaderView *)self->_trayHeader setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_trayHeader setDelegate:self];
  [(ContainerHeaderView *)self->_trayHeader setHairLineAlpha:0.0];
  [(ContainerHeaderView *)self->_trayHeader setHeaderSize:2];
  v7 = [(NavShareETAViewController *)self view];
  [v7 addSubview:self->_trayHeader];

  v8 = (NavShareETAHeaderView *)objc_opt_new();
  headerView = self->_headerView;
  self->_headerView = v8;

  [(NavShareETAHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_trayHeader setTitleView:self->_headerView];
  v10 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v10;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView setAccessibilityIdentifier:@"NavShareETAContent"];
  v12 = [(NavShareETAViewController *)self view];
  [v12 addSubview:self->_contentView];

  objc_super v13 = (UITableView *)[objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v13;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 16.0);
  [(UITableView *)self->_tableView _setTopPadding:0.0];
  [(UITableView *)self->_tableView _setBottomPadding:0.0];
  [(UITableView *)self->_tableView setSectionHeaderHeight:0.0];
  [(UITableView *)self->_tableView setSectionFooterHeight:16.0];
  [(UITableView *)self->_tableView setAlwaysBounceVertical:0];
  v15 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v15];

  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v16 = +[UIColor colorNamed:@"NavTraySeparatorColor"];
  [(UITableView *)self->_tableView setSeparatorColor:v16];

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"NavShareETATableView"];
  [(UIView *)self->_contentView addSubview:self->_tableView];
  v17 = (NavShareETAFooterView *)objc_opt_new();
  footerView = self->_footerView;
  self->_footerView = v17;

  v57 = [(ContainerHeaderView *)self->_trayHeader topAnchor];
  v58 = [(NavShareETAViewController *)self view];
  v56 = [v58 topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v60[0] = v55;
  v53 = [(ContainerHeaderView *)self->_trayHeader leadingAnchor];
  v54 = [(NavShareETAViewController *)self view];
  v52 = [v54 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v60[1] = v51;
  v49 = [(ContainerHeaderView *)self->_trayHeader trailingAnchor];
  v50 = [(NavShareETAViewController *)self view];
  v48 = [v50 trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v60[2] = v47;
  v46 = [(UIView *)self->_contentView topAnchor];
  v45 = [(ContainerHeaderView *)self->_trayHeader bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v60[3] = v44;
  v42 = [(UIView *)self->_contentView leadingAnchor];
  v43 = [(NavShareETAViewController *)self view];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v60[4] = v40;
  v38 = [(UIView *)self->_contentView trailingAnchor];
  v39 = [(NavShareETAViewController *)self view];
  v37 = [v39 trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v60[5] = v36;
  v34 = [(UIView *)self->_contentView bottomAnchor];
  v35 = [(NavShareETAViewController *)self view];
  v33 = [v35 bottomAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v60[6] = v32;
  v31 = [(UITableView *)self->_tableView topAnchor];
  v30 = [(UIView *)self->_contentView topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v60[7] = v29;
  v28 = [(UITableView *)self->_tableView leadingAnchor];
  v27 = [(UIView *)self->_contentView leadingAnchor];
  v19 = [v28 constraintEqualToAnchor:v27];
  v60[8] = v19;
  v20 = [(UITableView *)self->_tableView trailingAnchor];
  v21 = [(UIView *)self->_contentView trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v60[9] = v22;
  v23 = [(UITableView *)self->_tableView bottomAnchor];
  v24 = [(UIView *)self->_contentView bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v60[10] = v25;
  v26 = +[NSArray arrayWithObjects:v60 count:11];
  +[NSLayoutConstraint activateConstraints:v26];

  [(SharedTripSuggestionsDataSource *)self->_dataSource addTableView:self->_tableView cellProvider:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NavShareETAViewController;
  [(ContaineeViewController *)&v13 viewWillAppear:a3];
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setHideGrabber:1];

  [(SharedTripSuggestionsDataSource *)self->_dataSource addTableView:self->_tableView cellProvider:self];
  [(NavShareETAViewController *)self _reloadContactForFirstDisplay];
  objc_initWeak(&location, self);
  v5 = +[MSPSharedTripService sharedInstance];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1006413CC;
  v10 = &unk_1012EC650;
  objc_copyWeak(&v11, &location);
  [v5 refreshSharingIdentityWithCompletion:&v7];

  v6 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  [v6 registerObserver:self];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NavShareETAViewController;
  [(NavShareETAViewController *)&v4 viewDidAppear:a3];
  self->_visible = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NavShareETAViewController;
  [(NavShareETAViewController *)&v18 viewDidDisappear:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = [(NSMutableDictionary *)self->_cellsByContactStringValue objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 sharingState] == (id)1)
        {
          dataSource = self->_dataSource;
          id v11 = [v9 contact];
          [(SharedTripSuggestionsDataSource *)dataSource toggleContact:v11];

          [v9 setSharingState:3 animated:0];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  v12 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  [v12 unregisterObserver:self];

  [(SharedTripSuggestionsDataSource *)self->_dataSource clearTableView];
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = 0;

  self->_visible = 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NavShareETAViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = [(NavShareETAViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(UITableView *)self->_tableView reloadData];
    uint64_t v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 updateHeightForCurrentLayout];
  }
}

- (NavShareETACell)openContactsCell
{
  openContactsCell = self->_openContactsCell;
  if (!openContactsCell)
  {
    id v4 = [[NavShareETACell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_openContactsCell;
    self->_openContactsCell = v4;

    openContactsCell = self->_openContactsCell;
  }

  return openContactsCell;
}

- (void)_reloadContactForFirstDisplay
{
  v3 = +[MSPSharedTripService sharedInstance];
  id v4 = [v3 receivers];
  [(NavShareETAHeaderView *)self->_headerView setActiveContacts:v4];

  [(SharedTripSuggestionsDataSource *)self->_dataSource resetContactsForDisplayOrdering];
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)_updateSharingFooterWithIdentity:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v10 = [v5 localizedStringForKey:@"[SharedETA] sender info label" value:@"localized string not found" table:0];

  id v6 = [v4 name];
  uint64_t v7 = [v4 handle];

  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v7);
  [(NavShareETAFooterView *)self->_footerView setFooterText:v8];

  [(UITableView *)self->_tableView reloadData];
  objc_super v9 = [(ContaineeViewController *)self cardPresentationController];
  [v9 updateHeightForCurrentLayout];
}

- (void)dismissAfterDelay
{
  objc_initWeak(&location, self);
  GEOConfigGetDouble();
  double v4 = v3;
  id v5 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100641A44;
  v8[3] = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  id v6 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v8 block:v4];
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)cellDidFinishRingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 contact];
    int v10 = 138477827;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Now starting share to %{private}@", (uint8_t *)&v10, 0xCu);
  }
  dataSource = self->_dataSource;
  uint64_t v8 = [v4 contact];
  [(SharedTripSuggestionsDataSource *)dataSource toggleContact:v8];

  [(NavShareETAViewController *)self dismissAfterDelay];
  id v9 = [(ContaineeViewController *)self cardPresentationController];
  [v9 updateHeightForCurrentLayout];
}

- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(SharedTripSuggestionsDataSource *)self->_dataSource changedContacts];
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v8 = [(NSMutableDictionary *)self->_cellsByContactStringValue objectEnumerator];
        id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v20;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_super v13 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) contact];
              unsigned int v14 = [v13 isEqual:v7];

              if (v14)
              {
                [(NavShareETAViewController *)self dismissAfterDelay];
                goto LABEL_16;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100641DFC;
  v18[3] = &unk_1012E5D08;
  v18[4] = self;
  long long v15 = objc_retainBlock(v18);
  if (self->_visible) {
    +[UIView animateWithDuration:v15 animations:0.25];
  }
  else {
    +[UIView performWithoutAnimation:v15];
  }
}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  id v4 = [a3 sharingIdentity];
  [(NavShareETAViewController *)self _updateWithSharingIdentity:v4];
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
}

- (void)_updateWithSharingIdentity:(id)a3
{
  id v4 = a3;
  [(NavShareETAViewController *)self _updateSharingFooterWithIdentity:v4];
  unsigned __int8 v5 = [v4 hasValidAccount];

  if ((v5 & 1) == 0)
  {
    [(NavShareETAViewController *)self _dismiss];
  }
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  headerView = self->_headerView;
  id v6 = a4;
  uint64_t v7 = [(NavShareETAHeaderView *)headerView activeContacts];
  id v8 = [v7 count];
  id v9 = [v6 count];

  [(NavShareETAHeaderView *)self->_headerView setActiveContacts:v6];
  if (v8 != v9)
  {
    id v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 updateHeightForCurrentLayout];
  }
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(NSMutableDictionary *)self->_cellsByContactStringValue objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v8)];
        uint64_t v10 = [v9 contact];
        uint64_t v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          objc_super v13 = +[MSPSharedTripService sharedInstance];
          id v17 = 0;
          id v14 = [v13 capabilityTypeForContact:v11 serviceName:&v17 isActiveReceiver:0];
          id v15 = v17;

          [v9 setCapabilityType:v14 serviceName:v15];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)headerViewTapped:(id)a3
{
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  uint64_t v7 = v6;
  if (v5 == (id)1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v6 wantsLayout:v8];

  +[GEOAPPortal captureUserAction:3 target:649 value:0];
}

- (void)_dismiss
{
  double v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Automatically dismissing ShareETA", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NavShareETAViewController;
  [(ContaineeViewController *)&v4 handleDismissAction:0];
}

- (id)headerView
{
  return self->_trayHeader;
}

- (id)contentView
{
  return self->_contentView;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NavShareETAViewController;
  [(ContaineeViewController *)&v6 handleDismissAction:v4];
  id v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dismissed ShareETA from %@", buf, 0xCu);
  }

  +[GEOAPPortal captureUserAction:4 target:649 value:0];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(ContaineeViewController *)self headerHeight];
    double v12 = v11;
LABEL_13:
    long long v18 = [(ContaineeViewController *)self cardPresentationController];
    [v18 bottomSafeOffset];
    double v4 = v12 + v19;

    return v4;
  }
  double v4 = -1.0;
  if (a3 == 2)
  {
    if ([(UITableView *)self->_tableView numberOfSections] < 1)
    {
      double v6 = 0.0;
    }
    else
    {
      uint64_t v5 = 0;
      double v6 = 0.0;
      do
      {
        if ([(UITableView *)self->_tableView numberOfRowsInSection:v5] >= 1)
        {
          uint64_t v7 = 0;
          do
          {
            tableView = self->_tableView;
            id v9 = +[NSIndexPath indexPathForRow:v7 inSection:v5];
            [(NavShareETAViewController *)self tableView:tableView heightForRowAtIndexPath:v9];
            double v6 = v6 + v10;

            ++v7;
          }
          while (v7 < [(UITableView *)self->_tableView numberOfRowsInSection:v5]);
        }
        ++v5;
      }
      while (v5 < [(UITableView *)self->_tableView numberOfSections]);
    }
    [(ContaineeViewController *)self headerHeight];
    double v14 = v6 + v13;
    [(NavShareETAViewController *)self _footerHeight];
    double v16 = v14 + v15;
    [(NavShareETAViewController *)self _extraHeight];
    double v12 = v16 + v17;
    goto LABEL_13;
  }
  return v4;
}

- (double)_extraHeight
{
  v2 = [(ContaineeViewController *)self cardPresentationController];
  [v2 bottomSafeOffset];
  if (v3 <= 0.0) {
    double v4 = 16.0;
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

- (double)_footerHeight
{
  footerView = self->_footerView;
  [(NavShareETAViewController *)self _tableContentWidth];

  -[NavShareETAFooterView heightForWidth:](footerView, "heightForWidth:");
  return result;
}

- (double)_tableContentWidth
{
  [(UITableView *)self->_tableView frame];
  double Width = CGRectGetWidth(v8);
  [(UITableView *)self->_tableView layoutMargins];
  double v5 = Width - v4;
  [(UITableView *)self->_tableView layoutMargins];
  return v5 - v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactSearchItemIdentifier];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [(NavShareETAViewController *)self openContactsCell];
    goto LABEL_9;
  }
  double v10 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIdentifier:v6];
  cellsByContactStringValue = self->_cellsByContactStringValue;
  double v12 = [v10 stringValue];
  id v9 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v12];

  if (v9)
  {
    unint64_t v13 = [(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v10];
    double v14 = v9;
    uint64_t v15 = 1;
  }
  else
  {
    double v16 = [v10 stringValue];
    id v17 = [v16 length];

    if (!v17)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    id v9 = [[NavShareETACell alloc] initWithStyle:0 reuseIdentifier:0];
    long long v18 = self->_cellsByContactStringValue;
    double v19 = [v10 stringValue];
    [(NSMutableDictionary *)v18 setObject:v9 forKey:v19];

    [(NavShareETACell *)v9 setDelegate:self];
    [(NavShareETACell *)v9 setContact:v10];
    unint64_t v13 = [(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v10];
    double v14 = v9;
    uint64_t v15 = 0;
  }
  [(NavShareETACell *)v14 setSharingState:v13 animated:v15];
LABEL_8:
  long long v20 = +[MSPSharedTripService sharedInstance];
  id v24 = 0;
  id v21 = [v20 capabilityTypeForContact:v10 serviceName:&v24 isActiveReceiver:0];
  id v22 = v24;

  [(NavShareETACell *)v9 setCapabilityType:v21 serviceName:v22];
LABEL_9:

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = [objc_alloc((Class)UITableViewCell) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SharedTripSuggestionsDataSource *)self->_dataSource isContactSearchItemAtIndexPath:v7])
  {
    unsigned int v8 = [(NavShareETAViewController *)self openContactsCell];
    id v9 = v8;
  }
  else
  {
    double v10 = [v6 dataSource];
    if (v10 == self)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIndexPath:v7];
    }

    sizingCell = self->_sizingCell;
    if (!sizingCell)
    {
      double v12 = [[NavShareETACell alloc] initWithStyle:0 reuseIdentifier:0];
      unint64_t v13 = self->_sizingCell;
      self->_sizingCell = v12;

      sizingCell = self->_sizingCell;
    }
    [(NavShareETACell *)sizingCell setContact:v9];
    [(NavShareETACell *)self->_sizingCell setSharingState:3 animated:0];
    unsigned int v8 = self->_sizingCell;
  }
  [(NavShareETAViewController *)self _tableContentWidth];
  [v8 heightForWidth:];
  double v15 = v14;

  return v15;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 contact];
    if (v6)
    {
      id v7 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      id v9 = v6;
      unsigned int v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [v7 requestCapabilityLevelsForContacts:v8];
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v9;
  if (isKindOfClass)
  {
    id v7 = [v9 contact];
    if (v7)
    {
      unsigned int v8 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      [v8 cancelCapabilityLevelRequestForContact:v7];
    }
    id v6 = v9;
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if ((uint64_t)[a3 numberOfSections] - 1 > a4) {
    return 0.0;
  }

  [(NavShareETAViewController *)self _footerHeight];
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ((uint64_t)[a3 numberOfSections] - 1 <= a4) {
    id v5 = self->_footerView;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  self->_userInteracted = 1;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  if ([(SharedTripSuggestionsDataSource *)self->_dataSource isContactSearchItemAtIndexPath:v6])
  {
    id v7 = sub_10000AF10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Tapped ShareETA Open contacts", (uint8_t *)&v22, 2u);
    }

    [(GCDTimer *)self->_dismissTimer invalidate];
    dismissTimer = self->_dismissTimer;
    self->_dismissTimer = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navActionCoordinator);
    [WeakRetained viewControllerOpenContactsSearch:self];

    +[GEOAPPortal captureUserAction:9027 target:649 value:0];
  }
  else
  {
    double v10 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIndexPath:v6];
    double v11 = v10;
    if (v10)
    {
      cellsByContactStringValue = self->_cellsByContactStringValue;
      unint64_t v13 = [v10 stringValue];
      double v14 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v13];

      if ([v14 sharingState])
      {
        id v15 = [v14 sharingState];
        double v16 = sub_10000AF10();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v15 == (id)1)
        {
          if (v17)
          {
            int v22 = 138477827;
            long long v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Tapped to cancel share to %{private}@", (uint8_t *)&v22, 0xCu);
          }

          [(NavShareETAViewController *)self dismissAfterDelay];
          [v14 setSharingState:[self->_dataSource sharingStateForContact:v11] animated:0];
        }
        else
        {
          if (v17)
          {
            int v22 = 138477827;
            long long v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Tapped to stop sharing to %{private}@", (uint8_t *)&v22, 0xCu);
          }

          [(NavShareETAViewController *)self dismissAfterDelay];
          [(SharedTripSuggestionsDataSource *)self->_dataSource toggleContact:v11];
        }
        uint64_t v20 = 9026;
      }
      else
      {
        long long v18 = sub_10000AF10();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v22 = 138477827;
          long long v23 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Tapped to start sharing to %{private}@", (uint8_t *)&v22, 0xCu);
        }

        [(GCDTimer *)self->_dismissTimer invalidate];
        double v19 = self->_dismissTimer;
        self->_dismissTimer = 0;

        [v14 setSharingState:1 animated:1];
        uint64_t v20 = 9025;
      }
      +[GEOAPPortal captureUserAction:v20 target:649 value:0];
      id v21 = [(ContaineeViewController *)self cardPresentationController];
      [v21 updateHeightForCurrentLayout];
    }
  }
}

- (NavActionCoordination)navActionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navActionCoordinator);

  return (NavActionCoordination *)WeakRetained;
}

- (void)setNavActionCoordinator:(id)a3
{
}

- (void)setOpenContactsCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openContactsCell, 0);
  objc_destroyWeak((id *)&self->_navActionCoordinator);
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_cellsByContactStringValue, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_trayHeader, 0);
}

@end