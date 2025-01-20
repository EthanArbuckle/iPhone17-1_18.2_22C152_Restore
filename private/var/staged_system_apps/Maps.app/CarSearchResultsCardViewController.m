@interface CarSearchResultsCardViewController
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (CarSearchResultsCardDelegate)delegate;
- (CarSearchResultsCardViewController)initWithSearchResults:(id)a3 cellStyle:(int64_t)a4 delegate:(id)a5;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSArray)searchResults;
- (id)_errorString;
- (id)_loadingString;
- (id)_noResultsString;
- (id)itemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_searchResultsStateForCurrentSession;
- (void)_captureAnalytics;
- (void)_reloadViewsAnimated:(BOOL)a3;
- (void)reloadSearchStateAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CarSearchResultsCardViewController

- (CarSearchResultsCardViewController)initWithSearchResults:(id)a3 cellStyle:(int64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CarSearchResultsCardViewController;
  v11 = [(CarBaseSearchViewController *)&v14 initWithDisabledETAUpdates:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_searchResults, a3);
    v12->_cellStyle = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)CarSearchResultsCardViewController;
  [(CarSearchResultsCardViewController *)&v37 viewDidLoad];
  v3 = [(CarSearchResultsCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarSearchResultsCard"];

  v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  loadingIndicatorView = self->_loadingIndicatorView;
  self->_loadingIndicatorView = v4;

  [(UIActivityIndicatorView *)self->_loadingIndicatorView setAccessibilityIdentifier:@"CarSearchResultsCardLoadingIndicator"];
  [(UIActivityIndicatorView *)self->_loadingIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v10;

  [(UILabel *)self->_loadingLabel setAccessibilityIdentifier:@"CarSearchResultsCardLoadingLabel"];
  [(UILabel *)self->_loadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1148829696;
  [(UILabel *)self->_loadingLabel setContentCompressionResistancePriority:0 forAxis:v12];
  v13 = +[UIColor _carSystemSecondaryColor];
  [(UILabel *)self->_loadingLabel setTextColor:v13];

  [(UILabel *)self->_loadingLabel setNumberOfLines:0];
  objc_super v14 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
  [(UILabel *)self->_loadingLabel setFont:v14];

  [(UILabel *)self->_loadingLabel setTextAlignment:1];
  id v15 = objc_alloc((Class)UIStackView);
  v16 = self->_loadingLabel;
  v38[0] = self->_loadingIndicatorView;
  v38[1] = v16;
  v17 = +[NSArray arrayWithObjects:v38 count:2];
  v18 = (UIStackView *)[v15 initWithArrangedSubviews:v17];
  loadingStackView = self->_loadingStackView;
  self->_loadingStackView = v18;

  [(UIStackView *)self->_loadingStackView setAccessibilityIdentifier:@"CarSearchResultsCardLoadingStackView"];
  [(UIStackView *)self->_loadingStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_loadingStackView setAxis:1];
  [(UIStackView *)self->_loadingStackView setSpacing:4.0];
  v20 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  errorLabel = self->_errorLabel;
  self->_errorLabel = v20;

  [(UILabel *)self->_errorLabel setAccessibilityIdentifier:@"CarSearchResultsCardErrorLabel"];
  [(UILabel *)self->_errorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v22) = 1148829696;
  [(UILabel *)self->_errorLabel setContentCompressionResistancePriority:0 forAxis:v22];
  v23 = +[UIColor _carSystemSecondaryColor];
  [(UILabel *)self->_errorLabel setTextColor:v23];

  [(UILabel *)self->_errorLabel setNumberOfLines:0];
  v24 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
  [(UILabel *)self->_errorLabel setFont:v24];

  [(UILabel *)self->_errorLabel setTextAlignment:1];
  v25 = objc_alloc_init(CarTableView);
  [(CarBaseSearchViewController *)self setTableView:v25];

  v26 = [(CarBaseSearchViewController *)self tableView];
  [v26 setAccessibilityIdentifier:@"CarSearchResultsCardTableView"];

  v27 = [(CarBaseSearchViewController *)self tableView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = +[UIColor clearColor];
  v29 = [(CarBaseSearchViewController *)self tableView];
  [v29 setBackgroundColor:v28];

  v30 = [(CarBaseSearchViewController *)self tableView];
  uint64_t v31 = objc_opt_class();
  v32 = +[CarSearchItemCell reuseIdentifier];
  [v30 registerClass:v31 forCellReuseIdentifier:v32];

  v33 = [(CarSearchResultsCardViewController *)self view];
  v34 = [(CarBaseSearchViewController *)self tableView];
  [v33 addSubview:v34];

  v35 = [(CarBaseSearchViewController *)self tableView];
  [v35 setDataSource:self];

  v36 = [(CarBaseSearchViewController *)self tableView];
  [v36 setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarSearchResultsCardViewController;
  [(CarBaseSearchViewController *)&v4 viewWillAppear:a3];
  [(CarSearchResultsCardViewController *)self _reloadViewsAnimated:0];
}

- (void)setSearchResults:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_searchResults != v5)
  {
    objc_storeStrong((id *)&self->_searchResults, a3);
    [(CarBaseSearchViewController *)self prepareQuickRouteETAs];
    id v6 = [(CarBaseSearchViewController *)self tableView];
    [v6 reloadData];

    [(CarBaseSearchViewController *)self continueQuickRouteETAs];
    [(CarSearchResultsCardViewController *)self reloadSearchStateAnimated:1];
    [(CarSearchResultsCardViewController *)self _captureAnalytics];
    if (self->_state == 1)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100BF86B0;
      block[3] = &unk_1012E6690;
      objc_copyWeak(&v9, &location);
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(CarSearchResultsCardViewController *)self _reloadViewsAnimated:a4];
  }
}

- (void)reloadSearchStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CarSearchResultsCardViewController *)self _searchResultsStateForCurrentSession];

  [(CarSearchResultsCardViewController *)self setState:v5 animated:v3];
}

- (unint64_t)_searchResultsStateForCurrentSession
{
  BOOL v3 = [(CarSearchResultsCardViewController *)self delegate];
  objc_super v4 = [v3 searchSession];

  if (v4)
  {
    if ([v4 isLoading])
    {
      unint64_t v5 = 0;
    }
    else
    {
      dispatch_time_t v7 = [v4 lastError];

      if (v7)
      {
        unint64_t v5 = 3;
      }
      else
      {
        v8 = [v4 currentResults];
        if ([v8 count]) {
          unint64_t v5 = 1;
        }
        else {
          unint64_t v5 = 2;
        }
      }
    }
    id v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      unint64_t v11 = v5;
      goto LABEL_17;
    }
  }
  else
  {
    if ([(NSArray *)self->_searchResults count]) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = 2;
    }
    id v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      unint64_t v11 = v5;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SearchResultsCard: state for current search session is: %lu.", (uint8_t *)&v10, 0xCu);
    }
  }

  return v5;
}

- (void)_reloadViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CarSearchResultsCardViewController *)self isViewLoaded])
  {
    BOOL v21 = v3;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100BF8CC4;
    v31[3] = &unk_10131B338;
    v31[4] = self;
    unint64_t v5 = objc_retainBlock(v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100BF8D3C;
    v30[3] = &unk_10131B360;
    v30[4] = self;
    id v6 = objc_retainBlock(v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100BF8E70;
    v29[3] = &unk_10131B360;
    v29[4] = self;
    dispatch_time_t v7 = objc_retainBlock(v29);
    unint64_t state = self->_state;
    id v9 = ((void (*)(void *, unint64_t))v5[2])(v5, state);
    int v10 = ((void (*)(void *, unint64_t))v6[2])(v6, state);
    double v22 = ((void (*)(void *, unint64_t))v7[2])(v7, state);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100BF91E8;
    v26[3] = &unk_1012E5D58;
    id v11 = v9;
    id v27 = v11;
    id v12 = v10;
    id v28 = v12;
    v13 = objc_retainBlock(v26);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100BF923C;
    v23[3] = &unk_1012FE440;
    v23[4] = self;
    unint64_t v25 = state;
    id v14 = v12;
    id v24 = v14;
    id v15 = objc_retainBlock(v23);
    loadingIndicatorView = self->_loadingIndicatorView;
    if (state) {
      [(UIActivityIndicatorView *)loadingIndicatorView stopAnimating];
    }
    else {
      [(UIActivityIndicatorView *)loadingIndicatorView startAnimating];
    }
    v17 = [(CarSearchResultsCardViewController *)self _loadingString];
    [(UILabel *)self->_loadingLabel setText:v17];

    if (state == 2) {
      [(CarSearchResultsCardViewController *)self _noResultsString];
    }
    else {
    v18 = [(CarSearchResultsCardViewController *)self _errorString];
    }
    [(UILabel *)self->_errorLabel setText:v18];

    v19 = [(CarSearchResultsCardViewController *)self view];
    [v19 addSubview:v11];

    [v11 setAlpha:0.0];
    +[NSLayoutConstraint activateConstraints:v22];
    v20 = [(CarSearchResultsCardViewController *)self view];
    [v20 layoutIfNeeded];

    if (v21)
    {
      +[UIView animateWithDuration:v13 animations:v15 completion:0.25];
    }
    else
    {
      ((void (*)(void *))v13[2])(v13);
      ((void (*)(void *, uint64_t))v15[2])(v15, 1);
    }
  }
}

- (id)_loadingString
{
  v2 = [(CarSearchResultsCardViewController *)self delegate];
  BOOL v3 = [v2 searchSession];
  objc_super v4 = [v3 searchFieldItem];
  unint64_t v5 = [v4 searchCategory];

  id v6 = +[NSBundle mainBundle];
  if (v5)
  {
    dispatch_time_t v7 = [v6 localizedStringForKey:@"Searching for  ... [Search Category]" value:@"localized string not found" table:0];
    v8 = [v5 shortDisplayString];
    id v9 = [v8 lowercaseString];
    int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
  }
  else
  {
    int v10 = [v6 localizedStringForKey:@"Searching... [Search Query]" value:@"localized string not found" table:0];
  }

  return v10;
}

- (id)_errorString
{
  switch(MKCurrentNetworkConnectionFailureDiagnosis())
  {
    case 0:
    case 4:
      self = [(CarSearchResultsCardViewController *)self _noResultsString];
      break;
    case 1:
      BOOL v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"NoSearchResults_AirplaneMode_iPhone";
      goto LABEL_6;
    case 2:
      BOOL v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"NoSearchResults_CellDataDisabled";
      goto LABEL_6;
    case 3:
      BOOL v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"NoSearchResults_NoNetworkConnection_iPhone";
LABEL_6:
      self = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return self;
}

- (id)_noResultsString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"no_result_key" value:@"localized string not found" table:0];

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(CarSearchResultsCardViewController *)self searchResults];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 nextFocusedView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v18 = [v7 nextFocusedView];

    id v11 = [v8 indexPathForCell:v18];

    id v12 = [(CarSearchResultsCardViewController *)self delegate];
    v13 = -[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", [v11 row]);
    [v12 searchResultsCard:self didFocusSearchResult:v13 atIndexPath:v11];
  }
  else
  {
    id v14 = [v7 previouslyFocusedView];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    id v18 = [v8 indexPathForCell:v16];

    v17 = [(CarBaseSearchViewController *)self lastSelectedIndexPath];
    LOBYTE(v16) = [v18 isEqual:v17];

    if (v16) {
      goto LABEL_9;
    }
    id v11 = [(CarSearchResultsCardViewController *)self delegate];
    [v11 searchResultsCard:self didFocusSearchResult:0 atIndexPath:0];
  }

LABEL_9:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CarSearchResultsCardViewController *)self searchResults];
  id v9 = [v8 objectAtIndexedSubscript:[v6 row]];

  int v10 = +[CarDisplayController sharedInstance];
  id v11 = [v10 chromeViewController];
  id v12 = [v9 mapItem];
  [v11 captureUserAction:2007 mapItem:v12 atResultIndex:[v6 row]];

  v13 = objc_alloc_init(SearchSessionAnalytics);
  [(SearchSessionAnalytics *)v13 setAction:2007];
  [(SearchSessionAnalytics *)v13 setTarget:1011];
  id v14 = +[SearchSessionAnalyticsAggregator sharedAggregator];
  [v14 collectSearchSessionAnalytics:v13];

  id v15 = [(CarSearchResultsCardViewController *)self delegate];
  [v15 searchResultsCard:self didSelectSearchResult:v9];

  v16.receiver = self;
  v16.super_class = (Class)CarSearchResultsCardViewController;
  [(CarBaseSearchViewController *)&v16 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CarSearchResultsCardViewController *)self searchResults];
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CarSearchResultsCardViewController;
  [(CarBaseSearchViewController *)&v9 tableView:a3 willDisplayCell:a4 forRowAtIndexPath:a5];
  id v6 = [(CarSearchResultsCardViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CarSearchResultsCardViewController *)self delegate];
    [v8 searchResultsCardDidUpdateVisibleCells:self];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = [(CarSearchResultsCardViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CarSearchResultsCardViewController *)self delegate];
    [v8 searchResultsCardDidUpdateVisibleCells:self];
  }
}

- (void)_captureAnalytics
{
  if ([(NSArray *)self->_searchResults count])
  {
    BOOL v3 = sub_100099700(self->_searchResults, &stru_10131B400);
    id v7 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = 0;
  }
  if ([(NSArray *)self->_searchResults count]) {
    uint64_t v4 = 2015;
  }
  else {
    uint64_t v4 = 8011;
  }
  id v5 = +[CarDisplayController sharedInstance];
  id v6 = [v5 chromeViewController];
  [v6 captureUserAction:v4 eventValue:v7];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarSearchResultsCardViewController *)self isViewLoaded])
  {
    BOOL v3 = [(CarBaseSearchViewController *)self tableView];
    uint64_t v4 = [v3 _car_visibleCells];
  }
  else
  {
    uint64_t v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarSearchResultsCardViewController *)self isViewLoaded])
  {
    BOOL v3 = [(CarBaseSearchViewController *)self tableView];
    id v6 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    uint64_t v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (CarSearchResultsCardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarSearchResultsCardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingStackView, 0);

  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end