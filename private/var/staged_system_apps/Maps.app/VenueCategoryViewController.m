@interface VenueCategoryViewController
- (BOOL)didFinishAutoCompleteSearchRequest;
- (BOOL)isAutoComplete;
- (BOOL)shouldDisplayFilterView;
- (BOOL)showsLoading;
- (FilterCategoriesView)filterView;
- (LoadingModeView)loadingModeView;
- (NSDictionary)searchResultCountInVenue;
- (NSString)headerTitle;
- (NSString)refineSearchText;
- (UIImageView)headerImageView;
- (UILabel)headerLabel;
- (UITableView)tableView;
- (VKVenueFeatureMarker)venueWithFocus;
- (VenueCategoryContentDownloader)contentDownloader;
- (VenueCategoryDataSource)dataSource;
- (VenueCategoryViewController)initWithAutoCompleteCategoryCardItem:(id)a3;
- (VenueCategoryViewController)initWithCategoryCardItem:(id)a3;
- (VenueCategoryViewController)initWithSearchCategory:(id)a3;
- (id)_buildingAtIndex:(unint64_t)a3;
- (id)_headerLabelTextFromMapItem:(id)a3 searchCategory:(id)a4;
- (id)_venueShortNameForMapItem:(id)a3;
- (id)headerLabelFont;
- (id)lastItemTapped;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)refineSearchSessionType;
- (signed)currentSelectedFloorOrdinal;
- (void)applyAlphaToContent:(double)a3;
- (void)configureHeader;
- (void)configureTableView;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dataSource:(id)a3 itemFocused:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)didUpdateResults;
- (void)displayIndexListIfNecessary;
- (void)filterView:(id)a3 didSelectBuildingWithIndex:(unint64_t)a4;
- (void)filterView:(id)a3 didSelectSubcategoryWithIndex:(unint64_t)a4;
- (void)filterView:(id)a3 indexSelected:(unint64_t)a4;
- (void)handleDismissAction:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)notifyVenuesManagerAndSwitchToBestFloor:(BOOL)a3;
- (void)performInitialSearchIfNecessary;
- (void)selectSubcategory:(id)a3;
- (void)setContentDownloader:(id)a3;
- (void)setCurrentSelectedFloorOrdinal:(signed __int16)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidFinishAutoCompleteSearchRequest:(BOOL)a3;
- (void)setFilterView:(id)a3;
- (void)setFilterViewHidden:(BOOL)a3;
- (void)setHeaderImageView:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setIsAutoComplete:(BOOL)a3;
- (void)setLastItemTapped:(id)a3;
- (void)setLoadingModeView:(id)a3;
- (void)setShouldDisplayFilterView:(BOOL)a3;
- (void)setShowsLoading:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setVenueWithFocus:(id)a3;
- (void)updateFilterBar;
- (void)updateFooterVisibility;
- (void)updateHeaderImageView;
- (void)venueCategoryContentDownloader:(id)a3 didChangeMapItem:(id)a4;
- (void)venueCategoryContentDownloader:(id)a3 didFailToFetchMapItemWithError:(id)a4;
- (void)venueCategoryContentDownloader:(id)a3 didReceiveAutoCompleteSubcategories:(id)a4 subcategoriesType:(int)a5;
- (void)venueCategoryContentDownloader:(id)a3 didReceiveEVChargerUpdates:(id)a4;
- (void)venueCategoryContentDownloader:(id)a3 didReceiveSearchResults:(id)a4 shouldSwitchToBestFloor:(BOOL)a5;
- (void)venueCategoryContentDownloaderDidCancel:(id)a3;
- (void)venueCategoryContentDownloaderDidFail:(id)a3;
- (void)venueCategoryContentDownloaderDidStart:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation VenueCategoryViewController

- (VenueCategoryViewController)initWithSearchCategory:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VenueCategoryViewController;
  v5 = [(VenueCategoryViewController *)&v15 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = (UITableView *)objc_alloc_init((Class)UITableView);
    tableView = v5->_tableView;
    v5->_tableView = v6;

    v8 = [[VenueCategoryDataSource alloc] initWithTableView:v5->_tableView searchCategory:v4];
    dataSource = v5->_dataSource;
    v5->_dataSource = v8;

    v10 = [(VenueCategoryViewController *)v5 dataSource];
    v11 = [v10 searchCategory];
    if ([v11 displayMode] == 2) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    v13 = [(ContaineeViewController *)v5 cardPresentationController];
    [v13 setDefaultContaineeLayout:v12];
  }
  return v5;
}

- (VenueCategoryViewController)initWithCategoryCardItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 venueSearchCategory];
  v6 = [(VenueCategoryViewController *)self initWithSearchCategory:v5];
  v7 = v6;
  if (v6)
  {
    v6->_isAutoComplete = 0;
    v8 = [v5 subcategories];
    [(VenueCategoryDataSource *)v7->_dataSource setSubcategories:v8];

    -[VenueCategoryDataSource setSubcategoriesType:](v7->_dataSource, "setSubcategoriesType:", [v5 subCategoryType]);
    v9 = [[VenueCategoryContentDownloader alloc] initWithDelegate:v7 venueCategoryCardItem:v4];
    contentDownloader = v7->_contentDownloader;
    v7->_contentDownloader = v9;
  }
  return v7;
}

- (VenueCategoryViewController)initWithAutoCompleteCategoryCardItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 venueSearchCategory];
  v6 = [(VenueCategoryViewController *)self initWithSearchCategory:v5];

  if (v6)
  {
    v6->_isAutoComplete = 1;
    v7 = [[VenueCategoryContentDownloader alloc] initWithDelegate:v6 venueAutoCompleteCategoryCardItem:v4];
    contentDownloader = v6->_contentDownloader;
    v6->_contentDownloader = v7;

    v9 = [(VenueCategoryViewController *)v6 dataSource];
    v10 = [v9 searchCategory];
    v11 = [v10 shortDisplayString];
    [(VenueCategoryViewController *)v6 setHeaderTitle:v11];
  }
  return v6;
}

- (void)setHeaderTitle:(id)a3
{
  id v4 = (NSString *)a3;
  v5 = v4;
  if (self->_headerTitle != v4)
  {
    v10 = v4;
    unsigned __int8 v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      headerTitle = self->_headerTitle;
      self->_headerTitle = v7;

      v5 = v10;
      headerLabel = self->_headerLabel;
      if (headerLabel)
      {
        [(UILabel *)headerLabel setText:self->_headerTitle];
        v5 = v10;
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VenueCategoryViewController;
  [(ContaineeViewController *)&v5 viewWillAppear:a3];
  if ([(VenueCategoryViewController *)self isAutoComplete]) {
    uint64_t v4 = [(VenueCategoryViewController *)self didFinishAutoCompleteSearchRequest] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }
  [(VenueCategoryViewController *)self setShowsLoading:v4];
}

- (void)venueCategoryContentDownloaderDidStart:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D6C4F8;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)venueCategoryContentDownloader:(id)a3 didChangeMapItem:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D6C59C;
  v5[3] = &unk_1012E5D58;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)venueCategoryContentDownloader:(id)a3 didFailToFetchMapItemWithError:(id)a4
{
  id v4 = a4;
  objc_super v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VenueCategoryContentDownloader failed to download MKMapItem with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)venueCategoryContentDownloaderDidFail:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D6C7D0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)venueCategoryContentDownloaderDidCancel:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D6C888;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveEVChargerUpdates:(id)a4
{
  id v5 = a4;
  id v6 = [(VenueCategoryViewController *)self dataSource];
  [v6 refreshEVChargers:v5];
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveSearchResults:(id)a4 shouldSwitchToBestFloor:(BOOL)a5
{
  id v7 = a4;
  v8 = [(VenueCategoryViewController *)self filterView];
  v9 = -[VenueCategoryViewController _buildingAtIndex:](self, "_buildingAtIndex:", [v8 selectedIndex]);

  unsigned int v10 = [v9 describesParentVenue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D6CA28;
  v13[3] = &unk_101323248;
  uint64_t v11 = 1;
  if (v10) {
    uint64_t v11 = 2;
  }
  v13[4] = self;
  id v14 = v7;
  uint64_t v15 = v11;
  BOOL v16 = a5;
  id v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveAutoCompleteSubcategories:(id)a4 subcategoriesType:(int)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D6CB70;
  block[3] = &unk_1012E77B0;
  int v8 = a5;
  block[4] = self;
  id v7 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  [(ContaineeViewController *)&v4 viewDidLoad];
  [(VenueCategoryViewController *)self configureTableView];
  [(VenueCategoryViewController *)self configureHeader];
  [(VenueCategoryViewController *)self updateFooterVisibility];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  [(ControlContaineeViewController *)&v4 setDelegate:a3];
  [(VenueCategoryViewController *)self performInitialSearchIfNecessary];
}

- (void)performInitialSearchIfNecessary
{
  if (![(VenueCategoryViewController *)self isAutoComplete])
  {
    uint64_t v3 = [(ControlContaineeViewController *)self delegate];
    if (v3)
    {
      objc_super v4 = (void *)v3;
      id v5 = [(VenueCategoryViewController *)self dataSource];
      id v6 = [v5 mapItem];

      if (v6)
      {
        id v15 = [(VenueCategoryViewController *)self contentDownloader];
        id v7 = [(VenueCategoryViewController *)self dataSource];
        int v8 = [v7 searchCategory];
        v9 = [(VenueCategoryViewController *)self dataSource];
        id v10 = [v9 subcategoriesType];
        uint64_t v11 = [(VenueCategoryViewController *)self dataSource];
        id v12 = [v11 buildings];
        v13 = [v12 firstObject];
        id v14 = [(ControlContaineeViewController *)self delegate];
        [v15 performSearchWithSearchCategory:v8 subcategoriesType:v10 filter:v13 shouldFrameMapViewport:0 actionCoordination:v14];
      }
    }
  }
}

- (void)updateFilterBar
{
  uint64_t v3 = [(VenueCategoryViewController *)self dataSource];
  id v8 = [v3 filterBarTitles];

  id v4 = [v8 count];
  id v5 = [(VenueCategoryViewController *)self filterView];
  id v6 = v5;
  if ((unint64_t)v4 > 1)
  {
    id v7 = [v8 copy];
    [v6 setSubCategories:v7 selectedIndex:0];

    [(VenueCategoryViewController *)self updateFooterVisibility];
  }
  else
  {
    [v5 resetData];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  [(VenueCategoryViewController *)&v4 viewSafeAreaInsetsDidChange];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D6CF98;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setShowsLoading:(BOOL)a3
{
  if (self->_showsLoading != a3)
  {
    BOOL v3 = a3;
    self->_showsLoading = a3;
    id v5 = [(VenueCategoryViewController *)self tableView];
    [v5 setHidden:v3];

    id v6 = [(VenueCategoryViewController *)self loadingModeView];
    [v6 setHidden:v3 ^ 1];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VenueCategoryViewController;
  [(VenueCategoryViewController *)&v3 viewWillLayoutSubviews];
  [(VenueCategoryViewController *)self displayIndexListIfNecessary];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  [(ContaineeViewController *)&v4 viewDidLayoutSubviews];
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  -[VenueCategoryViewController setShouldDisplayFilterView:](self, "setShouldDisplayFilterView:", (unint64_t)[v3 containeeLayout] > 1);
}

- (void)displayIndexListIfNecessary
{
  objc_super v3 = [(VenueCategoryViewController *)self tableView];
  unsigned int v4 = [v3 isIndexHidden];

  id v5 = [(VenueCategoryViewController *)self view];
  [v5 frame];
  double Height = CGRectGetHeight(v17);
  [(ContaineeViewController *)self heightForLayout:3];
  double v8 = v7;

  v9 = [(VenueCategoryViewController *)self dataSource];
  id v10 = [v9 numberOfSectionsNotEmpty];
  unint64_t UInteger = GEOConfigGetUInteger();

  int v13 = Height >= v8 && (unint64_t)v10 >= UInteger;
  id v14 = [(VenueCategoryViewController *)self tableView];
  [v14 setIndexHidden:v13 ^ 1u animated:1];

  if (v4 == v13)
  {
    id v15 = [(VenueCategoryViewController *)self tableView];
    [v15 reloadData];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v5 = [(VenueCategoryViewController *)self headerLabelFont];
  unsigned int v4 = [(VenueCategoryViewController *)self headerLabel];
  [v4 setFont:v5];
}

- (void)applyAlphaToContent:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:a3];
}

- (id)headerLabelFont
{
  return +[UIFont system22Bold];
}

- (void)configureHeader
{
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = objc_alloc_init((Class)UIImageView);
  [(VenueCategoryViewController *)self setHeaderImageView:v4];

  [(VenueCategoryViewController *)self updateHeaderImageView];
  objc_super v5 = [(VenueCategoryViewController *)self headerImageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(VenueCategoryViewController *)self headerImageView];
  [v3 addSubview:v6];

  id v7 = objc_alloc_init((Class)UILabel);
  [(VenueCategoryViewController *)self setHeaderLabel:v7];

  double v8 = [(VenueCategoryViewController *)self headerLabel];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = +[UIColor clearColor];
  id v10 = [(VenueCategoryViewController *)self headerLabel];
  [v10 setBackgroundColor:v9];

  uint64_t v11 = [(VenueCategoryViewController *)self headerLabel];
  [v11 setNumberOfLines:0];

  id v12 = [(VenueCategoryViewController *)self headerLabelFont];
  int v13 = [(VenueCategoryViewController *)self headerLabel];
  [v13 setFont:v12];

  headerTitle = self->_headerTitle;
  id v15 = [(VenueCategoryViewController *)self headerLabel];
  [v15 setText:headerTitle];

  BOOL v16 = +[UIColor labelColor];
  CGRect v17 = [(VenueCategoryViewController *)self headerLabel];
  [v17 setTextColor:v16];

  v18 = [(VenueCategoryViewController *)self headerLabel];
  [v3 addSubview:v18];

  v19 = [ContainerHeaderView alloc];
  v20 = [(VenueCategoryViewController *)self view];
  [v20 _contentMargin];
  v21 = -[ContainerHeaderView initWithHairlineMargin:](v19, "initWithHairlineMargin:");

  [(ContainerHeaderView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)v21 setTitleView:v3];
  [(ContainerHeaderView *)v21 setDelegate:self];
  [(ContainerHeaderView *)v21 setVerticalAlignmentOffset:11.0];
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v21;
  v23 = v21;

  v24 = [(ContaineeViewController *)self headerView];
  [v24 addSubview:v23];

  v78 = [(ContainerHeaderView *)v23 heightAnchor];
  v77 = [v78 constraintGreaterThanOrEqualToConstant:80.0];
  v79[0] = v77;
  v76 = [(VenueCategoryViewController *)self headerImageView];
  v75 = [v76 leadingAnchor];
  v74 = [v3 leadingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74 constant:16.0];
  v79[1] = v73;
  v72 = [(VenueCategoryViewController *)self headerImageView];
  v71 = [v72 widthAnchor];
  v70 = [v71 constraintEqualToConstant:40.0];
  v79[2] = v70;
  v69 = [(VenueCategoryViewController *)self headerImageView];
  v68 = [v69 heightAnchor];
  v67 = [v68 constraintEqualToConstant:40.0];
  v79[3] = v67;
  v66 = [(VenueCategoryViewController *)self headerImageView];
  v64 = [v66 topAnchor];
  v65 = v3;
  v63 = [v3 topAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:20.0];
  v79[4] = v62;
  v61 = [(VenueCategoryViewController *)self headerLabel];
  v59 = [v61 leadingAnchor];
  v60 = [(VenueCategoryViewController *)self headerImageView];
  v58 = [v60 trailingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:10.0];
  v79[5] = v57;
  v56 = [(VenueCategoryViewController *)self headerLabel];
  v55 = [v56 trailingAnchor];
  v54 = [v3 trailingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v79[6] = v53;
  v52 = [(VenueCategoryViewController *)self headerLabel];
  v50 = [v52 centerYAnchor];
  v51 = [(ContaineeViewController *)self headerView];
  v49 = [v51 centerYAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v79[7] = v48;
  v47 = [(VenueCategoryViewController *)self headerLabel];
  v45 = [v47 topAnchor];
  v46 = [(ContaineeViewController *)self headerView];
  v44 = [v46 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:13.0];
  v79[8] = v43;
  v42 = [(ContaineeViewController *)self headerView];
  v41 = [v42 leadingAnchor];
  v40 = [(ContainerHeaderView *)v23 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v79[9] = v39;
  v38 = [(ContaineeViewController *)self headerView];
  v37 = [v38 trailingAnchor];
  v25 = v23;
  v36 = [(ContainerHeaderView *)v23 trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v79[10] = v35;
  v26 = [(ContaineeViewController *)self headerView];
  v27 = [v26 topAnchor];
  v28 = [(ContainerHeaderView *)v23 topAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v79[11] = v29;
  v30 = [(ContaineeViewController *)self headerView];
  v31 = [v30 bottomAnchor];
  v32 = [(ContainerHeaderView *)v25 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v79[12] = v33;
  v34 = +[NSArray arrayWithObjects:v79 count:13];
  +[NSLayoutConstraint activateConstraints:v34];
}

- (void)updateHeaderImageView
{
  id v3 = [(VenueCategoryViewController *)self dataSource];
  id v4 = [v3 searchCategory];
  objc_super v5 = v4;
  if (v4)
  {
    id v16 = v4;
  }
  else
  {
    id v6 = [(VenueCategoryViewController *)self dataSource];
    id v7 = [v6 subcategories];
    id v16 = [v7 firstObject];
  }
  double v8 = [v16 styleAttributes];
  v9 = +[UIScreen mainScreen];
  [v9 nativeScale];
  double v11 = v10;
  id v12 = [(VenueCategoryViewController *)self traitCollection];
  LOBYTE(v15) = [v12 userInterfaceStyle] == (id)2;
  int v13 = +[MKIconManager imageForStyle:v8 size:4 forScale:1 format:0 transparent:0 transitMode:0 isCarplay:v11 nightMode:v15];
  id v14 = [(VenueCategoryViewController *)self headerImageView];
  [v14 setImage:v13];
}

- (NSDictionary)searchResultCountInVenue
{
  id v3 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [(VenueCategoryViewController *)self dataSource];
  objc_super v5 = [v4 content];
  id v6 = [v5 objects];

  id v23 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v6);
        }
        double v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v9 = [v8 mapItem];
        uint64_t v10 = [v9 venueAreaIdentifiers];
        double v11 = (void *)v10;
        id v12 = &__NSArray0__struct;
        if (v10) {
          id v12 = (void *)v10;
        }
        id v13 = v12;

        id v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
              v19 = [v3 objectForKeyedSubscript:v18];
              v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v19 unsignedIntegerValue] + 1);
              [v3 setObject:v20 forKeyedSubscript:v18];
            }
            id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }
      }
      id v23 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  return (NSDictionary *)v3;
}

- (void)didUpdateResults
{
  id v3 = [(VenueCategoryViewController *)self tableView];
  [v3 reloadData];

  id v4 = [(VenueCategoryViewController *)self tableView];
  uint64_t v5 = (uint64_t)[v4 numberOfSections];

  if (v5 >= 1)
  {
    id v6 = [(VenueCategoryViewController *)self tableView];
    id v7 = +[NSIndexPath indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0];
    [v6 scrollToRowAtIndexPath:v7 atScrollPosition:1 animated:0];
  }

  [(VenueCategoryViewController *)self displayIndexListIfNecessary];
}

- (void)notifyVenuesManagerAndSwitchToBestFloor:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ControlContaineeViewController *)self delegate];
  id v6 = [v5 venuesManager];
  [v6 venuesControlCoordinatingDidChangeSearchResultCount:self];

  if (v3)
  {
    id v8 = [(ControlContaineeViewController *)self delegate];
    id v7 = [v8 venuesManager];
    [v7 updateFocusedVenueFloor];
  }
}

- (void)configureTableView
{
  BOOL v3 = +[UIColor clearColor];
  id v4 = [(VenueCategoryViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = +[UIColor clearColor];
  id v6 = [(VenueCategoryViewController *)self tableView];
  [v6 setSectionIndexBackgroundColor:v5];

  id v7 = [(ContaineeViewController *)self contentView];
  id v8 = [(VenueCategoryViewController *)self tableView];
  [v7 addSubview:v8];

  v9 = [(VenueCategoryViewController *)self tableView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v10 = [(VenueCategoryViewController *)self tableView];
  [v10 setPreservesSuperviewLayoutMargins:1];

  double v11 = [(VenueCategoryViewController *)self dataSource];
  [v11 setDelegate:self];

  id v12 = -[FilterCategoriesView initWithFrame:]([FilterCategoriesView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(VenueCategoryViewController *)self setFilterView:v12];

  id v13 = [(VenueCategoryViewController *)self filterView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v14 = [(VenueCategoryViewController *)self filterView];
  [v14 setDelegate:self];

  id v15 = [(VenueCategoryViewController *)self filterView];
  [v15 setLastButtonTrailingPadding:20.0];

  uint64_t v16 = [(ContaineeViewController *)self contentView];
  CGRect v17 = [(VenueCategoryViewController *)self filterView];
  [v16 addSubview:v17];

  uint64_t v18 = [LoadingModeView alloc];
  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Loading ..." value:@"localized string not found" table:0];
  v21 = [(LoadingModeView *)v18 initWithTitle:v20];
  [(VenueCategoryViewController *)self setLoadingModeView:v21];

  uint64_t v22 = [(VenueCategoryViewController *)self loadingModeView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = [(VenueCategoryViewController *)self loadingModeView];
  [v23 setContentHuggingPriority:1 forAxis:0.0];

  long long v24 = [(VenueCategoryViewController *)self loadingModeView];
  [v24 setHidden:1];

  long long v25 = [(ContaineeViewController *)self contentView];
  long long v26 = [(VenueCategoryViewController *)self loadingModeView];
  [v25 addSubview:v26];

  long long v27 = [(VenueCategoryViewController *)self filterView];
  long long v28 = [v27 bottomAnchor];
  long long v29 = [(ContaineeViewController *)self contentView];
  long long v30 = [v29 bottomAnchor];
  long long v31 = [v28 constraintEqualToAnchor:v30];

  LODWORD(v32) = 1140457472;
  v75 = v31;
  [v31 setPriority:v32];
  v89 = [(VenueCategoryViewController *)self tableView];
  v87 = [v89 topAnchor];
  v88 = [(ContaineeViewController *)self headerView];
  v86 = [v88 bottomAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v90[0] = v85;
  v84 = [(VenueCategoryViewController *)self tableView];
  v82 = [v84 leadingAnchor];
  v83 = [(VenueCategoryViewController *)self view];
  v81 = [v83 leadingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v90[1] = v80;
  v79 = [(VenueCategoryViewController *)self tableView];
  v77 = [v79 trailingAnchor];
  v78 = [(VenueCategoryViewController *)self view];
  v76 = [v78 trailingAnchor];
  v74 = [v77 constraintEqualToAnchor:v76];
  v90[2] = v74;
  v73 = [(VenueCategoryViewController *)self tableView];
  v71 = [v73 bottomAnchor];
  v72 = [(VenueCategoryViewController *)self view];
  v70 = [v72 bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v90[3] = v69;
  v68 = [(VenueCategoryViewController *)self filterView];
  v66 = [v68 topAnchor];
  v67 = [(ContaineeViewController *)self contentView];
  v65 = [v67 topAnchor];
  v64 = [v66 constraintGreaterThanOrEqualToAnchor:v65];
  v90[4] = v64;
  v90[5] = v31;
  v63 = [(VenueCategoryViewController *)self filterView];
  v61 = [v63 leadingAnchor];
  v62 = [(ContaineeViewController *)self contentView];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v90[6] = v59;
  v58 = [(VenueCategoryViewController *)self filterView];
  v56 = [v58 trailingAnchor];
  v57 = [(ContaineeViewController *)self contentView];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v90[7] = v54;
  v53 = [(VenueCategoryViewController *)self loadingModeView];
  v51 = [v53 topAnchor];
  v52 = [(VenueCategoryViewController *)self tableView];
  v50 = [v52 topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v90[8] = v49;
  v48 = [(VenueCategoryViewController *)self loadingModeView];
  v46 = [v48 bottomAnchor];
  v47 = [(VenueCategoryViewController *)self tableView];
  v45 = [v47 bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v90[9] = v44;
  v43 = [(VenueCategoryViewController *)self loadingModeView];
  v33 = [v43 leadingAnchor];
  v34 = [(VenueCategoryViewController *)self tableView];
  v35 = [v34 leadingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v90[10] = v36;
  v37 = [(VenueCategoryViewController *)self loadingModeView];
  v38 = [v37 trailingAnchor];
  v39 = [(VenueCategoryViewController *)self tableView];
  v40 = [v39 trailingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  v90[11] = v41;
  v42 = +[NSArray arrayWithObjects:v90 count:12];
  +[NSLayoutConstraint activateConstraints:v42];
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MKMapService sharedService];
  [v5 captureUserAction:4 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  v6.receiver = self;
  v6.super_class = (Class)VenueCategoryViewController;
  [(ContaineeViewController *)&v6 handleDismissAction:v4];
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v9, "willChangeContainerStyle:");
  if (a3 == 6)
  {
    uint64_t v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 setDefaultContaineeLayout:4];
  }
  else
  {
    uint64_t v5 = [(VenueCategoryViewController *)self dataSource];
    objc_super v6 = [v5 searchCategory];
    if ([v6 displayMode] == 2) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 2;
    }
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 setDefaultContaineeLayout:v7];
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v6 = a3;
  dataSource = self->_dataSource;
  if (dataSource) {
    [(VenueCategoryDataSource *)dataSource resetCache];
  }
  [(VenueCategoryViewController *)self handleDismissAction:v6];
}

- (void)setFilterViewHidden:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100D6EBC8;
  v3[3] = &unk_1012E6300;
  v3[4] = self;
  BOOL v4 = a3;
  +[UIView animateWithDuration:v3 animations:0.25];
}

- (void)setShouldDisplayFilterView:(BOOL)a3
{
  self->_shouldDisplayFilterView = a3;
  [(VenueCategoryViewController *)self updateFooterVisibility];
}

- (void)filterView:(id)a3 indexSelected:(unint64_t)a4
{
  id v9 = a3;
  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 wantsLayout:2];

  uint64_t v7 = [(VenueCategoryViewController *)self dataSource];
  unsigned int v8 = [v7 subcategoriesType];

  if (v8 >= 2)
  {
    if (v8 == 2) {
      [(VenueCategoryViewController *)self filterView:v9 didSelectBuildingWithIndex:a4];
    }
  }
  else
  {
    [(VenueCategoryViewController *)self filterView:v9 didSelectSubcategoryWithIndex:a4];
  }
}

- (void)filterView:(id)a3 didSelectSubcategoryWithIndex:(unint64_t)a4
{
  id v6 = [(VenueCategoryViewController *)self dataSource];
  uint64_t v7 = [v6 subcategories];

  if (v7 && (unint64_t)[v7 count] > a4)
  {
    id v11 = [v7 objectAtIndexedSubscript:a4];
  }
  else
  {
    id v11 = 0;
  }
  unsigned int v8 = [(VenueCategoryViewController *)self contentDownloader];
  uint64_t v9 = [v11 isSubCategorySameAsTopLevel] ^ 1;
  uint64_t v10 = [(ControlContaineeViewController *)self delegate];
  [v8 performSearchWithSearchCategory:v11 subcategoriesType:1 filter:0 shouldFrameMapViewport:v9 actionCoordination:v10];
}

- (void)filterView:(id)a3 didSelectBuildingWithIndex:(unint64_t)a4
{
  id v10 = [(VenueCategoryViewController *)self _buildingAtIndex:a4];
  uint64_t v5 = [(VenueCategoryViewController *)self contentDownloader];
  id v6 = [(VenueCategoryViewController *)self dataSource];
  uint64_t v7 = [v6 searchCategory];
  uint64_t v8 = [v10 describesParentVenue] ^ 1;
  uint64_t v9 = [(ControlContaineeViewController *)self delegate];
  [v5 performSearchWithSearchCategory:v7 subcategoriesType:2 filter:v10 shouldFrameMapViewport:v8 actionCoordination:v9];
}

- (void)updateFooterVisibility
{
  BOOL v3 = [(VenueCategoryViewController *)self filterView];
  BOOL v4 = [v3 subCategories];
  if ([v4 count])
  {
    unsigned int v5 = [(VenueCategoryViewController *)self shouldDisplayFilterView];

    [(VenueCategoryViewController *)self setFilterViewHidden:v5 ^ 1];
    double Height = 0.0;
    if (((v5 ^ 1) & 1) == 0)
    {
      uint64_t v7 = [(VenueCategoryViewController *)self filterView];
      [v7 frame];
      double Height = CGRectGetHeight(v18);
    }
  }
  else
  {

    [(VenueCategoryViewController *)self setFilterViewHidden:1];
    double Height = 0.0;
  }
  uint64_t v8 = [(VenueCategoryViewController *)self tableView];
  [v8 contentInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v15 = [(VenueCategoryViewController *)self tableView];
  [v15 setContentInset:v10, v12, Height, v14];

  id v16 = [(VenueCategoryViewController *)self loadingModeView];
  [v16 setBottomInset:Height];
}

- (NSString)refineSearchText
{
  BOOL v3 = [(VenueCategoryViewController *)self filterView];
  BOOL v4 = [v3 subCategories];
  unsigned int v5 = [(VenueCategoryViewController *)self filterView];
  id v6 = [v4 objectAtIndexedSubscript:[v5 selectedIndex]];

  return (NSString *)v6;
}

- (int)refineSearchSessionType
{
  return 2;
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v8;
    id v6 = [(ControlContaineeViewController *)self delegate];
    [v6 viewController:self focusSearchResult:v5];

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = 0;
  }
  else
  {
    if (self->_lastItemTapped) {
      goto LABEL_6;
    }
    lastItemTapped = [(ControlContaineeViewController *)self delegate];
    [lastItemTapped viewControllerRemoveSearchResultFocus:self];
  }

LABEL_6:
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v8;
    id v6 = [(ControlContaineeViewController *)self delegate];
    [v6 viewController:self selectVenueSearchResult:v5 source:2];

    id lastItemTapped = self->_lastItemTapped;
    self->_id lastItemTapped = v5;
  }
}

- (id)_headerLabelTextFromMapItem:(id)a3 searchCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  double v9 = &stru_101324E70;
  if (v6 && v7)
  {
    if (self->_isAutoComplete)
    {
      double v9 = [v7 shortDisplayString];
    }
    else
    {
      double v10 = +[NSBundle mainBundle];
      double v11 = [v10 localizedStringForKey:@"category_at_venue_format_key" value:@"localized string not found" table:0];

      double v12 = [(VenueCategoryViewController *)self _venueShortNameForMapItem:v6];
      double v13 = [v8 shortDisplayString];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v12);
      double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (id)_venueShortNameForMapItem:(id)a3
{
  id v3 = a3;
  if ([v3 _venueFeatureType] == (id)1) {
    [v3 venueLabelWithContext:0];
  }
  else {
  BOOL v4 = [v3 name];
  }

  return v4;
}

- (id)_buildingAtIndex:(unint64_t)a3
{
  BOOL v4 = [(VenueCategoryViewController *)self dataSource];
  id v5 = [v4 buildings];

  if (v5 && (unint64_t)[v5 count] > a3)
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int)currentUITargetForAnalytics
{
  return 106;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)selectSubcategory:(id)a3
{
  id v4 = a3;
  id v5 = [(VenueCategoryViewController *)self dataSource];
  id v6 = [v5 subcategories];
  id v7 = [v6 indexOfObject:v4];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"VenueBrowseDidFailToSelectSubcategory" object:0];
  }
  else
  {
    id v8 = [(VenueCategoryViewController *)self filterView];
    -[VenueCategoryViewController filterView:indexSelected:](self, "filterView:indexSelected:");
  }
}

- (signed)currentSelectedFloorOrdinal
{
  return self->_currentSelectedFloorOrdinal;
}

- (void)setCurrentSelectedFloorOrdinal:(signed __int16)a3
{
  self->_currentSelectedFloorOrdinal = a3;
}

- (VenueCategoryContentDownloader)contentDownloader
{
  return self->_contentDownloader;
}

- (void)setContentDownloader:(id)a3
{
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (BOOL)shouldDisplayFilterView
{
  return self->_shouldDisplayFilterView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (FilterCategoriesView)filterView
{
  return self->_filterView;
}

- (void)setFilterView:(id)a3
{
}

- (LoadingModeView)loadingModeView
{
  return self->_loadingModeView;
}

- (void)setLoadingModeView:(id)a3
{
}

- (VenueCategoryDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (VKVenueFeatureMarker)venueWithFocus
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venueWithFocus);

  return (VKVenueFeatureMarker *)WeakRetained;
}

- (void)setVenueWithFocus:(id)a3
{
}

- (BOOL)showsLoading
{
  return self->_showsLoading;
}

- (BOOL)isAutoComplete
{
  return self->_isAutoComplete;
}

- (void)setIsAutoComplete:(BOOL)a3
{
  self->_isAutoComplete = a3;
}

- (BOOL)didFinishAutoCompleteSearchRequest
{
  return self->_didFinishAutoCompleteSearchRequest;
}

- (void)setDidFinishAutoCompleteSearchRequest:(BOOL)a3
{
  self->_didFinishAutoCompleteSearchRequest = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (id)lastItemTapped
{
  return self->_lastItemTapped;
}

- (void)setLastItemTapped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_venueWithFocus);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_contentDownloader, 0);

  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end