@interface RoutePlanningWaypointEditorViewController
- (BOOL)canDeleteCurrentFieldIndex;
- (BOOL)containsCurrentLocationItem;
- (BOOL)containsWaypointForItem:(id)a3;
- (BOOL)hasInput;
- (BOOL)isEditingAnySearchField;
- (BOOL)mprEnabled;
- (BOOL)pauseSelectionUpdates;
- (NSArray)items;
- (NSArray)itemsForRouteRequest;
- (NSString)focusGroupIdentifierForCurrentlyEditingField;
- (RoutePlanningWaypointEditorViewController)initWithWaypointInfoProvider:(id)a3;
- (RoutePlanningWaypointListView)waypointListView;
- (RouteWaypointSearchFieldsDelegate)delegate;
- (UILayoutGuide)layoutGuideForCurrentlyEditingField;
- (double)contentHeight;
- (id)intrinsicContentSizeInvalidationHandler;
- (int)currentListInteractionSession;
- (unint64_t)_currentlySelectedIndexForAddStop;
- (void)_invalidateIntrinsicContentSize;
- (void)beginEditingNextSearchField;
- (void)clear;
- (void)deleteCurrentFieldIndex;
- (void)didInteractWithWaypointFields;
- (void)endEditingFields;
- (void)invokeSearchWithText:(id)a3;
- (void)selectFieldAtIndex:(unint64_t)a3;
- (void)selectFromField;
- (void)selectToField;
- (void)setDelegate:(id)a3;
- (void)setIntrinsicContentSizeInvalidationHandler:(id)a3;
- (void)setItems:(id)a3;
- (void)setMprEnabled:(BOOL)a3;
- (void)setPauseSelectionUpdates:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAutoCompleteWithText:(id)a3;
- (void)updateSearchFieldsFromIndex:(unint64_t)a3 withItem:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)waypointListView:(id)a3 didClearInputTextForWaypointAtIndex:(unint64_t)a4;
- (void)waypointListView:(id)a3 didDeleteWaypointAtIndex:(unint64_t)a4;
- (void)waypointListView:(id)a3 didMoveWaypoint:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)waypointListView:(id)a3 didReceiveItem:(id)a4;
- (void)waypointListView:(id)a3 didSelectCollapsedWaypoints:(id)a4;
- (void)waypointListView:(id)a3 didStartEditingWaypointAtIndex:(unint64_t)a4;
- (void)waypointListViewDidSelectAddStop:(id)a3;
- (void)willBecomeCurrent;
@end

@implementation RoutePlanningWaypointEditorViewController

- (RoutePlanningWaypointEditorViewController)initWithWaypointInfoProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointEditorViewController;
  v5 = [(RoutePlanningWaypointEditorViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_waypointInfoProvider, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)RoutePlanningWaypointEditorViewController;
  [(RoutePlanningWaypointEditorViewController *)&v27 viewDidLoad];
  v3 = [RoutePlanningWaypointListView alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
  v5 = [(RoutePlanningWaypointListView *)v3 initWithWaypoints:&__NSArray0__struct editingMode:2 delegate:self waypointInfoProvider:WeakRetained];
  waypointListView = self->_waypointListView;
  self->_waypointListView = v5;

  [(RoutePlanningWaypointListView *)self->_waypointListView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (sub_1000BBB44(self) == 5)
  {
    LODWORD(v7) = 1148846080;
    [(RoutePlanningWaypointListView *)self->_waypointListView setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(RoutePlanningWaypointListView *)self->_waypointListView setContentHuggingPriority:1 forAxis:v8];
  }
  v9 = [(RoutePlanningWaypointEditorViewController *)self view];
  [v9 addSubview:self->_waypointListView];

  v25 = [(RoutePlanningWaypointListView *)self->_waypointListView leadingAnchor];
  v26 = [(RoutePlanningWaypointEditorViewController *)self view];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v28[0] = v23;
  v21 = [(RoutePlanningWaypointListView *)self->_waypointListView trailingAnchor];
  v22 = [(RoutePlanningWaypointEditorViewController *)self view];
  v20 = [v22 trailingAnchor];
  v10 = [v21 constraintEqualToAnchor:v20];
  v28[1] = v10;
  v11 = [(RoutePlanningWaypointListView *)self->_waypointListView topAnchor];
  v12 = [(RoutePlanningWaypointEditorViewController *)self view];
  v13 = [v12 topAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v28[2] = v14;
  v15 = [(RoutePlanningWaypointListView *)self->_waypointListView bottomAnchor];
  v16 = [(RoutePlanningWaypointEditorViewController *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-4.0];
  v28[3] = v18;
  v19 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningWaypointEditorViewController;
  [(RoutePlanningWaypointEditorViewController *)&v4 viewDidDisappear:a3];
  [(RoutePlanningWaypointListView *)self->_waypointListView collapseStopsIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointEditorViewController;
  id v4 = a3;
  [(RoutePlanningWaypointEditorViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 verticalSizeClass];

  v6 = [(RoutePlanningWaypointEditorViewController *)self traitCollection];
  id v7 = [v6 verticalSizeClass];

  if (v5 != v7) {
    [(RoutePlanningWaypointEditorViewController *)self _invalidateIntrinsicContentSize];
  }
}

- (void)willBecomeCurrent
{
  self->_didInteractWithFields = 0;
  [(RoutePlanningWaypointListView *)self->_waypointListView deselectAllRows];
}

- (void)_invalidateIntrinsicContentSize
{
  v3 = [(RoutePlanningWaypointEditorViewController *)self intrinsicContentSizeInvalidationHandler];

  if (v3)
  {
    id v4 = [(RoutePlanningWaypointEditorViewController *)self intrinsicContentSizeInvalidationHandler];
    v4[2]();
  }
}

- (UILayoutGuide)layoutGuideForCurrentlyEditingField
{
  v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  v3 = [v2 layoutGuideForCurrentlyEditingField];

  return (UILayoutGuide *)v3;
}

- (NSString)focusGroupIdentifierForCurrentlyEditingField
{
  v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  v3 = [v2 focusGroupIdentifierForCurrentlyEditingField];

  return (NSString *)v3;
}

- (BOOL)containsCurrentLocationItem
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(RoutePlanningWaypointEditorViewController *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) searchResult];
        unsigned __int8 v7 = [v6 isDynamicCurrentLocation];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)selectFromField
{
  id v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v2 selectRowIndex:0];
}

- (void)selectToField
{
  id v5 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v3 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  uint64_t v4 = [v3 waypoints];
  [v5 selectRowIndex:[v4 count] - 1];
}

- (void)selectFieldAtIndex:(unint64_t)a3
{
  id v4 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v4 selectRowIndex:a3];
}

- (BOOL)canDeleteCurrentFieldIndex
{
  id v3 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v4 = [v3 selectedIndex];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v6 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  unsigned __int8 v7 = [v6 canDeleteWaypointForCellAtIndex:v4];

  return v7;
}

- (void)deleteCurrentFieldIndex
{
  id v3 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v4 = [v3 selectedIndex];

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
    [v5 performDeleteAtIndex:v4];
  }
}

- (NSArray)items
{
  id v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v3 = [v2 waypoints];

  return (NSArray *)v3;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v5 setWaypoints:v4];
}

- (NSArray)itemsForRouteRequest
{
  id v2 = [(RoutePlanningWaypointEditorViewController *)self items];
  id v3 = sub_100099700(v2, &stru_1013206E0);

  return (NSArray *)v3;
}

- (void)clear
{
}

- (void)setMprEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v4 setMprEnabled:v3];
}

- (BOOL)mprEnabled
{
  id v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  unsigned __int8 v3 = [v2 mprEnabled];

  return v3;
}

- (void)beginEditingNextSearchField
{
  unsigned __int8 v3 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v4 = [v3 selectedIndex];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
    v6 = [v5 waypoints];

    unsigned __int8 v7 = (char *)[v6 count];
    if (v7)
    {
      objc_super v8 = v7;
      uint64_t v9 = 0;
      long long v10 = v7 - 1;
      while (1)
      {
        long long v11 = [v6 objectAtIndexedSubscript:v9];
        long long v12 = [v11 waypointName];
        id v13 = [v12 length];

        if (!v13) {
          break;
        }
        if (v8 == (char *)++v9)
        {
          uint64_t v9 = (uint64_t)v10;
          break;
        }
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
    v15 = sub_100CA214C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 134217984;
      uint64_t v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Begin editing at index %lu", (uint8_t *)&v17, 0xCu);
    }

    v16 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
    [v16 selectRowIndex:v9];
  }
  else
  {
    v14 = sub_100CA214C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Begin editing next field", (uint8_t *)&v17, 2u);
    }

    v6 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
    [v6 selectNextSearchField];
  }
}

- (void)endEditingFields
{
  unsigned __int8 v3 = sub_100CA214C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "End all editing", v5, 2u);
  }

  id v4 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v4 deselectAllRows];
}

- (void)updateSearchFieldsFromIndex:(unint64_t)a3 withItem:(id)a4
{
  v6 = (char *)a4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  unsigned __int8 v7 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  a3 = (unint64_t)[v7 selectedIndex];

  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  objc_super v8 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  unsigned int v9 = [v8 addStop];

  if (!v9) {
    goto LABEL_7;
  }
  long long v10 = sub_100CA214C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Adding waypoint cell to accommodate new item", (uint8_t *)&v18, 2u);
  }

  long long v11 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  long long v12 = [v11 waypoints];
  a3 = (unint64_t)[v12 count] - 1;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    id v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315650;
      v19 = "-[RoutePlanningWaypointEditorViewController updateSearchFieldsFromIndex:withItem:]";
      __int16 v20 = 2080;
      v21 = "RoutePlanningWaypointEditorViewController.m";
      __int16 v22 = 1024;
      int v23 = 228;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v18, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = +[NSThread callStackSymbols];
        int v18 = 138412290;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
      }
    }
    v16 = sub_100CA214C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Didn't have a selected cell when applying item %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
LABEL_15:
    int v17 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
    [v17 replaceWaypointAtIndex:a3 withWaypoint:v6];

    v16 = [(RoutePlanningWaypointEditorViewController *)self delegate];
    [v16 routeSearchFieldsDidUpdateItemsForRouteRequest:self];
  }
}

- (BOOL)containsWaypointForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v5 = v4;
  v6 = +[MKLocationManager sharedLocationManager];
  unsigned int v7 = [v6 isLocationServicesApproved];
  unsigned int v8 = [v6 isAuthorizedForPreciseLocation];
  unsigned int v9 = [v5 isDynamicCurrentLocation];

  if (!v9) {
    goto LABEL_5;
  }
  if ((v7 & v8) == 0)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
LABEL_5:
    long long v11 = +[SearchFieldItem searchFieldItemWithObject:v4 expandRecentsItem:1 preserveContact:1];
    if (v11)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v12 = [(RoutePlanningWaypointEditorViewController *)self items];
      id v10 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v13 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v12);
            }
            if ([v11 isEquivalentAsWaypointToSearchFieldItem:*(void *)(*((void *)&v16 + 1) + 8 * i)])
            {
              LOBYTE(v10) = 1;
              goto LABEL_16;
            }
          }
          id v10 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return (char)v10;
}

- (BOOL)isEditingAnySearchField
{
  if (!self->_didInteractWithFields && sub_1000BBB44(self) == 5) {
    return 0;
  }
  id v4 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  BOOL v3 = [v4 selectedIndex] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (BOOL)hasInput
{
  BOOL v3 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v4 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v3 cellForIndex:[v4 selectedIndex]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 currentText];
    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)contentHeight
{
  id v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v2 intrinsicContentSize];
  double v4 = v3;

  return v4;
}

- (unint64_t)_currentlySelectedIndexForAddStop
{
  id v2 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  id v3 = [v2 selectedIndex];

  return (unint64_t)v3;
}

- (void)waypointListViewDidSelectAddStop:(id)a3
{
  double v4 = sub_100CA214C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Did select Add Stop", buf, 2u);
  }

  id v5 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v5 addStop];

  [(RoutePlanningWaypointEditorViewController *)self _invalidateIntrinsicContentSize];
  v6 = +[MKMapService sharedService];
  [v6 captureUserAction:6097 onTarget:607 eventValue:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100CA2944;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waypointListView:(id)a3 didStartEditingWaypointAtIndex:(unint64_t)a4
{
  id v5 = sub_100CA214C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    unint64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did start editing waypoint at index %lu", (uint8_t *)&v9, 0xCu);
  }

  v6 = +[MKMapService sharedService];
  BOOL v7 = +[NSNumber numberWithUnsignedInteger:a4];
  unsigned int v8 = [v7 stringValue];
  [v6 captureUserAction:277 onTarget:607 eventValue:v8];
}

- (void)waypointListView:(id)a3 didMoveWaypoint:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  int v9 = sub_100CA214C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 134218240;
    unint64_t v15 = a5;
    __int16 v16 = 2048;
    unint64_t v17 = a6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Did move waypoint from index %lu at %lu", (uint8_t *)&v14, 0x16u);
  }

  unint64_t v10 = +[MKMapService sharedService];
  long long v11 = +[NSNumber numberWithUnsignedInteger:a5];
  long long v12 = [v11 stringValue];
  [v10 captureUserAction:279 onTarget:607 eventValue:v12];

  uint64_t v13 = [(RoutePlanningWaypointEditorViewController *)self delegate];
  [v13 routeSearchFieldsDidUpdateItemsForRouteRequest:self];
}

- (void)waypointListView:(id)a3 didDeleteWaypointAtIndex:(unint64_t)a4
{
  v6 = sub_100CA214C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    unint64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did delete waypoint at index %lu", (uint8_t *)&v11, 0xCu);
  }

  BOOL v7 = +[MKMapService sharedService];
  unsigned int v8 = +[NSNumber numberWithUnsignedInteger:a4];
  int v9 = [v8 stringValue];
  [v7 captureUserAction:280 onTarget:607 eventValue:v9];

  [(RoutePlanningWaypointEditorViewController *)self _invalidateIntrinsicContentSize];
  unint64_t v10 = [(RoutePlanningWaypointEditorViewController *)self delegate];
  [v10 routeSearchFieldsDidUpdateItemsForRouteRequest:self];
}

- (void)waypointListView:(id)a3 didClearInputTextForWaypointAtIndex:(unint64_t)a4
{
  v6 = sub_100CA214C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    unint64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did clear input text for field at index %lu", (uint8_t *)&v10, 0xCu);
  }

  BOOL v7 = [(RoutePlanningWaypointEditorViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(RoutePlanningWaypointEditorViewController *)self delegate];
    [v9 routeSearchFields:self didClearInputTextForWaypointAtIndex:a4];
  }
}

- (void)waypointListView:(id)a3 didSelectCollapsedWaypoints:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = sub_100CA214C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Did select collapsed waypoints", v13, 2u);
  }

  int v9 = +[MKMapService sharedService];
  id v10 = [v6 count];

  unint64_t v11 = +[NSNumber numberWithUnsignedInteger:v10];
  unint64_t v12 = [v11 stringValue];
  [v9 captureUserAction:31 onTarget:607 eventValue:v12];

  [v7 expandStopsIfNeeded];
  [(RoutePlanningWaypointEditorViewController *)self _invalidateIntrinsicContentSize];
}

- (void)updateAutoCompleteWithText:(id)a3
{
  id v4 = a3;
  id v6 = [(RoutePlanningWaypointEditorViewController *)self delegate];
  id v5 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  [v6 routeSearch:self didUpdateInputText:v4 atIndex:[v5 selectedIndex]];
}

- (void)invokeSearchWithText:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    id v5 = sub_100CA214C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invoking search by triggering route request", (uint8_t *)&v19, 2u);
    }

    id v6 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
    [v6 deselectAllRows];

    id v7 = [(RoutePlanningWaypointEditorViewController *)self delegate];
    [(SearchFieldItem *)v7 routeSearchFieldsDidUpdateItemsForRouteRequest:self];
LABEL_20:

    goto LABEL_21;
  }
  char v8 = [(RoutePlanningWaypointEditorViewController *)self waypointListView];
  int v9 = (const char *)[v8 selectedIndex];

  if (v9) {
    uint64_t v10 = (uint64_t)(v9 - 1);
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v11 = [(RoutePlanningWaypointEditorViewController *)self items];
  unint64_t v12 = (const char *)[v11 count];

  if (v9 < v12)
  {
    uint64_t v13 = sub_100CA214C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 134217984;
      __int16 v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Invoking search for index %lu", (uint8_t *)&v19, 0xCu);
    }

    id v7 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v7 setSearchString:v4];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v14 = 0;
    }
    else
    {
      unint64_t v17 = [(RoutePlanningWaypointEditorViewController *)self items];
      int v14 = [v17 objectAtIndex:v10];
    }
    long long v18 = [(RoutePlanningWaypointEditorViewController *)self delegate];
    [v18 routeSearch:self didSearchForItem:v7 previousSearchItem:v14];

    goto LABEL_20;
  }
  unint64_t v15 = sub_1005762E4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315650;
    __int16 v20 = "-[RoutePlanningWaypointEditorViewController invokeSearchWithText:]";
    __int16 v21 = 2080;
    __int16 v22 = "RoutePlanningWaypointEditorViewController.m";
    __int16 v23 = 1024;
    int v24 = 358;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v19, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    sub_1005762E4();
    id v7 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = +[NSThread callStackSymbols];
      int v19 = 138412290;
      __int16 v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)didInteractWithWaypointFields
{
  self->_didInteractWithFields = 1;
}

- (void)waypointListView:(id)a3 didReceiveItem:(id)a4
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

- (BOOL)pauseSelectionUpdates
{
  return self->_pauseSelectionUpdates;
}

- (void)setPauseSelectionUpdates:(BOOL)a3
{
  self->_pauseSelectionUpdates = a3;
}

- (int)currentListInteractionSession
{
  return self->_currentListInteractionSession;
}

- (id)intrinsicContentSizeInvalidationHandler
{
  return self->_intrinsicContentSizeInvalidationHandler;
}

- (void)setIntrinsicContentSizeInvalidationHandler:(id)a3
{
}

- (RoutePlanningWaypointListView)waypointListView
{
  return self->_waypointListView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointListView, 0);
  objc_storeStrong(&self->_intrinsicContentSizeInvalidationHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_waypointInfoProvider);

  objc_storeStrong((id *)&self->_layoutGuideConstraints, 0);
}

@end