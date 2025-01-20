@interface RouteWaypointSearchFieldView
- (BOOL)_shouldHideDynamicCurrentLocation;
- (BOOL)containsCurrentLocationItem;
- (BOOL)containsWaypointForItem:(id)a3;
- (BOOL)hasInput;
- (BOOL)isEditingAnySearchField;
- (BOOL)searchBarShouldClear:(id)a3;
- (RouteWaypointSearchFieldView)initWithDelegate:(id)a3;
- (RouteWaypointSearchFieldsDelegate)delegate;
- (SearchFieldItem)previousSearchFieldItem;
- (SearchFieldItem)searchFieldItem;
- (id)itemsForRouteRequest;
- (void)beginEditingNextSearchField;
- (void)clear;
- (void)endEditingFields;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviousSearchFieldItem:(id)a3;
- (void)setSearchFieldItem:(id)a3;
- (void)shouldReplaceTextWithCompletion:(id)a3;
- (void)updateSearchFieldsFromIndex:(unint64_t)a3 withItem:(id)a4;
- (void)updateTheme;
@end

@implementation RouteWaypointSearchFieldView

- (RouteWaypointSearchFieldView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RouteWaypointSearchFieldView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[RouteWaypointSearchFieldView initWithFrame:](&v28, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v8;
  if (v8)
  {
    LODWORD(v9) = 1148846080;
    [(RouteWaypointSearchFieldView *)v8 setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v11) = 1148846080;
    [(RouteWaypointSearchFieldView *)v10 setContentHuggingPriority:1 forAxis:v11];
    objc_storeWeak((id *)&v10->_delegate, v4);
    v12 = objc_alloc_init(SearchFieldItem);
    searchFieldItem = v10->_searchFieldItem;
    v10->_searchFieldItem = v12;

    v14 = [objc_alloc((Class)UISearchBar) initWithFrame:CGRectZero.origin.x, y, width, height];
    searchBar = v10->_searchBar;
    v10->_searchBar = v14;

    [(UISearchBar *)v10->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UISearchBar *)v10->_searchBar setDelegate:v10];
    v16 = +[UIColor clearColor];
    [(UISearchBar *)v10->_searchBar setBackgroundColor:v16];

    id v17 = objc_alloc_init((Class)UIImage);
    [(UISearchBar *)v10->_searchBar setBackgroundImage:v17];

    [(UISearchBar *)v10->_searchBar setTranslucent:1];
    [(UISearchBar *)v10->_searchBar setOpaque:0];
    -[UISearchBar _setOverrideContentInsets:forRectEdges:](v10->_searchBar, "_setOverrideContentInsets:forRectEdges:", 15, 0.0, 16.0, 0.0, 16.0);
    [(UISearchBar *)v10->_searchBar _setBackdropStyle:2005];
    [(UISearchBar *)v10->_searchBar setAccessibilityIdentifier:@"WaypointSearchBar"];
    [(UISearchBar *)v10->_searchBar setAutocorrectionType:1];
    [(UISearchBar *)v10->_searchBar setSpellCheckingType:1];
    [(RouteWaypointSearchFieldView *)v10 addSubview:v10->_searchBar];
    uint64_t v18 = [(UISearchBar *)v10->_searchBar searchTextField];
    searchField = v10->_searchField;
    v10->_searchField = (UISearchTextField *)v18;

    [(UISearchTextField *)v10->_searchField setAccessibilityIdentifier:@"WaypointSearchField"];
    id v20 = objc_alloc_init((Class)NSMutableArray);
    LODWORD(v21) = 1148846080;
    v22 = [(UISearchBar *)v10->_searchBar _maps_constraintsEqualToEdgesOfView:v10 priority:v21];
    v23 = [v22 allConstraints];
    [v20 addObjectsFromArray:v23];

    +[NSLayoutConstraint activateConstraints:v20];
    v24 = +[MapsOfflineUIHelper sharedHelper];
    LODWORD(v23) = [v24 isUsingOfflineMaps];

    if (v23)
    {
      v25 = +[NSBundle mainBundle];
      v26 = [v25 localizedStringForKey:@"[Waypoint Editing] Search Offline Maps" value:@"localized string not found" table:0];
      [(UISearchBar *)v10->_searchBar setPlaceholder:v26];
    }
  }

  return v10;
}

- (void)setSearchFieldItem:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_searchFieldItem, a3);
  v5 = v20;
  if (!v20) {
    goto LABEL_4;
  }
  v6 = [v20 searchResult];
  if (([v6 isDynamicCurrentLocation] & 1) == 0)
  {

    goto LABEL_6;
  }
  unsigned __int8 v7 = [(RouteWaypointSearchFieldView *)self _shouldHideDynamicCurrentLocation];

  v5 = v20;
  if ((v7 & 1) == 0)
  {
LABEL_6:
    v8 = [v20 waypointName];
    v5 = v20;
    goto LABEL_7;
  }
LABEL_4:
  v8 = 0;
LABEL_7:
  uint64_t v9 = [v5 routePlanningWaypointRequest];
  v10 = [(id)v9 waypointRequest];

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0 && v10)
  {
    double v11 = [v20 routePlanningWaypointRequest];
    v12 = [v11 waypointRequest];

    uint64_t v13 = [v12 waypointNameWhenEditing];

    v8 = (void *)v13;
  }
  [(UISearchBar *)self->_searchBar setText:v8];
  v14 = [(SearchFieldItem *)self->_searchFieldItem evStopWaypoint];
  unsigned int v15 = [v14 isServerProvidedWaypoint];

  v16 = +[NSBundle mainBundle];
  id v17 = v16;
  if (v15) {
    CFStringRef v18 = @"[Waypoint Editing] Search for charging stations";
  }
  else {
    CFStringRef v18 = @"[Waypoint Editing] Search Maps";
  }
  v19 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];
  [(UISearchBar *)self->_searchBar setPlaceholder:v19];
}

- (void)updateTheme
{
  v7.receiver = self;
  v7.super_class = (Class)RouteWaypointSearchFieldView;
  [(MapsThemeView *)&v7 updateTheme];
  v3 = [(RouteWaypointSearchFieldView *)self theme];
  id v4 = [v3 searchBarPlaceHolderColor];
  v5 = [(UISearchTextField *)self->_searchField _placeholderLabel];
  [v5 setTextColor:v4];

  v6 = [(RouteWaypointSearchFieldView *)self theme];
  -[UISearchTextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", [v6 textFieldKeyboardAppearance]);
}

- (BOOL)hasInput
{
  v2 = [(UISearchBar *)self->_searchBar text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isEditingAnySearchField
{
  return 1;
}

- (void)beginEditingNextSearchField
{
  [(UISearchBar *)self->_searchBar becomeFirstResponder];
  id v6 = [(UISearchBar *)self->_searchBar searchTextField];
  BOOL v3 = [v6 beginningOfDocument];
  id v4 = [v6 endOfDocument];
  v5 = [v6 textRangeFromPosition:v3 toPosition:v4];

  [v6 setSelectedTextRange:v5];
}

- (void)endEditingFields
{
}

- (BOOL)_shouldHideDynamicCurrentLocation
{
  v2 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v3 = [v2 isLocationServicesApproved];
  char v4 = v3 & [v2 isAuthorizedForPreciseLocation] ^ 1;

  return v4;
}

- (id)itemsForRouteRequest
{
  v2 = [(RouteWaypointSearchFieldView *)self searchFieldItem];
  v5 = v2;
  unsigned __int8 v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (BOOL)containsCurrentLocationItem
{
  v2 = [(RouteWaypointSearchFieldView *)self searchFieldItem];
  unsigned __int8 v3 = [v2 searchResult];
  unsigned __int8 v4 = [v3 isDynamicCurrentLocation];

  return v4;
}

- (BOOL)containsWaypointForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 isDynamicCurrentLocation]
    && [(RouteWaypointSearchFieldView *)self _shouldHideDynamicCurrentLocation])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    id v6 = +[SearchFieldItem searchFieldItemWithObject:v4 expandRecentsItem:1 preserveContact:1];
    if (v6)
    {
      objc_super v7 = [(RouteWaypointSearchFieldView *)self searchFieldItem];
      unsigned __int8 v5 = [v6 isEquivalentAsWaypointToSearchFieldItem:v7];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (void)updateSearchFieldsFromIndex:(unint64_t)a3 withItem:(id)a4
{
  unsigned __int8 v5 = (SearchFieldItem *)a4;
  [(UISearchBar *)self->_searchBar resignFirstResponder];
  searchFieldItem = self->_searchFieldItem;
  self->_searchFieldItem = v5;

  id v7 = [(RouteWaypointSearchFieldView *)self delegate];
  [v7 routeSearchFieldsDidUpdateItemsForRouteRequest:self];
}

- (void)shouldReplaceTextWithCompletion:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned __int8 v5 = v10;
  if (isKindOfClass)
  {
    id v6 = v10;
    id v7 = [v6 queryAcceleratorCompletionString];
    if ([v7 length]) {
      [v6 queryAcceleratorCompletionString];
    }
    else {
    v8 = [v6 title];
    }

    [(UISearchTextField *)self->_searchField setText:v8];
    uint64_t v9 = [(RouteWaypointSearchFieldView *)self delegate];
    [v9 routeSearch:self didUpdateInputText:v8 atIndex:0x7FFFFFFFFFFFFFFFLL];

    unsigned __int8 v5 = v10;
  }
}

- (void)clear
{
  unsigned __int8 v3 = [(RouteWaypointSearchFieldView *)self searchFieldItem];
  [v3 clear];

  [(UISearchBar *)self->_searchBar setText:0];
  searchBar = self->_searchBar;

  [(UISearchBar *)searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(RouteWaypointSearchFieldView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(RouteWaypointSearchFieldView *)self delegate];
    [v7 routeSearchFieldsDidBeginEditing:self];
  }
  id v10 = [(RouteWaypointSearchFieldView *)self delegate];
  v8 = [v4 text];

  if (v8) {
    CFStringRef v9 = v8;
  }
  else {
    CFStringRef v9 = &stru_101324E70;
  }
  [v10 routeSearch:self didUpdateInputText:v9 atIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(RouteWaypointSearchFieldView *)self delegate];
  [v6 routeSearch:self didUpdateInputText:v5 atIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  id v8 = [(RouteWaypointSearchFieldView *)self delegate];
  id v5 = [v4 text];

  id v6 = +[SearchFieldItem searchFieldItemWithObject:v5];
  id v7 = [(RouteWaypointSearchFieldView *)self previousSearchFieldItem];
  [v8 routeSearch:self didSearchForItem:v6 previousSearchItem:v7];
}

- (BOOL)searchBarShouldClear:(id)a3
{
  id v4 = [(RouteWaypointSearchFieldView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteWaypointSearchFieldView *)self delegate];
    [v6 routeSearchFields:self didClearInputTextForWaypointAtIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return 1;
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (SearchFieldItem)previousSearchFieldItem
{
  return self->_previousSearchFieldItem;
}

- (void)setPreviousSearchFieldItem:(id)a3
{
}

- (RouteWaypointSearchFieldsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteWaypointSearchFieldsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousSearchFieldItem, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_storeStrong((id *)&self->_searchField, 0);

  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end