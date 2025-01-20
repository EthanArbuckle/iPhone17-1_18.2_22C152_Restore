@interface RAPWebBundleEditLocationViewController
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (NSString)promptText;
- (RAPWebBundleEditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 mapType:(unint64_t)a5 isShowingTraffic:(BOOL)a6 analyticsTarget:(int)a7 markerViewAttributes:(id)a8 showAnnotationTitle:(BOOL)a9 searchResultTypes:(unint64_t)a10 selectionHandler:(id)a11 cancelSelectionHandler:(id)a12;
- (void)_setupFloatingConrols;
- (void)_setupFloatingControlsAfterMapInitialized;
- (void)_setupSearch;
- (void)_updateWithInputText:(id)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4;
- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4;
- (void)editLocationMapViewFinishedRenderingMap:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setPromptText:(id)a3;
- (void)setupConstraints;
- (void)viewControllerOpenSettings:(id)a3;
- (void)viewDidLoad;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation RAPWebBundleEditLocationViewController

- (RAPWebBundleEditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 mapType:(unint64_t)a5 isShowingTraffic:(BOOL)a6 analyticsTarget:(int)a7 markerViewAttributes:(id)a8 showAnnotationTitle:(BOOL)a9 searchResultTypes:(unint64_t)a10 selectionHandler:(id)a11 cancelSelectionHandler:(id)a12
{
  uint64_t v15 = *(void *)&a7;
  BOOL v30 = a6;
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v19 = a4.var0.var1;
  double v20 = a4.var0.var0;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v24 = a12;
  id v25 = a11;
  id v26 = a8;
  v27 = [[RAPCorrectableEntryPoints alloc] initWithGEORoadAccessPoints:&__NSArray0__struct];
  v31.receiver = self;
  v31.super_class = (Class)RAPWebBundleEditLocationViewController;
  v28 = -[RAPEditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:](&v31, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:", v15, v26, 0, v27, v25, v24, latitude, longitude, v20, v19, var0, var1);

  if (v28)
  {
    v28->_showAnnotationTitle = a9;
    v28->_resultTypes = a10;
    [(EditLocationViewController *)v28 setMapType:a5];
    [(EditLocationViewController *)v28 setIsShowingTraffic:v30];
  }
  return v28;
}

- (void)setPromptText:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPWebBundleEditLocationViewController *)self navigationItem];
  [v5 setPrompt:v4];
}

- (NSString)promptText
{
  v2 = [(RAPWebBundleEditLocationViewController *)self navigationItem];
  v3 = [v2 prompt];

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  if (sub_1000BBB44(self) != 5) {
    [(RAPWebBundleEditLocationViewController *)self _setupFloatingConrols];
  }
  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleEditLocationViewController;
  [(RAPEditLocationViewController *)&v4 viewDidLoad];
  [(RAPWebBundleEditLocationViewController *)self _setupSearch];
  if (sub_1000BBB44(self) != 5) {
    [(RAPWebBundleEditLocationViewController *)self _setupFloatingControlsAfterMapInitialized];
  }
  v3 = [(EditLocationViewController *)self editLocationMapView];
  [v3 setPrompt:&stru_101324E70];
}

- (void)_setupFloatingConrols
{
  v3 = objc_alloc_init(IOSFloatingControlsViewController);
  floatingControlsViewController = self->_floatingControlsViewController;
  self->_floatingControlsViewController = v3;

  [(FloatingControlsViewController *)self->_floatingControlsViewController setOpenSettingsDelegate:self];
  id v5 = [(IOSFloatingControlsViewController *)self->_floatingControlsViewController view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(RAPWebBundleEditLocationViewController *)self addChildViewController:self->_floatingControlsViewController];
  v6 = [(RAPWebBundleEditLocationViewController *)self view];
  v7 = [(IOSFloatingControlsViewController *)self->_floatingControlsViewController view];
  [v6 addSubview:v7];

  v8 = self->_floatingControlsViewController;

  [(PassThroughViewController *)v8 didMoveToParentViewController:self];
}

- (void)_setupFloatingControlsAfterMapInitialized
{
  v3 = [(EditLocationViewController *)self editLocationMapView];
  [(FloatingControlsViewController *)self->_floatingControlsViewController setMapViewProviding:v3];

  floatingControlsViewController = self->_floatingControlsViewController;
  id v5 = [(EditLocationViewController *)self editLocationMapView];
  v6 = [v5 mapView];
  [(IOSFloatingControlsViewController *)floatingControlsViewController mapView:v6 regionDidChangeAnimated:0];

  [(IOSFloatingControlsViewController *)self->_floatingControlsViewController showControlsIfNeeded:3 animated:0];
  v7 = [(RAPWebBundleEditLocationViewController *)self view];
  v8 = [(IOSFloatingControlsViewController *)self->_floatingControlsViewController view];
  [v7 bringSubviewToFront:v8];

  id v9 = [(RAPWebBundleEditLocationViewController *)self view];
  [v9 bringSubviewToFront:self->_tableView];
}

- (void)_setupSearch
{
  id v3 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  [v3 setDelegate:self];
  objc_super v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"[Report an Issue Map] Search" value:@"localized string not found" table:0];
  v6 = [v3 searchBar];
  [v6 setPlaceholder:v5];

  v7 = [v3 searchBar];
  [v7 setReturnKeyType:9];

  v8 = [v3 searchBar];
  [v8 setDelegate:self];

  [v3 setObscuresBackgroundDuringPresentation:0];
  id v9 = [(RAPWebBundleEditLocationViewController *)self navigationItem];
  [v9 setSearchController:v3];

  objc_storeStrong((id *)&self->_searchController, v3);
  v10 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v10;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
  v12 = [(RAPWebBundleEditLocationViewController *)self view];
  [v12 addSubview:self->_tableView];

  v36 = [(UITableView *)self->_tableView leadingAnchor];
  v37 = [(RAPWebBundleEditLocationViewController *)self view];
  v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v38[0] = v34;
  v32 = [(UITableView *)self->_tableView trailingAnchor];
  v33 = [(RAPWebBundleEditLocationViewController *)self view];
  objc_super v31 = [v33 trailingAnchor];
  BOOL v30 = [v32 constraintEqualToAnchor:v31];
  v38[1] = v30;
  v28 = [(UITableView *)self->_tableView topAnchor];
  v29 = [(RAPWebBundleEditLocationViewController *)self view];
  v27 = [v29 safeAreaLayoutGuide];
  v13 = [v27 topAnchor];
  v14 = [v28 constraintEqualToAnchor:v13];
  v38[2] = v14;
  uint64_t v15 = [(UITableView *)self->_tableView bottomAnchor];
  v16 = [(RAPWebBundleEditLocationViewController *)self view];
  v17 = [v16 safeAreaLayoutGuide];
  v18 = [v17 bottomAnchor];
  double v19 = [v15 constraintEqualToAnchor:v18];
  v38[3] = v19;
  double v20 = +[NSArray arrayWithObjects:v38 count:4];
  +[NSLayoutConstraint activateConstraints:v20];

  v21 = [[SearchDataSource alloc] initWithTableView:self->_tableView];
  [(SearchDataSource *)v21 setResultTypes:self->_resultTypes];
  [(DataSource *)v21 setDelegate:self];
  [(UITableView *)self->_tableView setDelegate:v21];
  [(UITableView *)self->_tableView setDataSource:v21];
  [(UITableView *)self->_tableView setHidden:1];
  dataSource = self->_dataSource;
  self->_dataSource = v21;
  v23 = v21;

  if ((self->_resultTypes & 4) != 0) {
    +[RAPSearchAutocompleteBlockFilter poiAutocompleteFilterWithExcludedMUIDs:&__NSArray0__struct];
  }
  else {
  id v24 = +[RAPSearchAutocompleteBlockFilter addressAutocompleteFilter];
  }
  autocompleteFilter = self->_autocompleteFilter;
  self->_autocompleteFilter = v24;

  id v26 = [(EditLocationViewController *)self editLocationMapView];
  [v26 setHideAllSuplementaryViews:1];
}

- (void)setupConstraints
{
  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleEditLocationViewController;
  [(RAPEditLocationViewController *)&v14 setupConstraints];
  v13 = [(IOSFloatingControlsViewController *)self->_floatingControlsViewController view];
  id v3 = [v13 topAnchor];
  objc_super v4 = [(EditLocationViewController *)self editLocationMapView];
  id v5 = [v4 topAnchor];
  v6 = [v3 constraintEqualToAnchor:v5 constant:16.0];
  v15[0] = v6;
  v7 = [(IOSFloatingControlsViewController *)self->_floatingControlsViewController view];
  v8 = [v7 trailingAnchor];
  id v9 = [(EditLocationViewController *)self editLocationMapView];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:-16.0];
  v15[1] = v11;
  v12 = +[NSArray arrayWithObjects:v15 count:2];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPWebBundleEditLocationViewController;
  -[RAPEditLocationViewController editLocationMapView:didChangeCenterCoordinate:](&v8, "editLocationMapView:didChangeCenterCoordinate:", v7, latitude, longitude);
  if (self->_showAnnotationTitle) {
    [v7 updateAnnotationTitleWithCenterCoordinate:latitude, longitude];
  }
}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6 = a3;
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    v8.receiver = self;
    v8.super_class = (Class)RAPWebBundleEditLocationViewController;
    [(RAPEditLocationViewController *)&v8 editLocationMapView:v6 didChangeViewMode:a4];
  }
  id v7 = [(EditLocationViewController *)self editLocationMapView];
  [v7 setHideAllSuplementaryViews:1];
}

- (void)editLocationMapViewFinishedRenderingMap:(id)a3
{
  if (self->_showAnnotationTitle)
  {
    id v4 = a3;
    id v6 = [(EditLocationViewController *)self editLocationMapView];
    id v5 = [v6 mapView];
    [v5 centerCoordinate];
    [v4 updateAnnotationTitleWithCenterCoordinate:];
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = [(RAPWebBundleEditLocationViewController *)self navigationItem];
  [v4 setPrompt:0];

  tableView = self->_tableView;

  [(UITableView *)tableView setHidden:0];
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = [(RAPWebBundleEditLocationViewController *)self promptText];
  id v5 = [(RAPWebBundleEditLocationViewController *)self navigationItem];
  [v5 setPrompt:v4];

  tableView = self->_tableView;

  [(UITableView *)tableView setHidden:1];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)_updateWithInputText:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOMapService sharedService];
  id v8 = [v5 defaultTraits];

  -[SearchDataSource setActive:](self->_dataSource, "setActive:", [v4 length] != 0);
  if (![(DataSource *)self->_dataSource active]) {
    [(SearchDataSource *)self->_dataSource clearAutocompleteResults];
  }
  currentSearchString = self->_currentSearchString;
  self->_currentSearchString = (NSString *)v4;
  id v7 = v4;

  [(SearchDataSource *)self->_dataSource setInputText:self->_currentSearchString traits:v8 source:11];
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = +[GEOMapService sharedService];
    v10 = [v9 defaultTraits];

    [v10 setSource:23];
    v11 = +[MKMapService sharedService];
    v12 = [v8 queryLine];
    v13 = [v8 geoCompletionItem];
    objc_super v14 = [v11 ticketForSearchQuery:v12 completionItem:v13 traits:v10 searchSessionData:0];

    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_10039C5F4;
    v15[3] = &unk_1012E6E78;
    objc_copyWeak(&v16, &location);
    [v14 submitWithHandler:v15 networkActivity:0];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)dataSourceUpdated:(id)a3
{
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  return [(RAPSearchAutocompleteBlockFilter *)self->_autocompleteFilter shouldFilterItem:a4];
}

- (void)viewControllerOpenSettings:(id)a3
{
  id v4 = [(EditLocationViewController *)self editLocationMapView];
  [v4 setHideAllSuplementaryViews:0];

  id v5 = [(EditLocationViewController *)self editLocationMapView];
  [v5 setPrompt:&stru_101324E70];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingControlsViewController, 0);
  objc_storeStrong((id *)&self->_autocompleteFilter, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end