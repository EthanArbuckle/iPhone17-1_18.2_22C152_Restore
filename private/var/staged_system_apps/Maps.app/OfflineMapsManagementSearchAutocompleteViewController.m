@interface OfflineMapsManagementSearchAutocompleteViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)isSearchLoading;
- (GEOMapDataSubscriptionManager)subscriptionManager;
- (OfflineMapsManagementActionCoordination)delegate;
- (OfflineMapsManagementSearchAutocompleteDataSource)searchDataSource;
- (UIActivityIndicatorView)activityIndicator;
- (UICollectionView)collectionView;
- (UINavigationBar)navBar;
- (UISearchController)searchController;
- (void)_addSubscriptionForMapItem:(id)a3;
- (void)_dismiss;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSearchLoading:(BOOL)a3;
- (void)setNavBar:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchDataSource:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation OfflineMapsManagementSearchAutocompleteViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  [(ContaineeViewController *)&v3 viewDidLoad];
  [(OfflineMapsManagementSearchAutocompleteViewController *)self _setupViews];
  [(OfflineMapsManagementSearchAutocompleteViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  [(ContaineeViewController *)&v9 viewWillAppear:a3];
  v4 = [OfflineMapsManagementSearchAutocompleteDataSource alloc];
  v5 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  v6 = [(OfflineMapsManagementSearchAutocompleteDataSource *)v4 initWithCollectionView:v5 updateLocation:1];
  [(OfflineMapsManagementSearchAutocompleteViewController *)self setSearchDataSource:v6];

  v7 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchDataSource];
  [v7 setDelegate:self];

  v8 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchDataSource];
  [v8 setActive:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  [(OfflineMapsManagementSearchAutocompleteViewController *)&v5 viewDidAppear:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D0AAC0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  v4 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchDataSource];
  [v4 setActive:0];
}

- (void)_setupViews
{
  id v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  [(OfflineMapsManagementSearchAutocompleteViewController *)self setSubscriptionManager:v3];

  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setPresentedModally:1];

  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setTakesAvailableHeight:1];

  id v6 = objc_alloc((Class)UINavigationItem);
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Download New Map [page title]" value:@"localized string not found" table:@"Offline"];
  id v9 = [v6 initWithTitle:v8];

  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismiss"];
  [v9 setLeftBarButtonItem:v10];

  id v11 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(OfflineMapsManagementSearchAutocompleteViewController *)self setActivityIndicator:v11];

  id v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = [(OfflineMapsManagementSearchAutocompleteViewController *)self activityIndicator];
  id v14 = [v12 initWithCustomView:v13];

  [v9 setRightBarButtonItem:v14];
  id v15 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  [(OfflineMapsManagementSearchAutocompleteViewController *)self setSearchController:v15];

  v16 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v16 setSearchResultsUpdater:self];

  v17 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v17 setObscuresBackgroundDuringPresentation:0];

  v18 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v18 setHidesNavigationBarDuringPresentation:0];

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Search city [search bar placeholder]" value:@"localized string not found" table:@"Offline"];
  v21 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  v22 = [v21 searchBar];
  [v22 setPlaceholder:v20];

  v23 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  v24 = [v23 searchBar];
  [v24 setReturnKeyType:9];

  v25 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v25 setAutomaticallyShowsCancelButton:0];

  v26 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v26 setActive:1];

  v27 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v9 setSearchController:v27];

  [v9 setHidesSearchBarWhenScrolling:0];
  id v28 = objc_alloc_init((Class)UINavigationBar);
  [(OfflineMapsManagementSearchAutocompleteViewController *)self setNavBar:v28];

  v29 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  [v30 pushNavigationItem:v9 animated:0];

  v31 = [(ContaineeViewController *)self headerView];
  v32 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  [v31 addSubview:v32];

  objc_initWeak(&location, self);
  id v33 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_100D0B0C0;
  v46 = &unk_1012EF3A8;
  objc_copyWeak(&v47, &location);
  id v34 = [v33 initWithSectionProvider:&v43];
  id v35 = objc_alloc((Class)UICollectionView);
  id v36 = [v35 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v43, v44, v45, v46];
  [(OfflineMapsManagementSearchAutocompleteViewController *)self setCollectionView:v36];

  v37 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = +[UIColor clearColor];
  v39 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  [v39 setBackgroundColor:v38];

  v40 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  [v40 setAccessibilityIdentifier:@"OfflineMapsSearchACCollectionView"];

  v41 = [(ContaineeViewController *)self contentView];
  v42 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  [v41 addSubview:v42];

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  v43 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  v41 = [v43 topAnchor];
  v42 = [(ContaineeViewController *)self headerView];
  v40 = [v42 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  id v36 = [v38 leadingAnchor];
  v37 = [(ContaineeViewController *)self headerView];
  id v35 = [v37 leadingAnchor];
  id v34 = [v36 constraintEqualToAnchor:v35];
  v44[1] = v34;
  id v33 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  v31 = [v33 trailingAnchor];
  v32 = [(ContaineeViewController *)self headerView];
  v30 = [v32 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v44[2] = v29;
  id v28 = [(OfflineMapsManagementSearchAutocompleteViewController *)self navBar];
  v26 = [v28 bottomAnchor];
  v27 = [(ContaineeViewController *)self headerView];
  v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v44[3] = v24;
  v23 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  v21 = [v23 topAnchor];
  v22 = [(ContaineeViewController *)self contentView];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v44[4] = v19;
  v18 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  v16 = [v18 leadingAnchor];
  v17 = [(ContaineeViewController *)self contentView];
  id v15 = [v17 leadingAnchor];
  id v14 = [v16 constraintEqualToAnchor:v15];
  v44[5] = v14;
  v13 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  id v3 = [v13 trailingAnchor];
  v4 = [(ContaineeViewController *)self contentView];
  objc_super v5 = [v4 trailingAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v44[6] = v6;
  v7 = [(OfflineMapsManagementSearchAutocompleteViewController *)self collectionView];
  v8 = [v7 bottomAnchor];
  id v9 = [(ContaineeViewController *)self contentView];
  id v10 = [v9 bottomAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v44[7] = v11;
  id v12 = +[NSArray arrayWithObjects:v44 count:8];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_dismiss
{
  id v2 = [(OfflineMapsManagementSearchAutocompleteViewController *)self delegate];
  [v2 closeAddNewMapSearchAutocomplete];
}

- (void)_addSubscriptionForMapItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  [v5 setActive:0];

  id v6 = [v4 _geoMapItem];
  v7 = [v6 offlineDownloadRegion];

  v8 = [v4 name];
  id v9 = +[MKUserLocation title];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [v4 _addressFormattedAsCity];

    v8 = (void *)v11;
  }
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100D0BA4C;
  v19[3] = &unk_1012E9340;
  objc_copyWeak(&v22, &location);
  id v12 = v7;
  id v20 = v12;
  id v13 = v8;
  id v21 = v13;
  id v14 = objc_retainBlock(v19);
  id v15 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchController];
  v16 = [v15 transitionCoordinator];

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100D0BAB4;
    v17[3] = &unk_1012FEC60;
    v18 = v14;
    [v16 animateAlongsideTransition:&stru_101321D08 completion:v17];
  }
  else
  {
    ((void (*)(void *))v14[2])(v14);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(OfflineMapsManagementSearchAutocompleteViewController *)self isSearchLoading])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [objc_alloc((Class)MKLocalSearchRequest) initWithCompletion:v8];
      id v10 = [objc_alloc((Class)MKLocalSearch) initWithRequest:v9];
      [(OfflineMapsManagementSearchAutocompleteViewController *)self setIsSearchLoading:1];
      objc_initWeak(&location, self);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100D0BD78;
      v23[3] = &unk_101321D30;
      objc_copyWeak(&v24, &location);
      [v10 startWithCompletionHandler:v23];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v7 mapItem];
      [(OfflineMapsManagementSearchAutocompleteViewController *)self _addSubscriptionForMapItem:v11];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v7;
      id v13 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      objc_opt_class();
      id v14 = v12;
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      if (v16
        && ([v16 historyEntry],
            v17 = objc_claimAutoreleasedReturnValue(),
            unsigned int v18 = [v17 conformsToProtocol:v13],
            v17,
            v18))
      {
        id v19 = v14;
      }
      else
      {
        id v19 = 0;
      }

      if (v19)
      {
        id v20 = [v19 historyEntry];
        id v21 = [v20 geoMapItem];
        id v22 = +[MKMapItem _itemWithGeoMapItem:v21];

        [(OfflineMapsManagementSearchAutocompleteViewController *)self _addSubscriptionForMapItem:v22];
      }
    }
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v7 = [(OfflineMapsManagementSearchAutocompleteViewController *)self searchDataSource];
  objc_super v5 = [v4 searchBar];

  id v6 = [v5 text];
  [v7 updateForSearchQuery:v6];
}

- (BOOL)isSearchLoading
{
  if (!+[NSThread isMainThread])
  {
    id v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315906;
      id v8 = "-[OfflineMapsManagementSearchAutocompleteViewController isSearchLoading]";
      __int16 v9 = 2080;
      id v10 = "OfflineMapsManagementSearchAutocompleteViewController.m";
      __int16 v11 = 1024;
      int v12 = 247;
      __int16 v13 = 2080;
      id v14 = "[NSThread isMainThread]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v7, 0x26u);
    }

    if (sub_100BB36BC())
    {
      objc_super v5 = sub_1005762E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = +[NSThread callStackSymbols];
        int v7 = 138412290;
        id v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  return self->_isSearchLoading;
}

- (void)setIsSearchLoading:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isSearchLoading = a3;
  id v4 = [(OfflineMapsManagementSearchAutocompleteViewController *)self activityIndicator];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (OfflineMapsManagementActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OfflineMapsManagementActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (OfflineMapsManagementSearchAutocompleteDataSource)searchDataSource
{
  return self->_searchDataSource;
}

- (void)setSearchDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end