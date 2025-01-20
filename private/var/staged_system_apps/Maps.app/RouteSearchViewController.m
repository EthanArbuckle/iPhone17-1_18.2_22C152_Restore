@interface RouteSearchViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isReadyToRoute;
- (BOOL)canDeleteCurrentFieldIndex;
- (BOOL)exitRoutePlanningOnCancel;
- (BOOL)hasInputsInSearchField;
- (BOOL)isUsingExistingWaypointNameForAutocomplete;
- (BOOL)routeSearchController:(id)a3 waypointsIncludeObject:(id)a4;
- (BOOL)waypointsIncludeCurrentLocationForRouteSearchTableViewController:(id)a3;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RoutePlanningWaypointEditorViewController)fieldsViewController;
- (RouteSearchViewController)initWithDelegate:(id)a3 dataCoordinator:(id)a4;
- (RouteSearchViewController)initWithDelegate:(id)a3 items:(id)a4 waypointIndex:(unint64_t)a5 selectionHandler:(id)a6;
- (RouteSearchViewController)initWithWaypointEditor:(id)a3 suggestionsTableView:(id)a4 delegate:(id)a5 dataCoordinator:(id)a6;
- (RouteSearchViewControllerDelegate)delegate;
- (RouteWaypointSearchFieldView)searchFieldView;
- (RouteWaypointSearchFields)routeSearchFields;
- (RouteWaypointSuggestionsTableViewController)suggestionsTableViewController;
- (UIButton)closeButton;
- (UILabel)titleLabel;
- (id)_itemsForRouteRequest;
- (id)latLngForRouteSearchTableViewController:(id)a3;
- (id)latLngFromSearchFieldItem:(id)a3;
- (id)personalizedItemManagerForRouteSearchTableViewController:(id)a3;
- (id)selectedSearchFieldItem;
- (id)traitsForRouteSearchTableViewController:(id)a3;
- (id)userLocationSearchResultForRouteSearchTableViewController:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)searchFieldTypeForAnalytics;
- (unint64_t)_currentlySelectedIndexForAddStop;
- (void)_addSubViewsWithTextSearchSupport:(BOOL)a3;
- (void)_cancelTapped:(id)a3;
- (void)_cancelTapped:(id)a3 exitRoutePlanning:(BOOL)a4;
- (void)_cleanUpOnDismiss;
- (void)_initOfflinePlaceHolderWithTicket;
- (void)_requestRoute;
- (void)_requestRouteWithItems:(id)a3;
- (void)_selectFieldAtIndex:(unint64_t)a3;
- (void)_setupConstraints:(BOOL)a3;
- (void)_setupHeaderContentViewConstraints;
- (void)_updateTitle;
- (void)deleteCurrentFieldIndex;
- (void)didDismissByGesture;
- (void)didResignCurrent;
- (void)didTapOnQueryAcceleratorWithItem:(id)a3;
- (void)handleDismissAction:(id)a3;
- (void)makeAFieldFirstResponderIfNeeded;
- (void)replaceSelectedFieldWithItem:(id)a3;
- (void)routeSearch:(id)a3 didSearchForItem:(id)a4 previousSearchItem:(id)a5;
- (void)routeSearch:(id)a3 didUpdateInputText:(id)a4 atIndex:(unint64_t)a5;
- (void)routeSearchController:(id)a3 didSelectItem:(id)a4;
- (void)routeSearchController:(id)a3 doSearchItem:(id)a4 userInfo:(id)a5;
- (void)routeSearchFields:(id)a3 didClearInputTextForWaypointAtIndex:(unint64_t)waypointIndex;
- (void)routeSearchFieldsDidBeginEditing:(id)a3;
- (void)routeSearchFieldsDidUpdateItemsForRouteRequest:(id)a3;
- (void)selectFieldIndex:(unint64_t)a3;
- (void)setCloseButton:(id)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExitRoutePlanningOnCancel:(BOOL)a3;
- (void)setFieldsViewController:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setPauseSelectionUpdates:(BOOL)a3;
- (void)setSearchFieldView:(id)a3;
- (void)setSuggestionsTableViewController:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUsingExistingWaypointNameForAutocomplete:(BOOL)a3;
- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly;
- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly;
- (void)updateFieldsWithCurrentDirectionItem;
- (void)updateWithItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willBecomeCurrent:(BOOL)a3;
@end

@implementation RouteSearchViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RouteSearchViewController)initWithDelegate:(id)a3 dataCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RouteSearchViewController;
  v8 = [(RouteSearchViewController *)&v14 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [[RouteWaypointSuggestionsTableViewController alloc] initWithNibName:0 bundle:0];
    suggestionsTableViewController = v8->_suggestionsTableViewController;
    v8->_suggestionsTableViewController = v9;

    v11 = [(ContaineeViewController *)v8 cardPresentationController];
    [v11 setPresentedModally:1];

    v12 = [(ContaineeViewController *)v8 cardPresentationController];
    [v12 setTakesAvailableHeight:1];

    [(RouteSearchViewController *)v8 setExitRoutePlanningOnCancel:0];
    [(RouteSearchViewController *)v8 setDelegate:v6];
    [(RouteSearchViewController *)v8 setDataCoordinator:v7];
    [(RouteWaypointSuggestionsTableViewController *)v8->_suggestionsTableViewController setDelegate:v8];
  }

  return v8;
}

- (RouteSearchViewController)initWithDelegate:(id)a3 items:(id)a4 waypointIndex:(unint64_t)a5 selectionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = [(RouteSearchViewController *)self initWithDelegate:a3 dataCoordinator:0];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cachedItems, a4);
    v14->_waypointIndex = a5;
    id v15 = [v12 copy];
    id selectionHandler = v14->_selectionHandler;
    v14->_id selectionHandler = v15;
  }
  return v14;
}

- (RouteSearchViewController)initWithWaypointEditor:(id)a3 suggestionsTableView:(id)a4 delegate:(id)a5 dataCoordinator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RouteSearchViewController;
  id v15 = [(RouteSearchViewController *)&v18 init];
  if (v15)
  {
    v16 = +[MKLocationManager sharedLocationManager];
    v15->_wasLocationServicesApproved = [v16 isLocationServicesApproved];
    v15->_wasAuthorizedForPreciseLocation = [v16 isAuthorizedForPreciseLocation];
    objc_storeStrong((id *)&v15->_fieldsViewController, a3);
    [(RoutePlanningWaypointEditorViewController *)v15->_fieldsViewController setDelegate:v15];
    objc_storeStrong((id *)&v15->_suggestionsTableViewController, a4);
    [(RouteSearchViewController *)v15 setDelegate:v13];
    [(RouteSearchViewController *)v15 setDataCoordinator:v14];
    [(RouteWaypointSuggestionsTableViewController *)v15->_suggestionsTableViewController setDelegate:v15];
  }
  return v15;
}

- (RouteWaypointSearchFields)routeSearchFields
{
  fieldsViewController = self->_fieldsViewController;
  if (!fieldsViewController) {
    fieldsViewController = self->_searchFieldView;
  }
  return (RouteWaypointSearchFields *)fieldsViewController;
}

- (void)updateFieldsWithCurrentDirectionItem
{
  [(RouteSearchViewController *)self loadViewIfNeeded];
  v3 = [(RouteSearchViewController *)self dataCoordinator];
  id v5 = [v3 directionItemForCurrentSession];

  v4 = [v5 items];
  [(RouteSearchViewController *)self updateWithItems:v4];
}

- (void)updateWithItems:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteSearchViewController *)self fieldsViewController];
  [v5 setItems:v4];

  id v9 = [(RouteSearchViewController *)self suggestionsTableViewController];
  id v6 = [(RouteSearchViewController *)self fieldsViewController];
  id v7 = [v6 hasInput];
  v8 = [(RouteSearchViewController *)self fieldsViewController];
  [v9 updateDataSourceHasInput:v7 isEditing:[v8 isEditingAnySearchField]];
}

- (void)setHeaderTitle:(id)a3
{
  id v4 = a3;
  [(RouteSearchViewController *)self loadViewIfNeeded];
  id v5 = [(RouteSearchViewController *)self titleLabel];
  [v5 setText:v4];
}

- (void)selectFieldIndex:(unint64_t)a3
{
  id v5 = [(RouteSearchViewController *)self fieldsViewController];

  if (v5)
  {
    id v8 = [(RouteSearchViewController *)self fieldsViewController];
    [v8 selectFieldAtIndex:a3];
  }
  else
  {
    id v6 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v7 = [v6 isUsingOfflineMaps];

    if (v7)
    {
      self->_isWaitingForTextSearchSupport = 1;
      self->_editIndex = a3;
      self->_waypointIndex = a3;
    }
    else
    {
      [(RouteSearchViewController *)self _selectFieldAtIndex:a3];
    }
  }
}

- (void)_selectFieldAtIndex:(unint64_t)a3
{
  if (!self->_selectionHandler)
  {
    id v5 = [(RouteSearchViewController *)self dataCoordinator];
    id v6 = [v5 directionItemForCurrentSession];
    unsigned int v7 = [v6 items];
    cachedItems = self->_cachedItems;
    self->_cachedItems = v7;

    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = a3;
    }
    self->_unint64_t waypointIndex = v9;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
    a3 = 0;
    goto LABEL_15;
  }
  if (a3 == -1)
  {
    a3 = [(NSArray *)self->_cachedItems lastObject];
    v10 = 0;
    goto LABEL_15;
  }
  if ([(NSArray *)self->_cachedItems count] <= a3)
  {
    v10 = 0;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v10 = [(NSArray *)self->_cachedItems objectAtIndexedSubscript:a3];
  if (a3)
  {
LABEL_14:
    id v20 = v10;
    a3 = [(NSArray *)self->_cachedItems objectAtIndexedSubscript:a3 - 1];
    v10 = v20;
  }
LABEL_15:
  id v21 = v10;
  id v11 = [v10 waypointName];
  -[RouteSearchViewController setUsingExistingWaypointNameForAutocomplete:](self, "setUsingExistingWaypointNameForAutocomplete:", [v11 length] != 0);

  id v12 = [(RouteSearchViewController *)self searchFieldView];
  [v12 setSearchFieldItem:v21];

  id v13 = [(RouteSearchViewController *)self searchFieldView];
  [v13 setPreviousSearchFieldItem:a3];

  id v14 = [(RouteSearchViewController *)self searchFieldView];
  [v14 beginEditingNextSearchField];

  [(RouteSearchViewController *)self _updateTitle];
  unint64_t waypointIndex = self->_waypointIndex;
  BOOL v16 = waypointIndex == 0x7FFFFFFFFFFFFFFFLL || waypointIndex >= [(NSArray *)self->_cachedItems count];
  v17 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v18 = [v17 isUsingOfflineMaps];

  if (!v18 || self->_supportsFullTextSearch)
  {
    v19 = [(RouteSearchViewController *)self suggestionsTableViewController];
    [v19 updateTableViewHeader:v16];
  }
}

- (BOOL)canDeleteCurrentFieldIndex
{
  v2 = [(RouteSearchViewController *)self fieldsViewController];
  unsigned __int8 v3 = [v2 canDeleteCurrentFieldIndex];

  return v3;
}

- (void)deleteCurrentFieldIndex
{
  id v2 = [(RouteSearchViewController *)self fieldsViewController];
  [v2 deleteCurrentFieldIndex];
}

- (void)replaceSelectedFieldWithItem:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteSearchViewController *)self routeSearchFields];
  [v5 updateSearchFieldsFromIndex:0x7FFFFFFFFFFFFFFFLL withItem:v4];
}

- (void)setPauseSelectionUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RouteSearchViewController *)self fieldsViewController];
  [v4 setPauseSelectionUpdates:v3];
}

- (void)makeAFieldFirstResponderIfNeeded
{
  BOOL v3 = [(RouteSearchViewController *)self fieldsViewController];

  if (v3)
  {
    id v4 = [(RouteSearchViewController *)self fieldsViewController];
    id v5 = [v4 _currentlySelectedIndexForAddStop];

    id v6 = [(RouteSearchViewController *)self fieldsViewController];
    id v9 = v6;
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 selectFieldAtIndex:v5];
      goto LABEL_10;
    }
  }
  else
  {
    if (!self->_supportsFullTextSearch)
    {
      unsigned int v7 = +[MapsOfflineUIHelper sharedHelper];
      unsigned int v8 = [v7 isUsingOfflineMaps];

      if (v8)
      {
        id v9 = [(RouteSearchViewController *)self suggestionsTableViewController];
        [v9 updateCategoryDataSource:self->_supportsFullTextSearch];
        goto LABEL_10;
      }
    }
    id v6 = [(RouteSearchViewController *)self routeSearchFields];
    id v9 = v6;
  }
  [v6 beginEditingNextSearchField];
LABEL_10:
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  id v4 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [v4 reconfigureDataSources];
}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);

  [(RouteSearchViewController *)self updateFieldsWithCurrentDirectionItem];
}

- (unint64_t)_currentlySelectedIndexForAddStop
{
  BOOL v3 = [(RouteSearchViewController *)self fieldsViewController];

  if (v3)
  {
    id v4 = [(RouteSearchViewController *)self fieldsViewController];
    id v5 = [v4 _currentlySelectedIndexForAddStop];

    return (unint64_t)v5;
  }
  else if (self->_waypointIndex == -1)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    return self->_waypointIndex;
  }
}

- (id)latLngFromSearchFieldItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 latLng];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    [v3 address];
  }

  return v5;
}

- (id)selectedSearchFieldItem
{
  id v2 = [(RouteSearchViewController *)self searchFieldView];
  id v3 = [v2 searchFieldItem];

  return v3;
}

- (BOOL)hasInputsInSearchField
{
  id v2 = [(RouteSearchViewController *)self routeSearchFields];
  unsigned __int8 v3 = [v2 hasInput];

  return v3;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)RouteSearchViewController;
  [(ContaineeViewController *)&v24 viewDidLoad];
  unsigned __int8 v3 = [(RouteSearchViewController *)self fieldsViewController];

  if (!v3)
  {
    id v4 = [(ContaineeViewController *)self headerView];
    LODWORD(v5) = 1148846080;
    [v4 setContentHuggingPriority:1 forAxis:v5];

    id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    unsigned int v7 = +[UIFont _maps_boldSystemFontWithFixedSize:1 adaptiveFont:17.0];
    [v6 setFont:v7];

    LODWORD(v8) = 1148846080;
    [v6 setContentHuggingPriority:1 forAxis:v8];
    LODWORD(v9) = 1144750080;
    [v6 setContentCompressionResistancePriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [v6 setContentCompressionResistancePriority:1 forAxis:v10];
    id v11 = [(ContaineeViewController *)self headerView];
    [v11 addSubview:v6];

    [(RouteSearchViewController *)self setTitleLabel:v6];
    id v12 = +[UIButton buttonWithType:1];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = +[UIFont _maps_systemFontWithFixedSize:1 adaptiveFont:17.0];
    id v14 = [v12 titleLabel];
    [v14 setFont:v13];

    id v15 = sub_100AEBD5C();
    [v12 setTitle:v15 forState:0];

    [v12 addTarget:self action:"_cancelTapped:" forControlEvents:64];
    LODWORD(v16) = 1148846080;
    [v12 setContentHuggingPriority:1 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [v12 setContentHuggingPriority:0 forAxis:v17];
    unsigned int v18 = [(ContaineeViewController *)self headerView];
    [v18 addSubview:v12];

    [(RouteSearchViewController *)self setCloseButton:v12];
    [(RouteSearchViewController *)self _setupHeaderContentViewConstraints];
    [(RouteSearchViewController *)self _updateTitle];
    v19 = +[MapsOfflineUIHelper sharedHelper];
    LODWORD(v14) = [v19 isUsingOfflineMaps];

    if (v14) {
      [(RouteSearchViewController *)self _initOfflinePlaceHolderWithTicket];
    }
    else {
      [(RouteSearchViewController *)self _addSubViewsWithTextSearchSupport:1];
    }
    id v20 = [(RouteSearchViewController *)self view];
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = [v22 stringByReplacingOccurrencesOfString:@"Controller" withString:&stru_101324E70];
    [v20 setAccessibilityIdentifier:v23];

    +[KeyboardAvoidingView startObservingKeyboard];
  }
}

- (void)_addSubViewsWithTextSearchSupport:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    double v5 = [[RouteWaypointSearchFieldView alloc] initWithDelegate:self];
    searchFieldView = self->_searchFieldView;
    self->_searchFieldView = v5;

    [(RouteWaypointSearchFieldView *)self->_searchFieldView setTranslatesAutoresizingMaskIntoConstraints:0];
    unsigned int v7 = [(ContaineeViewController *)self contentView];
    [v7 addSubview:self->_searchFieldView];
  }
  double v8 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [(RouteSearchViewController *)self addChildViewController:v8];

  double v9 = [(RouteSearchViewController *)self suggestionsTableViewController];
  double v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(ContaineeViewController *)self contentView];
  id v12 = [(RouteSearchViewController *)self suggestionsTableViewController];
  id v13 = [v12 view];
  [v11 addSubview:v13];

  id v14 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [v14 didMoveToParentViewController:self];

  id v15 = +[MapsOfflineUIHelper sharedHelper];
  LODWORD(v12) = [v15 isUsingOfflineMaps];

  if (v12 && !v3)
  {
    double v16 = [(RouteSearchViewController *)self routeSearchFields];
    [v16 endEditingFields];
  }

  [(RouteSearchViewController *)self _setupConstraints:v3];
}

- (void)setTitle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RouteSearchViewController;
  id v4 = a3;
  [(RouteSearchViewController *)&v6 setTitle:v4];
  double v5 = [(RouteSearchViewController *)self titleLabel];
  [v5 setText:v4];
}

- (void)_updateTitle
{
  BOOL v3 = [(RouteSearchViewController *)self title];
  id v4 = [v3 length];

  if (v4)
  {
    id v10 = [(RouteSearchViewController *)self title];
    double v5 = [(RouteSearchViewController *)self titleLabel];
    [v5 setText:v10];
  }
  else
  {
    unint64_t waypointIndex = self->_waypointIndex;
    if (waypointIndex == 0x7FFFFFFFFFFFFFFFLL || waypointIndex >= [(NSArray *)self->_cachedItems count])
    {
      unsigned int v7 = +[NSBundle mainBundle];
      CFStringRef v8 = @"Add Stop";
    }
    else
    {
      unsigned int v7 = +[NSBundle mainBundle];
      CFStringRef v8 = @"Change Stop";
    }
    id v10 = v7;
    double v5 = [v7 localizedStringForKey:v8 value:@"localized string not found" table:0];
    double v9 = [(RouteSearchViewController *)self titleLabel];
    [v9 setText:v5];
  }
}

- (void)handleDismissAction:(id)a3
{
}

- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly
{
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
}

- (void)didDismissByGesture
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100DAE908;
  v2[3] = &unk_1012E6300;
  v2[4] = self;
  unsigned __int8 v3 = [(RouteSearchViewController *)self exitRoutePlanningOnCancel];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

- (void)_setupHeaderContentViewConstraints
{
  id v34 = objc_alloc((Class)NSMutableArray);
  v56 = [(RouteSearchViewController *)self closeButton];
  v54 = [v56 topAnchor];
  v55 = [(ContaineeViewController *)self headerView];
  v53 = [v55 topAnchor];
  v52 = [v54 constraintGreaterThanOrEqualToAnchor:v53 constant:16.0];
  v57[0] = v52;
  v51 = [(RouteSearchViewController *)self closeButton];
  v49 = [v51 centerYAnchor];
  v50 = [(ContaineeViewController *)self headerView];
  v48 = [v50 centerYAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v57[1] = v47;
  v46 = [(ContaineeViewController *)self headerView];
  v44 = [v46 bottomAnchor];
  v45 = [(RouteSearchViewController *)self closeButton];
  v43 = [v45 bottomAnchor];
  v42 = [v44 constraintGreaterThanOrEqualToAnchor:v43 constant:16.0];
  v57[2] = v42;
  v41 = [(RouteSearchViewController *)self closeButton];
  v39 = [v41 leadingAnchor];
  v40 = [(ContaineeViewController *)self headerView];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:16.0];
  v57[3] = v37;
  v36 = [(RouteSearchViewController *)self titleLabel];
  v32 = [v36 topAnchor];
  v33 = [(ContaineeViewController *)self headerView];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:16.0];
  v57[4] = v30;
  v29 = [(RouteSearchViewController *)self titleLabel];
  v27 = [v29 centerYAnchor];
  v28 = [(ContaineeViewController *)self headerView];
  v26 = [v28 centerYAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v57[5] = v25;
  objc_super v24 = [(ContaineeViewController *)self headerView];
  v22 = [v24 bottomAnchor];
  v23 = [(RouteSearchViewController *)self titleLabel];
  id v21 = [v23 bottomAnchor];
  id v20 = [v22 constraintEqualToAnchor:v21 constant:16.0];
  v57[6] = v20;
  v19 = [(RouteSearchViewController *)self titleLabel];
  double v17 = [v19 leadingAnchor];
  unsigned int v18 = [(RouteSearchViewController *)self closeButton];
  double v16 = [v18 trailingAnchor];
  id v15 = [v17 constraintGreaterThanOrEqualToAnchor:v16 constant:4.0];
  v57[7] = v15;
  id v14 = [(RouteSearchViewController *)self titleLabel];
  unsigned __int8 v3 = [v14 centerXAnchor];
  id v4 = [(ContaineeViewController *)self headerView];
  double v5 = [v4 centerXAnchor];
  LODWORD(v6) = 1144750080;
  unsigned int v7 = [v3 constraintEqualToAnchor:v5 constant:0.0 priority:v6];
  v57[8] = v7;
  CFStringRef v8 = [(ContaineeViewController *)self headerView];
  double v9 = [v8 trailingAnchor];
  id v10 = [(RouteSearchViewController *)self titleLabel];
  id v11 = [v10 trailingAnchor];
  id v12 = [v9 constraintGreaterThanOrEqualToAnchor:v11 constant:16.0];
  v57[9] = v12;
  id v13 = +[NSArray arrayWithObjects:v57 count:10];
  id v35 = [v34 initWithArray:v13];

  +[NSLayoutConstraint activateConstraints:v35];
}

- (void)_setupConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(RouteSearchViewController *)self fieldsViewController];

  if (!v5)
  {
    id v46 = objc_alloc_init((Class)NSMutableArray);
    if (v3)
    {
      v42 = [(RouteWaypointSearchFieldView *)self->_searchFieldView leadingAnchor];
      v44 = [(ContaineeViewController *)self contentView];
      v40 = [v44 leadingAnchor];
      v38 = [v42 constraintEqualToAnchor:v40];
      v48[0] = v38;
      v36 = [(RouteWaypointSearchFieldView *)self->_searchFieldView trailingAnchor];
      double v6 = [(ContaineeViewController *)self contentView];
      unsigned int v7 = [v6 trailingAnchor];
      CFStringRef v8 = [v36 constraintEqualToAnchor:v7];
      v48[1] = v8;
      double v9 = [(RouteWaypointSearchFieldView *)self->_searchFieldView topAnchor];
      id v10 = [(ContaineeViewController *)self contentView];
      id v11 = [v10 topAnchor];
      id v12 = [v9 constraintEqualToAnchor:v11];
      v48[2] = v12;
      id v13 = +[NSArray arrayWithObjects:v48 count:3];
      [v46 addObjectsFromArray:v13];

      id v14 = GEOResultRefinementSort_ptr;
      uint64_t v15 = [(RouteWaypointSearchFieldView *)self->_searchFieldView bottomAnchor];
    }
    else
    {
      double v16 = [(RouteSearchViewController *)self titleLabel];
      uint64_t v15 = [v16 bottomAnchor];

      id v14 = GEOResultRefinementSort_ptr;
    }
    v32 = (void *)v15;
    v45 = [(RouteSearchViewController *)self suggestionsTableViewController];
    v43 = [v45 view];
    v39 = [v43 leadingAnchor];
    v41 = [(ContaineeViewController *)self contentView];
    v37 = [v41 leadingAnchor];
    id v35 = [v39 constraintEqualToAnchor:v37];
    v47[0] = v35;
    id v34 = [(RouteSearchViewController *)self suggestionsTableViewController];
    v33 = [v34 view];
    v30 = [v33 trailingAnchor];
    v31 = [(ContaineeViewController *)self contentView];
    v29 = [v31 trailingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v47[1] = v28;
    v27 = [(RouteSearchViewController *)self suggestionsTableViewController];
    v26 = [v27 view];
    double v17 = [v26 topAnchor];
    unsigned int v18 = [v17 constraintEqualToAnchor:v15 constant:16.0];
    v47[2] = v18;
    v19 = [(RouteSearchViewController *)self suggestionsTableViewController];
    id v20 = [v19 view];
    id v21 = [v20 bottomAnchor];
    v22 = [(ContaineeViewController *)self contentView];
    v23 = [v22 bottomAnchor];
    objc_super v24 = [v21 constraintEqualToAnchor:v23];
    v47[3] = v24;
    v25 = [v14[501] arrayWithObjects:v47 count:4];
    [v46 addObjectsFromArray:v25];

    +[NSLayoutConstraint activateConstraints:v46];
  }
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RouteSearchViewController;
  [(ContaineeViewController *)&v11 willBecomeCurrent:a3];
  [(RouteSearchViewController *)self loadViewIfNeeded];
  id v4 = [(RouteSearchViewController *)self dataCoordinator];
  uint64_t v5 = 0;
  switch((unint64_t)[v4 desiredTransportType])
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v5 = 1;
      break;
    case 1uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      goto LABEL_8;
    case 2uLL:
LABEL_5:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_8;
    case 5uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_8:
      uint64_t v5 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  unsigned int v7 = [(RouteSearchViewController *)self fieldsViewController];
  [v7 setMprEnabled:v5];

  CFStringRef v8 = [(RouteSearchViewController *)self fieldsViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(RouteSearchViewController *)self fieldsViewController];
    [v10 willBecomeCurrent];
  }
}

- (void)didResignCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)RouteSearchViewController;
  [(ContaineeViewController *)&v3 didResignCurrent];
  [(RouteSearchViewController *)self _cleanUpOnDismiss];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RouteSearchViewController;
  [(RouteSearchViewController *)&v4 viewDidAppear:a3];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"RouteSearchViewControllerDidAppear" object:0];
}

- (void)_cleanUpOnDismiss
{
  objc_super v3 = [(RouteSearchViewController *)self routeSearchFields];
  [v3 clear];

  [(RouteSearchViewController *)self setExitRoutePlanningOnCancel:0];
}

- (id)_itemsForRouteRequest
{
  objc_super v3 = [(RouteSearchViewController *)self fieldsViewController];

  objc_super v4 = [(RouteSearchViewController *)self routeSearchFields];
  uint64_t v5 = [v4 itemsForRouteRequest];
  id v6 = v5;
  if (v3)
  {
    unsigned int v7 = v4;
  }
  else
  {
    unsigned int v7 = [v5 firstObject];

    CFStringRef v8 = [(RouteSearchViewController *)self dataCoordinator];
    char v9 = [v8 directionItemForCurrentSession];
    id v10 = [v9 items];
    id v6 = [v10 mutableCopy];

    unint64_t waypointIndex = self->_waypointIndex;
    if (waypointIndex >= (unint64_t)[v6 count]) {
      [v6 addObject:v7];
    }
    else {
      [v6 replaceObjectAtIndex:self->_waypointIndex withObject:v7];
    }
  }

  return v6;
}

- (BOOL)_isReadyToRoute
{
  [(RouteSearchViewController *)self _itemsForRouteRequest];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) waypoint:v11];
        unsigned int v8 = [v7 isValid];

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)_requestRoute
{
  id v3 = [(RouteSearchViewController *)self _itemsForRouteRequest];
  [(RouteSearchViewController *)self _requestRouteWithItems:v3];
}

- (void)_requestRouteWithItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RouteSearchViewController *)self routeSearchFields];
  [v5 endEditingFields];

  id v6 = [(RouteSearchViewController *)self suggestionsTableViewController];
  unsigned int v7 = [(RouteSearchViewController *)self routeSearchFields];
  [v6 updateDataSourceHasInput:0 isEditing:[v7 isEditingAnySearchField]];

  unsigned int v8 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [v8 reloadData];

  BOOL v9 = +[MKMapService sharedService];
  [v9 captureUserAction:6003 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v10 = [(RouteSearchViewController *)self dataCoordinator];
  id v11 = [v10 desiredTransportType];

  long long v12 = [(RouteSearchViewController *)self delegate];
  long long v13 = [v12 currentDirectionItemForRouteSearchViewController:self];

  if (!v11)
  {
    if ([v13 editRequired:0]) {
      id v11 = [v13 transportType];
    }
    else {
      id v11 = 0;
    }
  }
  BOOL v14 = self->_wasLocationServicesApproved && self->_wasAuthorizedForPreciseLocation;
  uint64_t v15 = [[DirectionItem alloc] initWithItems:v4 ignoreMapType:v14 transportType:v11];

  double v16 = [(RouteSearchViewController *)self dataCoordinator];

  if (v16)
  {
    double v17 = [(RouteSearchViewController *)self dataCoordinator];
    unsigned int v18 = [v17 drivePreferences];
    [(DirectionItem *)v15 setDrivePreferences:v18];

    v19 = [(RouteSearchViewController *)self dataCoordinator];
    id v20 = [v19 transitPreferences];
    [(DirectionItem *)v15 setTransitPreferences:v20];

    id v21 = [(RouteSearchViewController *)self dataCoordinator];
    v22 = [v21 cyclePreferences];
    [(DirectionItem *)v15 setCyclePreferences:v22];

    v23 = [(RouteSearchViewController *)self dataCoordinator];
    objc_super v24 = [v23 timing];
    [(DirectionItem *)v15 setTiming:v24];
  }
  id v25 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v36 = @"DirectionsSessionInitiatorKey";
  v37 = &off_1013ABA58;
  v26 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  id v27 = [v25 initWithDictionary:v26];

  v28 = [(RouteSearchViewController *)self dataCoordinator];
  v29 = [v28 originalHistoryEntryIdentifier];
  [v27 setObject:v29 forKeyedSubscript:@"DirectionsRouteUUIDKey"];

  v30 = [(RouteSearchViewController *)self dataCoordinator];
  v31 = [v30 automaticSharingContacts];
  [v27 setObject:v31 forKeyedSubscript:@"DirectionsPreviousContactsForTripSharing"];

  v32 = [(RouteSearchViewController *)self routeSearchFields];
  LODWORD(v31) = [v32 hasInput];

  if (v31) {
    v33 = &off_1013ABA70;
  }
  else {
    v33 = &off_1013ABA88;
  }
  [v27 setObject:v33 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
  id v34 = [(RouteSearchViewController *)self delegate];
  id v35 = [v27 copy];
  [v34 routeSearchViewController:self wantsToRequestRoutesWithItem:v15 allowToPromptEditing:1 userInfo:v35];
}

- (void)routeSearchFieldsDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v7 = [(RouteSearchViewController *)self suggestionsTableViewController];
  id v5 = [v4 hasInput];
  id v6 = [v4 isEditingAnySearchField];

  [v7 updateDataSourceHasInput:v5 isEditing:v6];
}

- (void)routeSearchFieldsDidUpdateItemsForRouteRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [v5 reset];

  if (self->_selectionHandler)
  {
    id v6 = [v4 itemsForRouteRequest];
    id v7 = [v6 firstObject];

    (*((void (**)(void))self->_selectionHandler + 2))();
    goto LABEL_3;
  }
  if (sub_1000BBB44(self) == 5)
  {
    if (![(RouteSearchViewController *)self _isReadyToRoute]) {
      goto LABEL_3;
    }
LABEL_9:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100DAFDAC;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    goto LABEL_3;
  }
  uint64_t v8 = [(RouteSearchViewController *)self searchFieldView];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    unsigned __int8 v10 = [(RouteSearchViewController *)self _isReadyToRoute];

    if (v10) {
      goto LABEL_9;
    }
  }
LABEL_3:
}

- (void)routeSearch:(id)a3 didUpdateInputText:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = [(RouteSearchViewController *)self suggestionsTableViewController];
  BOOL v11 = [v8 length] != 0;
  id v12 = [v9 isEditingAnySearchField];

  [v10 updateDataSourceHasInput:v11 isEditing:v12];
  long long v13 = [(RouteSearchViewController *)self suggestionsTableViewController];
  BOOL v14 = [(RouteSearchViewController *)self traitsForRouteSearchTableViewController:v13];

  uint64_t v15 = [(RouteSearchViewController *)self fieldsViewController];

  if (v15)
  {
    double v16 = [(RouteSearchViewController *)self _itemsForRouteRequest];
    double v17 = v16;
    if (a5)
    {
      if ((unint64_t)[v16 count] > a5)
      {
        unsigned int v18 = [v17 objectAtIndex:a5 - 1];
        v19 = [(RouteSearchViewController *)self fieldsViewController];
        id v20 = [v19 items];
        id v21 = [v20 objectAtIndex:a5];

        unint64_t waypointIndex = 1;
        goto LABEL_6;
      }
      unint64_t waypointIndex = 1;
    }
    else
    {
      unint64_t waypointIndex = 0;
    }

    unsigned int v18 = 0;
    id v21 = 0;
    goto LABEL_19;
  }
  unint64_t waypointIndex = self->_waypointIndex;
  v23 = [(RouteSearchViewController *)self searchFieldView];
  unsigned int v18 = [v23 previousSearchFieldItem];

  double v17 = [(RouteSearchViewController *)self searchFieldView];
  id v21 = [v17 searchFieldItem];
LABEL_6:

  if (v18)
  {
    objc_super v24 = [(RouteSearchViewController *)self latLngFromSearchFieldItem:v18];
    [v24 lat];
    double v26 = v25;
    [v24 lng];
    if (v27 < -180.0 || v27 > 180.0 || v26 < -90.0 || v26 > 90.0)
    {
      v28 = sub_1005768D4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v32 = 138412290;
        v33 = v18;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Previous location in Route Planning has invalid coordinate. SearchFieldItem: %@", (uint8_t *)&v32, 0xCu);
      }
    }
    else
    {
      [v14 setAutocompleteOriginationPreviousLatlng:v24];
    }
  }
LABEL_19:
  v29 = [v21 composedWaypoint];
  [v14 setAutocompleteOriginationEditingServerWaypoints:[v29 isServerProvidedWaypoint]];

  [(RouteSearchViewController *)self setUsingExistingWaypointNameForAutocomplete:0];
  if (waypointIndex) {
    uint64_t v30 = 14;
  }
  else {
    uint64_t v30 = 13;
  }
  v31 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [v31 updateInputText:v8 traits:v14 source:v30];
}

- (void)routeSearch:(id)a3 didSearchForItem:(id)a4 previousSearchItem:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(RouteSearchViewController *)self fieldsViewController];
  if (v9)
  {
    id v10 = v7;
  }
  else
  {
    BOOL v11 = [(RouteSearchViewController *)self searchFieldView];
    id v10 = [v11 searchFieldItem];
  }
  v20[0] = @"kAddStopFromWaypointEditor";
  v20[1] = @"IsServerProvidedWaypoint";
  v21[0] = &__kCFBooleanTrue;
  id v12 = [v10 composedWaypoint];
  long long v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isServerProvidedWaypoint]);
  v21[1] = v13;
  BOOL v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v15 = +[NSMutableDictionary dictionaryWithDictionary:v14];

  double v16 = [(RouteSearchViewController *)self latLngFromSearchFieldItem:v8];

  if (v8 && v16) {
    [v15 setObject:v16 forKeyedSubscript:@"kAddStopPreviousLocationLatLng"];
  }
  double v17 = +[MKMapService sharedService];
  [v17 captureUserAction:2014 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  unsigned int v18 = [(RouteSearchViewController *)self delegate];
  id v19 = [v15 copy];
  [v18 routeSearchViewController:self wantsToPerformSearchWithItem:v7 userInfo:v19];
}

- (void)routeSearchFields:(id)a3 didClearInputTextForWaypointAtIndex:(unint64_t)waypointIndex
{
  id v11 = a3;
  if (waypointIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(RouteSearchViewController *)self fieldsViewController];
    if (v6)
    {

      unint64_t waypointIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (self->_waypointIndex == -1)
    {
      unint64_t waypointIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t waypointIndex = self->_waypointIndex;
    }
  }
  id v7 = +[MKMapService sharedService];
  uint64_t v8 = [(RouteSearchViewController *)self currentUITargetForAnalytics];
  if ((~waypointIndex & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:waypointIndex];
    id v10 = [v9 stringValue];
    [v7 captureUserAction:278 onTarget:v8 eventValue:v10];
  }
  else
  {
    [v7 captureUserAction:278 onTarget:v8 eventValue:0];
  }
}

- (id)personalizedItemManagerForRouteSearchTableViewController:(id)a3
{
  id v4 = [(RouteSearchViewController *)self delegate];
  id v5 = [v4 personalizedItemManagerForRouteSearchViewController:self];

  return v5;
}

- (id)userLocationSearchResultForRouteSearchTableViewController:(id)a3
{
  id v4 = [(RouteSearchViewController *)self delegate];
  id v5 = [v4 userLocationSearchResultForRouteSearchViewController:self];

  return v5;
}

- (id)latLngForRouteSearchTableViewController:(id)a3
{
  id v4 = [(RouteSearchViewController *)self fieldsViewController];

  if (!v4)
  {
    id v12 = [(RouteSearchViewController *)self searchFieldView];
    long long v13 = [v12 previousSearchFieldItem];
    id v7 = [(RouteSearchViewController *)self latLngFromSearchFieldItem:v13];

LABEL_9:
    id v7 = v7;
    id v11 = v7;
    goto LABEL_10;
  }
  id v5 = [(RouteSearchViewController *)self fieldsViewController];
  id v6 = (char *)[v5 _currentlySelectedIndexForAddStop];

  id v7 = 0;
  if (v6 && v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(RouteSearchViewController *)self fieldsViewController];
    id v9 = [v8 items];

    id v10 = [v9 objectAtIndexedSubscript:v6 - 1];
    id v7 = [v10 latLng];
  }
  id v11 = 0;
  if (v6 && v6 != (char *)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)traitsForRouteSearchTableViewController:(id)a3
{
  id v4 = [(RouteSearchViewController *)self delegate];
  id v5 = [v4 traitsForRouteSearchViewController:self];

  if (MapsFeature_IsEnabled_HikingiOS())
  {
    uint64_t v6 = 35;
  }
  else if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    uint64_t v6 = 31;
  }
  else
  {
    uint64_t v6 = 28;
  }
  [v5 setPlaceSummaryRevision:v6];
  [v5 addSupportedPlaceSummaryFormatType:1];
  [v5 addSupportedPlaceSummaryFormatType:2];
  [v5 addSupportedPlaceSummaryFormatType:3];
  [v5 setSupportClientRankingFeatureMetadata:1];
  [v5 setSupportClientRankingCompositeFeatures:1];
  [v5 setIsRoutePlanningEditStopFillRequest:[self isUsingExistingWaypointNameForAutocomplete]];
  [v5 addSupportedAutocompleteListType:2];

  return v5;
}

- (BOOL)routeSearchController:(id)a3 waypointsIncludeObject:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(RouteSearchViewController *)self routeSearchFields];
  unsigned __int8 v7 = [v6 containsWaypointForItem:v5];

  return v7;
}

- (BOOL)waypointsIncludeCurrentLocationForRouteSearchTableViewController:(id)a3
{
  id v3 = [(RouteSearchViewController *)self routeSearchFields];
  unsigned __int8 v4 = [v3 containsCurrentLocationItem];

  return v4;
}

- (void)routeSearchController:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[SearchFieldItem searchFieldItemWithObject:v5 expandRecentsItem:1 preserveContact:1];
  if (v6)
  {
    unsigned __int8 v7 = [(RouteSearchViewController *)self routeSearchFields];
    [v7 updateSearchFieldsFromIndex:0x7FFFFFFFFFFFFFFFLL withItem:v6];
  }
  else
  {
    objc_opt_class();
    id v8 = v5;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 historyEntry];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100DB08EC;
    v13[3] = &unk_101323FC0;
    v13[4] = self;
    [v11 ifSearch:0 ifRoute:v13 ifPlaceDisplay:0 ifTransitLineItem:0];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = +[MKMapService sharedService];
      [v12 captureUserAction:2025 onTarget:[self currentUITargetForAnalytics] eventValue:0];
    }
  }
}

- (void)routeSearchController:(id)a3 doSearchItem:(id)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(RouteSearchViewController *)self suggestionsTableViewController];
  [v9 reset];

  id v10 = [(RouteSearchViewController *)self delegate];
  [v10 routeSearchViewController:self wantsToPerformSearchWithItem:v8 userInfo:v7];
}

- (void)didTapOnQueryAcceleratorWithItem:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteSearchViewController *)self searchFieldView];
  [v5 shouldReplaceTextWithCompletion:v4];
}

- (void)_cancelTapped:(id)a3
{
  id v4 = a3;
  [(RouteSearchViewController *)self _cancelTapped:v4 exitRoutePlanning:[(RouteSearchViewController *)self exitRoutePlanningOnCancel]];
}

- (void)_cancelTapped:(id)a3 exitRoutePlanning:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = +[MKMapService sharedService];
  [v6 captureUserAction:18 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v7 = [(RouteSearchViewController *)self routeSearchFields];
  [v7 endEditingFields];

  id selectionHandler = self->_selectionHandler;
  if (selectionHandler)
  {
    id v9 = (void (*)(void))*((void *)selectionHandler + 2);
    v9();
  }
  else
  {
    id v10 = [(RouteSearchViewController *)self delegate];
    [v10 routeSearchViewControllerDidDismiss:self shouldExitRoutePlanning:v4];
  }
}

- (int)currentUITargetForAnalytics
{
  return 607;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (int)searchFieldTypeForAnalytics
{
  id v3 = [(RouteSearchViewController *)self fieldsViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 2;
  }
  id v5 = [(RouteSearchViewController *)self fieldsViewController];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 searchFieldTypeForAnalytics];
  }
  else {
    int v6 = 2;
  }

  return v6;
}

- (void)_initOfflinePlaceHolderWithTicket
{
  objc_initWeak(&location, self);
  offlineTextSearchSupportQueue = self->_offlineTextSearchSupportQueue;
  if (!offlineTextSearchSupportQueue)
  {
    unsigned int v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.text.search.support.queue", v4);
    int v6 = self->_offlineTextSearchSupportQueue;
    self->_offlineTextSearchSupportQueue = v5;

    offlineTextSearchSupportQueue = self->_offlineTextSearchSupportQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100DB0D58;
  block[3] = &unk_1012E7ED0;
  block[4] = self;
  objc_copyWeak(&v8, &location);
  dispatch_async(offlineTextSearchSupportQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (RouteSearchViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteSearchViewControllerDelegate *)WeakRetained;
}

- (BOOL)exitRoutePlanningOnCancel
{
  return self->_exitRoutePlanningOnCancel;
}

- (void)setExitRoutePlanningOnCancel:(BOOL)a3
{
  self->_exitRoutePlanningOnCancel = a3;
}

- (BOOL)isUsingExistingWaypointNameForAutocomplete
{
  return self->_usingExistingWaypointNameForAutocomplete;
}

- (void)setUsingExistingWaypointNameForAutocomplete:(BOOL)a3
{
  self->_usingExistingWaypointNameForAutocomplete = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (RouteWaypointSuggestionsTableViewController)suggestionsTableViewController
{
  return self->_suggestionsTableViewController;
}

- (void)setSuggestionsTableViewController:(id)a3
{
}

- (RouteWaypointSearchFieldView)searchFieldView
{
  return self->_searchFieldView;
}

- (void)setSearchFieldView:(id)a3
{
}

- (RoutePlanningWaypointEditorViewController)fieldsViewController
{
  return self->_fieldsViewController;
}

- (void)setFieldsViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldsViewController, 0);
  objc_storeStrong((id *)&self->_searchFieldView, 0);
  objc_storeStrong((id *)&self->_suggestionsTableViewController, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_offlineTextSearchSupportQueue, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_cachedItems, 0);

  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
}

@end