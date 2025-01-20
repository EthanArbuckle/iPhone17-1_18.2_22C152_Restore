@interface RoutePlanningWaypointListView
- (BOOL)_canDeleteWaypoints;
- (BOOL)_shouldEnableAddStopCell;
- (BOOL)_supportsCollapsingStops;
- (BOOL)addStop;
- (BOOL)canDeleteWaypointForCellAtIndex:(unint64_t)a3;
- (BOOL)hasExpandedStops;
- (BOOL)mprEnabled;
- (BOOL)replaceWaypointAtIndex:(unint64_t)a3 withWaypoint:(id)a4;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CGSize)intrinsicContentSize;
- (NSArray)waypoints;
- (NSString)focusGroupIdentifierForCurrentlyEditingField;
- (RoutePlanningWaypointListView)initWithWaypoints:(id)a3 editingMode:(unint64_t)a4 delegate:(id)a5 waypointInfoProvider:(id)a6;
- (RoutePlanningWaypointListViewDelegate)delegate;
- (UILayoutGuide)layoutGuideForCurrentlyEditingField;
- (double)_contentHeight;
- (double)_rowHeight;
- (id)_findLastEmptyWaypointCell:(id)a3;
- (id)cellForIndex:(unint64_t)a3;
- (id)contextMenuForCell:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)editingMode;
- (unint64_t)indexForLastWaypointCell;
- (unint64_t)numberOfRows;
- (unint64_t)searchFieldIndexForWaypoints:(id)a3;
- (unint64_t)selectedIndex;
- (unint64_t)userAddedWaypointCount;
- (void)_layoutDottedLineForCell:(id)a3 atIndexPath:(id)a4;
- (void)_layoutDottedLines;
- (void)_refreshAddStopCellEnabled;
- (void)_reloadAllRows;
- (void)_restoreCurrentlySelectedEditingIfNeeded:(id)a3;
- (void)_updateLayoutGuideForCurrentlyEditingField;
- (void)cell:(id)a3 didChangeInputText:(id)a4;
- (void)cell:(id)a3 didReceiveMapItem:(id)a4;
- (void)cellDidClearInputText:(id)a3;
- (void)cellDidRequestSearch:(id)a3;
- (void)cellDidStartEditing:(id)a3 withUserInteraction:(BOOL)a4;
- (void)cellDidStopEditing:(id)a3;
- (void)collapseStopsIfNeeded;
- (void)deselectAllRows;
- (void)expandStopsIfNeeded;
- (void)performDeleteAtIndex:(unint64_t)a3;
- (void)refreshWaypointDisplay;
- (void)scrollWaypointCellToVisible:(id)a3 animated:(BOOL)a4;
- (void)selectNextSearchField;
- (void)selectRowIndex:(unint64_t)a3;
- (void)setMprEnabled:(BOOL)a3;
- (void)setWaypoints:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoutePlanningWaypointListView

- (RoutePlanningWaypointListView)initWithWaypoints:(id)a3 editingMode:(unint64_t)a4 delegate:(id)a5 waypointInfoProvider:(id)a6
{
  id v52 = a3;
  id obj = a5;
  id v53 = a6;
  v57.receiver = self;
  v57.super_class = (Class)RoutePlanningWaypointListView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[RoutePlanningWaypointListView initWithFrame:](&v57, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v13)
  {
    v14 = (NSMutableArray *)[v52 mutableCopy];
    waypoints = v13->_waypoints;
    v13->_waypoints = v14;

    v13->_editingMode = a4;
    objc_storeWeak((id *)&v13->_delegate, obj);
    objc_storeWeak((id *)&v13->_waypointInfoProvider, v53);
    v13->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_expandedStops = ![(RoutePlanningWaypointListView *)v13 _supportsCollapsingStops];
    [(RoutePlanningWaypointListView *)v13 setAccessibilityIdentifier:@"RoutePlanningWaypointListView"];
    v16 = -[RoutePlanningWaypointTableView initWithFrame:style:]([RoutePlanningWaypointTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
    p_tableView = (id *)&v13->_tableView;
    tableView = v13->_tableView;
    v13->_tableView = v16;

    [(RoutePlanningWaypointTableView *)v13->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RoutePlanningWaypointTableView *)v13->_tableView setDelegate:v13];
    [(RoutePlanningWaypointTableView *)v13->_tableView setDataSource:v13];
    [(RoutePlanningWaypointTableView *)v13->_tableView _setTopPadding:0.0];
    [(RoutePlanningWaypointTableView *)v13->_tableView _setBottomPadding:0.0];
    [(RoutePlanningWaypointTableView *)v13->_tableView setSectionHeaderHeight:0.0];
    [(RoutePlanningWaypointTableView *)v13->_tableView setSectionFooterHeight:0.0];
    v19 = +[UIColor clearColor];
    [(RoutePlanningWaypointTableView *)v13->_tableView setBackgroundColor:v19];

    if (sub_1000BBB44(v13) == 5) {
      double v20 = 8.0;
    }
    else {
      double v20 = 16.0;
    }
    if (sub_1000BBB44(v13) == 5) {
      double v21 = 8.0;
    }
    else {
      double v21 = 16.0;
    }
    [*p_tableView setDirectionalLayoutMargins:0.0 v20 0.0 v21];
    [*p_tableView setSeparatorStyle:1];
    uint64_t v22 = sub_1000BBB44(v13);
    BOOL v24 = a4 == 2 && v22 != 5;
    [*p_tableView setScrollEnabled:v24];
    [*p_tableView setAlwaysBounceVertical:0];
    [*p_tableView setDragInteractionEnabled:a4 != 0];
    [*p_tableView setAccessibilityIdentifier:@"RoutePlanningWaypointListViewTableView"];
    uint64_t v25 = sub_1000BBB44(v13);
    double v26 = 44.0;
    if (v25 == 5) {
      double v26 = 28.0;
    }
    [*p_tableView setEstimatedRowHeight:v26];
    [*p_tableView _setAllowsReorderingWhenNotEditing:1];
    if (sub_1000BBB44(*p_tableView) == 5)
    {
      v27 = +[UIColor secondarySystemFillColor];
      [(RoutePlanningWaypointTableView *)v13->_tableView setSeparatorColor:v27];
    }
    v28 = (id *)&v13->_tableView;
    [(RoutePlanningWaypointListView *)v13 addSubview:v13->_tableView];
    v50 = [(RoutePlanningWaypointTableView *)v13->_tableView leadingAnchor];
    v49 = [(RoutePlanningWaypointListView *)v13 leadingAnchor];
    uint64_t v29 = sub_1000BBB44(v13);
    double v30 = 0.0;
    if (v29 == 5) {
      double v30 = -8.0;
    }
    v48 = [v50 constraintEqualToAnchor:v49 constant:v30];
    v58[0] = v48;
    v47 = [(RoutePlanningWaypointListView *)v13 trailingAnchor];
    v46 = [*v28 trailingAnchor];
    uint64_t v31 = sub_1000BBB44(v13);
    double v32 = 0.0;
    if (v31 == 5) {
      double v32 = -8.0;
    }
    v33 = [v47 constraintEqualToAnchor:v46 constant:v32];
    v58[1] = v33;
    v34 = [*v28 topAnchor];
    v35 = [(RoutePlanningWaypointListView *)v13 topAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v58[2] = v36;
    v37 = [(RoutePlanningWaypointListView *)v13 bottomAnchor];
    v38 = [*v28 bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v58[3] = v39;
    v40 = +[NSArray arrayWithObjects:v58 count:4];
    +[NSLayoutConstraint activateConstraints:v40];

    v41 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    layoutGuideForCurrentlyEditingField = v13->_layoutGuideForCurrentlyEditingField;
    v13->_layoutGuideForCurrentlyEditingField = v41;

    [(UILayoutGuide *)v13->_layoutGuideForCurrentlyEditingField setIdentifier:@"RoutePlanning.CurrentlyEditingField"];
    [(RoutePlanningWaypointListView *)v13 addLayoutGuide:v13->_layoutGuideForCurrentlyEditingField];
    unsigned int v43 = [*v28 isScrollEnabled];
    LODWORD(v44) = 1148846080;
    if (v43) {
      *(float *)&double v44 = 750.0;
    }
    [(RoutePlanningWaypointListView *)v13 setContentCompressionResistancePriority:1 forAxis:v44];
    [(RoutePlanningWaypointListView *)v13 _reloadAllRows];
    [(RoutePlanningWaypointListView *)v13 _updateLayoutGuideForCurrentlyEditingField];
    objc_initWeak(&location, v13);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10099951C;
    v54[3] = &unk_1012E6708;
    objc_copyWeak(&v55, &location);
    [*v28 setPostLayoutHandler:v54];
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSString)focusGroupIdentifierForCurrentlyEditingField
{
  return (NSString *)@"RoutePlanningWaypointFocusGroup";
}

- (void)_updateLayoutGuideForCurrentlyEditingField
{
  if (self->_layoutGuideConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  v3 = self->_tableView;
  unint64_t v4 = [(RoutePlanningWaypointListView *)self selectedIndex];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(RoutePlanningWaypointListView *)self cellForIndex:v4];

    v3 = (RoutePlanningWaypointTableView *)v5;
  }
  v28 = [(RoutePlanningWaypointListView *)self layoutGuideForCurrentlyEditingField];
  v27 = [v28 widthAnchor];
  double v26 = [(RoutePlanningWaypointTableView *)self->_tableView widthAnchor];
  uint64_t v25 = [v27 constraintEqualToAnchor:v26];
  v31[0] = v25;
  BOOL v24 = [(RoutePlanningWaypointListView *)self layoutGuideForCurrentlyEditingField];
  v23 = [v24 centerXAnchor];
  uint64_t v22 = [(RoutePlanningWaypointTableView *)self->_tableView centerXAnchor];
  double v21 = [v23 constraintEqualToAnchor:v22];
  v31[1] = v21;
  double v20 = [(RoutePlanningWaypointListView *)self layoutGuideForCurrentlyEditingField];
  v19 = [v20 heightAnchor];
  v18 = [(RoutePlanningWaypointTableView *)v3 heightAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v31[2] = v17;
  v16 = [(RoutePlanningWaypointListView *)self layoutGuideForCurrentlyEditingField];
  v6 = [v16 topAnchor];
  v7 = [(RoutePlanningWaypointTableView *)v3 topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v31[3] = v8;
  v9 = [(RoutePlanningWaypointTableView *)v3 bottomAnchor];
  v10 = [(RoutePlanningWaypointListView *)self layoutGuideForCurrentlyEditingField];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v31[4] = v12;
  v13 = +[NSArray arrayWithObjects:v31 count:5];
  layoutGuideConstraints = self->_layoutGuideConstraints;
  self->_layoutGuideConstraints = v13;

  +[NSLayoutConstraint activateConstraints:self->_layoutGuideConstraints];
  v15 = sub_1009998B0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    double v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Updating layout guide to %@", buf, 0xCu);
  }
}

- (NSArray)waypoints
{
  if ((unint64_t)[(NSMutableArray *)self->_waypoints count] <= 1
    && (id)[(RoutePlanningWaypointListView *)self editingMode] == (id)2)
  {
    v3 = [(NSMutableArray *)self->_waypoints firstObject];
    unint64_t v4 = v3;
    if (v3) {
      id v5 = v3;
    }
    else {
      id v5 = (id)objc_opt_new();
    }
    v6 = v5;

    id v7 = objc_alloc((Class)NSMutableArray);
    v8 = objc_opt_new();
    v9 = [v7 initWithObjects:v6, v8];
    waypoints = self->_waypoints;
    self->_waypoints = v9;
  }
  v11 = self->_waypoints;

  return (NSArray *)v11;
}

- (void)setWaypoints:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (id)1
    && (id)[(RoutePlanningWaypointListView *)self editingMode] == (id)2)
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [v4 arrayByAddingObject:v5];

    id v7 = sub_1009998B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Inserted additional waypoint to ensure we have a minimum of two", buf, 2u);
    }

    id v4 = (id)v6;
  }
  unint64_t v8 = self->_waypoints;
  unint64_t v9 = (unint64_t)v4;
  if (v9 | v8)
  {
    unsigned __int8 v10 = [(id)v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      v11 = sub_1009998B0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Updating waypoints...", v14, 2u);
      }

      v12 = (NSMutableArray *)[(id)v9 mutableCopy];
      waypoints = self->_waypoints;
      self->_waypoints = v12;

      [(RoutePlanningWaypointListView *)self _reloadAllRows];
    }
  }
}

- (unint64_t)userAddedWaypointCount
{
  v2 = [(RoutePlanningWaypointListView *)self waypoints];
  v3 = sub_1000AC254(v2, &stru_101312838);
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)refreshWaypointDisplay
{
  if (self->_waypoints) {
    [(RoutePlanningWaypointListView *)self _reloadAllRows];
  }
}

- (void)_reloadAllRows
{
  v3 = objc_opt_new();
  id v4 = [(RoutePlanningWaypointListView *)self waypoints];
  id v5 = (const char *)[v4 count];
  uint64_t v6 = sub_1009998B0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v59 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Reloading all rows for %lu waypoints", buf, 0xCu);
    }

    [(RoutePlanningWaypointListView *)self setHidden:0];
    self->_hasCollapsedStops = 0;
    unint64_t UInteger = GEOConfigGetUInteger();
    BOOL v9 = 0;
    if ([(RoutePlanningWaypointListView *)self mprEnabled])
    {
      if (UInteger) {
        BOOL v9 = [(RoutePlanningWaypointListView *)self userAddedWaypointCount] < UInteger;
      }
      else {
        BOOL v9 = 1;
      }
    }
    if (self->_expandedStops
      || ![(RoutePlanningWaypointListView *)self _supportsCollapsingStops])
    {
      goto LABEL_18;
    }
    uint64_t v11 = sub_1000BBB44(self);
    unint64_t v12 = 4;
    if (v11 == 5) {
      unint64_t v12 = 9;
    }
    if ((unint64_t)v5 > v12 && [(RoutePlanningWaypointListView *)self mprEnabled])
    {
      self->_hasCollapsedStops = 1;
      v13 = [RoutePlanningWaypointCell alloc];
      v14 = [v4 firstObject];
      v69 = v14;
      v15 = +[NSArray arrayWithObjects:&v69 count:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
      v17 = [(RoutePlanningWaypointCell *)v13 initWithWaypoints:v15 waypointIndex:&off_1013A9DF0 editable:0 delegate:self waypointInfoProvider:WeakRetained cellIndex:0];
      [v3 addObject:v17];

      v18 = [RoutePlanningWaypointCell alloc];
      v19 = [v4 subarrayWithRange:1, v5 - 2];
      double v20 = [(RoutePlanningWaypointCell *)v18 initWithWaypoints:v19 waypointIndex:0 editable:0 delegate:self waypointInfoProvider:0 cellIndex:1];
      [v3 addObject:v20];

      double v21 = [RoutePlanningWaypointCell alloc];
      uint64_t v22 = [v4 lastObject];
      v68 = v22;
      v23 = +[NSArray arrayWithObjects:&v68 count:1];
      BOOL v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v4 count] - 1);
      id v25 = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
      double v26 = [(RoutePlanningWaypointCell *)v21 initWithWaypoints:v23 waypointIndex:v24 editable:0 delegate:self waypointInfoProvider:v25 cellIndex:2];
      [v3 addObject:v26];
    }
    else
    {
LABEL_18:
      BOOL v27 = (id)[(RoutePlanningWaypointListView *)self editingMode] == (id)2;
      unsigned int v28 = [(RoutePlanningWaypointListView *)self mprEnabled];
      uint64_t v29 = 2;
      if ((unint64_t)v5 < 2) {
        uint64_t v29 = (uint64_t)v5;
      }
      if (!v28) {
        id v5 = (const char *)v29;
      }
      if ((unint64_t)v5 <= 1)
      {
        v49 = sub_1005762E4();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = +[NSString stringWithFormat:@"waypointDisplayCount is %lu, should be >= 2", 1];
          *(_DWORD *)buf = 136316162;
          v59 = "-[RoutePlanningWaypointListView _reloadAllRows]";
          __int16 v60 = 2080;
          v61 = "RoutePlanningWaypointListView.m";
          __int16 v62 = 1024;
          int v63 = 267;
          __int16 v64 = 2080;
          v65 = "waypointDisplayCount >= 2";
          __int16 v66 = 2112;
          v67 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
        }
        if (sub_100BB36BC())
        {
          v51 = sub_1005762E4();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            id v52 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v59 = v52;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      uint64_t v22 = [v4 subarrayWithRange:0, v5];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10099A3D4;
      v53[3] = &unk_101312860;
      BOOL v57 = v27;
      id v54 = v3;
      id v55 = self;
      v56 = v5;
      [v22 enumerateObjectsUsingBlock:v53];
      v23 = v54;
    }

    double v30 = [(RoutePlanningWaypointListView *)self _findLastEmptyWaypointCell:v3];
    objc_storeWeak((id *)&self->_lastEmptyWaypointCell, v30);

    if (v9)
    {
      uint64_t v31 = objc_opt_new();
      [v3 addObject:v31];

      double v32 = [v3 lastObject];
      objc_storeWeak((id *)&self->_addStopCell, v32);

      id v33 = objc_loadWeakRetained((id *)&self->_addStopCell);
      [v33 setIconViewTag:10101];

      BOOL v34 = [(RoutePlanningWaypointListView *)self _shouldEnableAddStopCell];
      id v35 = objc_loadWeakRetained((id *)&self->_addStopCell);
      [v35 setEnabled:v34];
    }
    [(RoutePlanningWaypointTableView *)self->_tableView separatorInset];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = [v3 firstObject];
    [v42 preferredSeparatorInset];
    double v44 = v43;

    -[RoutePlanningWaypointTableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", v37, v44, v39, v41);
    unint64_t selectedIndex = self->_selectedIndex;
    if (selectedIndex == 0x7FFFFFFFFFFFFFFFLL
      || selectedIndex >= (unint64_t)[v3 count]
      || (([v3 objectAtIndexedSubscript:self->_selectedIndex],
           v46 = objc_claimAutoreleasedReturnValue(),
           objc_opt_class(),
           (objc_opt_isKindOfClass() & 1) == 0)
        ? (v47 = 0)
        : (v47 = v46),
          id v48 = v47,
          v46,
          !v48))
    {
      v46 = 0;
      self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_storeStrong((id *)&self->_rows, v3);
    [(RoutePlanningWaypointListView *)self invalidateIntrinsicContentSize];
    [(RoutePlanningWaypointTableView *)self->_tableView reloadData];
    [(RoutePlanningWaypointListView *)self _restoreCurrentlySelectedEditingIfNeeded:v46];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "No waypoints, clear list", buf, 2u);
    }

    self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_activelyEditingSelectedField = 0;
    rows = self->_rows;
    self->_rows = 0;

    objc_storeWeak((id *)&self->_addStopCell, 0);
    self->_hasCollapsedStops = 0;
    [(RoutePlanningWaypointListView *)self setHidden:1];
    [(RoutePlanningWaypointListView *)self invalidateIntrinsicContentSize];
    [(RoutePlanningWaypointTableView *)self->_tableView reloadData];
    [(RoutePlanningWaypointListView *)self _layoutDottedLines];
    [(RoutePlanningWaypointListView *)self _updateLayoutGuideForCurrentlyEditingField];
  }
}

- (BOOL)replaceWaypointAtIndex:(unint64_t)a3 withWaypoint:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(RoutePlanningWaypointListView *)self cellForIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;

  BOOL v10 = 0;
  if ((id)[(RoutePlanningWaypointListView *)self editingMode] == (id)2 && v9)
  {
    if ([v9 isEditable])
    {
      uint64_t v11 = sub_1009998B0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v26 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will replace waypoint at index %lu", buf, 0xCu);
      }

      BOOL v22 = (id)[(RoutePlanningWaypointListView *)self editingMode] == (id)2;
      unint64_t v12 = [RoutePlanningWaypointCell alloc];
      id v24 = v6;
      BOOL v10 = 1;
      v13 = +[NSArray arrayWithObjects:&v24 count:1];
      v14 = +[NSNumber numberWithUnsignedInteger:a3];
      v15 = [v9 delegate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
      v17 = [(RoutePlanningWaypointCell *)v12 initWithWaypoints:v13 waypointIndex:v14 editable:v22 delegate:v15 waypointInfoProvider:WeakRetained cellIndex:a3];

      [v9 prepareForReplacement];
      [(NSMutableArray *)self->_rows replaceObjectAtIndex:a3 withObject:v17];
      [(NSMutableArray *)self->_waypoints replaceObjectAtIndex:a3 withObject:v6];
      tableView = self->_tableView;
      v19 = +[NSIndexPath indexPathForRow:a3 inSection:0];
      v23 = v19;
      double v20 = +[NSArray arrayWithObjects:&v23 count:1];
      [(RoutePlanningWaypointTableView *)tableView reloadRowsAtIndexPaths:v20 withRowAnimation:5];

      [(RoutePlanningWaypointListView *)self _refreshAddStopCellEnabled];
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (void)setMprEnabled:(BOOL)a3
{
  if (self->_mprEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1009998B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      BOOL v7 = v6;
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Toggling MPR enabled -> %{public}@", (uint8_t *)&v8, 0xCu);
    }
    self->_mprEnabled = v3;
    [(RoutePlanningWaypointListView *)self _reloadAllRows];
  }
}

- (CGSize)intrinsicContentSize
{
  [(RoutePlanningWaypointListView *)self _contentHeight];
  double v4 = v3;
  if ([(RoutePlanningWaypointTableView *)self->_tableView isScrollEnabled]
    && sub_1000BBB44(self) != 5)
  {
    id v5 = [(RoutePlanningWaypointListView *)self traitCollection];
    if ([v5 verticalSizeClass] == (id)1) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
    if (WeakRetained) {
      unint64_t v8 = v6 + 1;
    }
    else {
      unint64_t v8 = v6;
    }
    double v9 = (double)v8;
    [(RoutePlanningWaypointTableView *)self->_tableView rowHeight];
    if (v4 >= v10 * v9)
    {
      [(RoutePlanningWaypointTableView *)self->_tableView rowHeight];
      double v4 = v11 * v9;
    }
  }
  double v12 = UIViewNoIntrinsicMetric;
  double v13 = v4;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)_rowHeight
{
  if (sub_1000BBB44(self) == 5)
  {
    if (sub_1000BBB44(self) == 5) {
      return 28.0;
    }
    else {
      return 44.0;
    }
  }
  else
  {
    if (qword_101610258 != -1) {
      dispatch_once(&qword_101610258, &stru_101312880);
    }
    double v4 = (void *)qword_101610250;
    id v5 = [(RoutePlanningWaypointListView *)self traitCollection];
    uint64_t v6 = [v5 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
    BOOL v7 = [v4 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

    [v7 _mapkit_lineHeight];
    double v9 = v8 + 22.0;
    uint64_t v10 = sub_1000BBB44(self);
    double v11 = 44.0;
    if (v10 == 5) {
      double v11 = 28.0;
    }
    if (v9 <= v11)
    {
      if (sub_1000BBB44(self) == 5) {
        double v3 = 28.0;
      }
      else {
        double v3 = 44.0;
      }
    }
    else
    {
      [v7 _mapkit_lineHeight];
      double v3 = v12 + 22.0;
    }
  }
  return v3;
}

- (double)_contentHeight
{
  [(RoutePlanningWaypointListView *)self _rowHeight];
  return v3 * (double)(unint64_t)[(NSMutableArray *)self->_rows count];
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)selectRowIndex:(unint64_t)a3
{
  id v5 = [(RoutePlanningWaypointListView *)self waypoints];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    if (![(RoutePlanningWaypointListView *)self mprEnabled]) {
      return;
    }
    double v11 = sub_1009998B0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Selected Add Stop index, will add stop", (uint8_t *)&v17, 2u);
    }

    id v10 = [(RoutePlanningWaypointListView *)self delegate];
    [v10 waypointListViewDidSelectAddStop:self];
  }
  else
  {
    BOOL v7 = sub_1009998B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134217984;
      v18 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Selecting row at index %lu", (uint8_t *)&v17, 0xCu);
    }

    self->_activelyEditingSelectedField = 0;
    self->_unint64_t selectedIndex = a3;
    if ((unint64_t)[(NSMutableArray *)self->_rows count] <= a3)
    {
      id v10 = 0;
    }
    else
    {
      double v8 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v9 = v8;
      }
      else {
        double v9 = 0;
      }
      id v10 = v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSString stringWithFormat:@"Can only select waypoint cells"];
        int v17 = 136316162;
        v18 = "-[RoutePlanningWaypointListView selectRowIndex:]";
        __int16 v19 = 2080;
        double v20 = "RoutePlanningWaypointListView.m";
        __int16 v21 = 1024;
        int v22 = 396;
        __int16 v23 = 2080;
        id v24 = "[cell isKindOfClass:[RoutePlanningWaypointCell class]]";
        __int16 v25 = 2112;
        unint64_t v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v17, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = +[NSThread callStackSymbols];
          int v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    if (v10)
    {
      double v12 = [v10 window];
      [(RoutePlanningWaypointListView *)self scrollWaypointCellToVisible:v10 animated:v12 != 0];

      [v10 beginEditing];
    }
  }
}

- (void)selectNextSearchField
{
  unint64_t v3 = [(RoutePlanningWaypointListView *)self selectedIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v4 = v3 + 1, v3 + 1 > [(RoutePlanningWaypointListView *)self indexForLastWaypointCell]))
  {
    id v5 = sub_1009998B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Found no next field to select, will deselect all", v7, 2u);
    }

    [(RoutePlanningWaypointListView *)self deselectAllRows];
  }
  else
  {
    id v6 = sub_1009998B0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Select next search field", buf, 2u);
    }

    [(RoutePlanningWaypointListView *)self selectRowIndex:v4];
  }
}

- (void)_restoreCurrentlySelectedEditingIfNeeded:(id)a3
{
  id v4 = a3;
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (selectedIndex < (unint64_t)[(NSMutableArray *)self->_rows count]
      && (([(NSMutableArray *)self->_rows objectAtIndexedSubscript:selectedIndex],
           id v6 = objc_claimAutoreleasedReturnValue(),
           objc_opt_class(),
           (objc_opt_isKindOfClass() & 1) == 0)
        ? (BOOL v7 = 0)
        : (BOOL v7 = v6),
          id v8 = v7,
          v6,
          v8))
    {
      double v9 = [v8 waypoints];
      id v10 = [v9 count];

      if ((unint64_t)v10 < 2)
      {
        double v13 = sub_1009998B0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v19 = 134217984;
          double v20 = (const char *)selectedIndex;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Restoring editing for currently selected row at index %lu", (uint8_t *)&v19, 0xCu);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = sub_1005762E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = +[NSString stringWithFormat:@"Can only select waypoint cells"];
            int v19 = 136316162;
            double v20 = "-[RoutePlanningWaypointListView _restoreCurrentlySelectedEditingIfNeeded:]";
            __int16 v21 = 2080;
            int v22 = "RoutePlanningWaypointListView.m";
            __int16 v23 = 1024;
            int v24 = 432;
            __int16 v25 = 2080;
            unint64_t v26 = "[cell isKindOfClass:[RoutePlanningWaypointCell class]]";
            __int16 v27 = 2112;
            unsigned int v28 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v19, 0x30u);
          }
          if (sub_100BB36BC())
          {
            int v17 = sub_1005762E4();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = +[NSThread callStackSymbols];
              int v19 = 138412290;
              double v20 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
            }
          }
        }
        v14 = [v8 window];
        [(RoutePlanningWaypointListView *)self scrollWaypointCellToVisible:v8 animated:v14 != 0];

        [v8 beginEditing];
        goto LABEL_13;
      }
      double v11 = "cell at index has collapsed waypoints";
    }
    else
    {
      id v6 = 0;
      double v11 = "cell is nil";
    }
    double v12 = sub_1009998B0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136446210;
      double v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Clearing previous selection/editing and forcing no autocomplete: %{public}s", (uint8_t *)&v19, 0xCu);
    }

    self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_activelyEditingSelectedField = 0;
    [(RoutePlanningWaypointListView *)self cellDidStopEditing:v4];
LABEL_13:
  }
}

- (void)deselectAllRows
{
  unint64_t v3 = sub_1009998B0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Deselect all rows", buf, 2u);
  }

  self->_activelyEditingSelectedField = 0;
  self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_rows;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 endEditing:v10];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)scrollWaypointCellToVisible:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_rows indexOfObject:v6];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v7;
    double v9 = sub_1009998B0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218242;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Scrolling to frame cell at index %lu: %@", (uint8_t *)&v12, 0x16u);
    }

    tableView = self->_tableView;
    long long v11 = +[NSIndexPath indexPathForRow:v8 inSection:0];
    [(RoutePlanningWaypointTableView *)tableView scrollToRowAtIndexPath:v11 atScrollPosition:1 animated:v4];
  }
}

- (unint64_t)searchFieldIndexForWaypoints:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSMutableArray *)self->_rows count])
    {
      unint64_t v5 = 0;
      while (1)
      {
        id v6 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:v5];
        }
        else
        {
          id v7 = 0;
        }

        id v8 = [v7 waypoints];

        if (v8 == v4) {
          break;
        }
        if (++v5 >= (unint64_t)[(NSMutableArray *)self->_rows count]) {
          goto LABEL_9;
        }
      }
    }
    else
    {
LABEL_9:
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        long long v10 = +[NSString stringWithFormat:@"The waypoints (%@) should be in the list (%@)", v4, self->_waypoints];
        *(_DWORD *)buf = 136315906;
        id v15 = "-[RoutePlanningWaypointListView searchFieldIndexForWaypoints:]";
        __int16 v16 = 2080;
        int v17 = "RoutePlanningWaypointListView.m";
        __int16 v18 = 1024;
        int v19 = 469;
        __int16 v20 = 2112;
        __int16 v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (sub_100BB36BC())
      {
        long long v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          id v15 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)indexForLastWaypointCell
{
  return (unint64_t)[(NSMutableArray *)self->_rows indexOfObjectWithOptions:2 passingTest:&stru_1013128C0];
}

- (id)cellForIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_rows count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)numberOfRows
{
  return (unint64_t)[(NSMutableArray *)self->_rows count];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointListView;
  id v4 = a3;
  [(RoutePlanningWaypointListView *)&v8 traitCollectionDidChange:v4];
  unint64_t v5 = [(RoutePlanningWaypointListView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(RoutePlanningWaypointListView *)self _reloadAllRows];
  }
}

- (void)_layoutDottedLines
{
  if (([(RoutePlanningWaypointTableView *)self->_tableView hasUncommittedUpdates] & 1) == 0)
  {
    if ([(NSMutableArray *)self->_rows count]) {
      unint64_t v3 = (char *)[(NSMutableArray *)self->_rows count] - 1;
    }
    else {
      unint64_t v3 = 0;
    }
    if (v3 != [(NSMutableArray *)self->_dottedLines count])
    {
      for (i = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
            v3;
            --v3)
      {
        uint64_t v5 = [(NSMutableArray *)self->_dottedLines lastObject];
        if (v5)
        {
          id v6 = (TransitDirectionsColoredLine *)v5;
          [(NSMutableArray *)self->_dottedLines removeLastObject];
        }
        else
        {
          id v6 = [[TransitDirectionsColoredLine alloc] initWithStyle:3];
          [(TransitDirectionsColoredLine *)v6 setAutoresizingMask:16];
          id v7 = +[UIColor systemGrayColor];
          [(TransitDirectionsColoredLine *)v6 setLineColor:v7];

          [(RoutePlanningWaypointTableView *)self->_tableView addSubview:v6];
        }
        [(NSMutableArray *)i addObject:v6];
        [(RoutePlanningWaypointTableView *)self->_tableView sendSubviewToBack:v6];
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      objc_super v8 = self->_dottedLines;
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          int v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * (void)v12) removeFromSuperview];
            int v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      dottedLines = self->_dottedLines;
      self->_dottedLines = i;
    }
    __int16 v14 = self->_dottedLines;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10099BBF8;
    v15[3] = &unk_1013128E8;
    v15[4] = self;
    [(NSMutableArray *)v14 enumerateObjectsUsingBlock:v15];
  }
}

- (void)_layoutDottedLineForCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(NSMutableArray *)self->_dottedLines count];
  if (v8 != (char *)[(NSMutableArray *)self->_rows count] - 1)
  {
    v58 = sub_1005762E4();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v71 = "-[RoutePlanningWaypointListView _layoutDottedLineForCell:atIndexPath:]";
      __int16 v72 = 2080;
      v73 = "RoutePlanningWaypointListView.m";
      __int16 v74 = 1024;
      int v75 = 550;
      __int16 v76 = 2080;
      v77 = "_dottedLines.count == _rows.count - 1";
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v59 = sub_1005762E4();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        __int16 v60 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v71 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v9 = (char *)[v7 row];
  if ([(NSMutableArray *)self->_rows count] != v9 + 1)
  {
    id v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:");
    [v6 layoutIfNeeded];
    [v10 layoutIfNeeded];
    uint64_t v11 = [v6 viewWithTag:10101];
    int v12 = [v10 viewWithTag:10101];
    uint64_t v13 = [v11 window];
    if (v13)
    {
      __int16 v14 = (void *)v13;
      id v15 = [v12 window];

      if (v15)
      {
        tableView = self->_tableView;
        [v11 frame];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        __int16 v25 = [v11 superview];
        -[RoutePlanningWaypointTableView convertRect:fromView:](tableView, "convertRect:fromView:", v25, v18, v20, v22, v24);
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;

        BOOL v34 = self->_tableView;
        [v12 frame];
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
        double v43 = [v12 superview];
        -[RoutePlanningWaypointTableView convertRect:fromView:](v34, "convertRect:fromView:", v43, v36, v38, v40, v42);
        CGFloat v62 = v45;
        CGFloat v63 = v44;
        CGFloat rect = v46;
        CGFloat v48 = v47;

        sub_1000BBB44(v6);
        v78.origin.x = v27;
        v78.origin.double y = v29;
        v78.size.double width = v31;
        v78.size.double height = v33;
        CGRectGetMidX(v78);
        v79.origin.x = v27;
        v79.origin.double y = v29;
        v79.size.double width = v31;
        v79.size.double height = v33;
        CGRectGetMaxY(v79);
        v80.origin.double y = v62;
        v80.origin.x = v63;
        v80.size.double width = rect;
        v80.size.double height = v48;
        CGRectGetMinY(v80);
        v81.origin.x = v27;
        v81.origin.double y = v29;
        v81.size.double width = v31;
        v81.size.double height = v33;
        CGRectGetMaxY(v81);
        UIRectRoundToViewScale();
        uint64_t v50 = v49;
        uint64_t v52 = v51;
        uint64_t v54 = v53;
        uint64_t v56 = v55;
        [(NSMutableArray *)self->_dottedLines objectAtIndexedSubscript:v9];
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_10099C134;
        v64[3] = &unk_1012E9418;
        id v65 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v66 = v50;
        uint64_t v67 = v52;
        uint64_t v68 = v54;
        uint64_t v69 = v56;
        id v57 = v65;
        +[UIView performWithoutAnimation:v64];
      }
    }
  }
}

- (BOOL)addStop
{
  if ((id)[(RoutePlanningWaypointListView *)self editingMode] != (id)2)
  {
    id WeakRetained = sub_1009998B0();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v18 = 0;
      long long v16 = "Will not add stop, incorrect editing mode";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEBUG, v16, v18, 2u);
    }
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  unsigned __int8 v3 = [(RoutePlanningWaypointListView *)self _shouldEnableAddStopCell];
  id WeakRetained = sub_1009998B0();
  BOOL v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      *(_WORD *)double v18 = 0;
      long long v16 = "Will not add stop, row should not be enabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v5)
  {
    *(_WORD *)double v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEBUG, "Will add stop", v18, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
  id v6 = objc_alloc_init(SearchFieldItem);
  BOOL v7 = (id)[(RoutePlanningWaypointListView *)self editingMode] == (id)2;
  objc_super v8 = [RoutePlanningWaypointCell alloc];
  double v20 = v6;
  BOOL v9 = 1;
  id v10 = +[NSArray arrayWithObjects:&v20 count:1];
  uint64_t v11 = [(RoutePlanningWaypointCell *)v8 initWithWaypoints:v10 waypointIndex:0 editable:v7 delegate:self waypointInfoProvider:0 cellIndex:[(NSMutableArray *)self->_rows count]];

  int v12 = (char *)[(NSMutableArray *)self->_rows count] - (WeakRetained != 0);
  [(NSMutableArray *)self->_rows insertObject:v11 atIndex:v12];
  [(NSMutableArray *)self->_waypoints insertObject:v6 atIndex:v12];
  tableView = self->_tableView;
  __int16 v14 = +[NSIndexPath indexPathForRow:v12 inSection:0];
  double v19 = v14;
  id v15 = +[NSArray arrayWithObjects:&v19 count:1];
  [(RoutePlanningWaypointTableView *)tableView insertRowsAtIndexPaths:v15 withRowAnimation:100];

  [(RoutePlanningWaypointListView *)self _refreshAddStopCellEnabled];
  [(RoutePlanningWaypointListView *)self _layoutDottedLines];
  [(RoutePlanningWaypointListView *)self invalidateIntrinsicContentSize];

LABEL_12:
  return v9;
}

- (BOOL)_shouldEnableAddStopCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEmptyWaypointCell);

  if (WeakRetained)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unint64_t UInteger = GEOConfigGetUInteger();
    BOOL v4 = [(RoutePlanningWaypointListView *)self mprEnabled];
    if (v4)
    {
      if (UInteger) {
        LOBYTE(v4) = [(RoutePlanningWaypointListView *)self userAddedWaypointCount] < UInteger;
      }
      else {
        LOBYTE(v4) = 1;
      }
    }
  }
  return v4;
}

- (id)_findLastEmptyWaypointCell:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001041B4;
  uint64_t v11 = sub_100104958;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10099C564;
  v6[3] = &unk_101312910;
  v6[4] = &v7;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_refreshAddStopCellEnabled
{
  id v3 = [(RoutePlanningWaypointListView *)self _findLastEmptyWaypointCell:self->_rows];
  objc_storeWeak((id *)&self->_lastEmptyWaypointCell, v3);

  BOOL v4 = [(RoutePlanningWaypointListView *)self _shouldEnableAddStopCell];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
  [WeakRetained setEnabled:v4];
}

- (BOOL)hasExpandedStops
{
  return self->_expandedStops;
}

- (void)expandStopsIfNeeded
{
  if (!self->_expandedStops)
  {
    id v3 = sub_1009998B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will now show all stops", buf, 2u);
    }

    self->_expandedStops = 1;
    self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (self->_hasCollapsedStops)
    {
      BOOL v4 = sub_1009998B0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Reloading rows because we had collapsed stops", v5, 2u);
      }

      [(RoutePlanningWaypointListView *)self _reloadAllRows];
    }
  }
}

- (void)collapseStopsIfNeeded
{
  if ([(RoutePlanningWaypointListView *)self _supportsCollapsingStops]
    && self->_expandedStops)
  {
    self->_expandedStops = 0;
    self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    id v3 = sub_1009998B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will now show reduced/collapsed stops", buf, 2u);
    }

    id v4 = [(NSMutableArray *)self->_waypoints count];
    uint64_t v5 = sub_1000BBB44(self);
    unint64_t v6 = 4;
    if (v5 == 5) {
      unint64_t v6 = 9;
    }
    if ((unint64_t)v4 > v6)
    {
      uint64_t v7 = sub_1009998B0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)objc_super v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Reloading because we have enough stops that we should collapse them", v8, 2u);
      }

      [(RoutePlanningWaypointListView *)self _reloadAllRows];
    }
  }
}

- (BOOL)_supportsCollapsingStops
{
  if ([(RoutePlanningWaypointListView *)self editingMode] < 2) {
    return 1;
  }
  if (sub_1000BBB44(self) != 5) {
    return 0;
  }

  return GEOConfigGetBOOL();
}

- (void)cellDidStartEditing:(id)a3 withUserInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_unint64_t selectedIndex = (unint64_t)[(NSMutableArray *)self->_rows indexOfObject:v6];
  uint64_t v7 = sub_1009998B0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t selectedIndex = self->_selectedIndex;
    int v19 = 134217984;
    unint64_t v20 = selectedIndex;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Did start editing field at index %lu", (uint8_t *)&v19, 0xCu);
  }

  [(RoutePlanningWaypointListView *)self _updateLayoutGuideForCurrentlyEditingField];
  if (self->_activelyEditingSelectedField == v4)
  {
    [(RoutePlanningWaypointListView *)self scrollWaypointCellToVisible:v6 animated:1];
    if (!v4) {
      goto LABEL_15;
    }
  }
  else
  {
    self->_activelyEditingSelectedField = v4;
    if (!v4)
    {
      [(RoutePlanningWaypointListView *)self scrollWaypointCellToVisible:v6 animated:1];
      goto LABEL_15;
    }
    uint64_t v9 = [(RoutePlanningWaypointListView *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(RoutePlanningWaypointListView *)self delegate];
      [v11 waypointListView:self didStartEditingWaypointAtIndex:self->_selectedIndex];
    }
    id v12 = [(RoutePlanningWaypointListView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      __int16 v14 = [(RoutePlanningWaypointListView *)self delegate];
      [v14 didInteractWithWaypointFields];
    }
    [(RoutePlanningWaypointListView *)self scrollWaypointCellToVisible:v6 animated:1];
  }
  id v15 = [(RoutePlanningWaypointListView *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    double v17 = [(RoutePlanningWaypointListView *)self delegate];
    double v18 = [v6 currentText];
    [v17 updateAutoCompleteWithText:v18];
  }
LABEL_15:
}

- (void)cellDidStopEditing:(id)a3
{
  BOOL v4 = [(RoutePlanningWaypointListView *)self _shouldEnableAddStopCell];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
  [WeakRetained setEnabled:v4];

  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(RoutePlanningWaypointListView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      objc_super v8 = sub_1009998B0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        unint64_t selectedIndex = self->_selectedIndex;
        int v11 = 134217984;
        unint64_t v12 = selectedIndex;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Did stop editing field at index %lu", (uint8_t *)&v11, 0xCu);
      }

      char v10 = [(RoutePlanningWaypointListView *)self delegate];
      [v10 updateAutoCompleteWithText:0];
    }
  }
}

- (void)cell:(id)a3 didChangeInputText:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEmptyWaypointCell);
  if (WeakRetained == v16 && [v6 length])
  {

LABEL_7:
    [(RoutePlanningWaypointListView *)self _refreshAddStopCellEnabled];
    goto LABEL_9;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_lastEmptyWaypointCell);
  if (v8 == v16)
  {

    goto LABEL_9;
  }
  id v9 = [v6 length];

  if (!v9) {
    goto LABEL_7;
  }
LABEL_9:
  if (!self->_activelyEditingSelectedField)
  {
    self->_activelyEditingSelectedField = 1;
    char v10 = [(RoutePlanningWaypointListView *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      unint64_t v12 = [(RoutePlanningWaypointListView *)self delegate];
      [v12 didInteractWithWaypointFields];
    }
  }
  char v13 = [(RoutePlanningWaypointListView *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(RoutePlanningWaypointListView *)self delegate];
    [v15 updateAutoCompleteWithText:v6];
  }
}

- (void)cell:(id)a3 didReceiveMapItem:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!self->_activelyEditingSelectedField)
  {
    self->_activelyEditingSelectedField = 1;
    char v7 = [(RoutePlanningWaypointListView *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(RoutePlanningWaypointListView *)self delegate];
      [v9 didInteractWithWaypointFields];
    }
  }
  char v10 = [(RoutePlanningWaypointListView *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    unint64_t v12 = [[SearchResult alloc] initWithMapItem:v6];
    char v13 = +[SearchFieldItem searchFieldItemWithObject:v12];
    char v14 = [(RoutePlanningWaypointListView *)self delegate];
    [v14 waypointListView:self didReceiveItem:v13];
  }
}

- (void)cellDidRequestSearch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RoutePlanningWaypointListView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = sub_1009998B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)char v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will request search", v13, 2u);
    }

    if (!self->_activelyEditingSelectedField)
    {
      self->_activelyEditingSelectedField = 1;
      char v8 = [(RoutePlanningWaypointListView *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        char v10 = [(RoutePlanningWaypointListView *)self delegate];
        [v10 didInteractWithWaypointFields];
      }
    }
    self->_unint64_t selectedIndex = (unint64_t)[(NSMutableArray *)self->_rows indexOfObject:v4];
    char v11 = [(RoutePlanningWaypointListView *)self delegate];
    unint64_t v12 = [v4 currentText];
    [v11 invokeSearchWithText:v12];
  }
}

- (void)cellDidClearInputText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1009998B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)char v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Did clear input text", v9, 2u);
  }

  char v6 = [(RoutePlanningWaypointListView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(RoutePlanningWaypointListView *)self delegate];
    [v8 waypointListView:self didClearInputTextForWaypointAtIndex:[self->_rows indexOfObject:v4]];
  }
}

- (id)contextMenuForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_rows indexOfObject:v4];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL
    || (char v6 = v5,
        ![(RoutePlanningWaypointListView *)self canDeleteWaypointForCellAtIndex:v5]))
  {
    char v11 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    char v7 = +[NSBundle mainBundle];
    char v8 = [v7 localizedStringForKey:@"[RoutePlanning] Delete" value:@"localized string not found" table:0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10099D3C8;
    v13[3] = &unk_1012F16D0;
    objc_copyWeak(v14, &location);
    v14[1] = v6;
    char v9 = +[UIAction actionWithTitle:v8 image:0 identifier:0 handler:v13];

    id v16 = v9;
    char v10 = +[NSArray arrayWithObjects:&v16 count:1];
    char v11 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v10];

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_rows count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  rows = self->_rows;
  id v5 = [a4 row:a3];

  return [(NSMutableArray *)rows objectAtIndexedSubscript:v5];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  char v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", [v5 row]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    char v9 = [v8 waypoints];
    if ((unint64_t)[v9 count] <= 1)
    {
    }
    else
    {
      unsigned __int8 v10 = [(RoutePlanningWaypointListView *)self _supportsCollapsingStops];

      if (v10) {
        goto LABEL_10;
      }
    }
  }
  if ((id)[(RoutePlanningWaypointListView *)self editingMode] == (id)1)
  {
LABEL_10:
    unsigned __int8 v11 = 1;
    goto LABEL_18;
  }
  unint64_t v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", [v5 row]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v13 = v12;
  }
  else {
    char v13 = 0;
  }
  id v14 = v13;

  if (v14) {
    unsigned __int8 v11 = [v14 isEnabled];
  }
  else {
    unsigned __int8 v11 = 0;
  }

LABEL_18:
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  char v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", [v6 row]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 waypoints];
    if ((unint64_t)[v8 count] >= 2
      && [(RoutePlanningWaypointListView *)self _supportsCollapsingStops])
    {
      char v9 = sub_1009998B0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v36) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did select collapsed stops", (uint8_t *)&v36, 2u);
      }

      unsigned __int8 v10 = [(RoutePlanningWaypointListView *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
      {
        double v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v36 = 136315906;
          double v37 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
          __int16 v38 = 2080;
          double v39 = "RoutePlanningWaypointListView.m";
          __int16 v40 = 1024;
          int v41 = 855;
          __int16 v42 = 2080;
          double v43 = "[self.delegate respondsToSelector:@selector(waypointListView:didSelectCollapsedWaypoints:)]";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v36, 0x26u);
        }

        if (sub_100BB36BC())
        {
          double v23 = sub_1005762E4();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            double v24 = +[NSThread callStackSymbols];
            int v36 = 138412290;
            double v37 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
          }
        }
      }
      unint64_t v12 = [(RoutePlanningWaypointListView *)self delegate];
      [v12 waypointListView:self didSelectCollapsedWaypoints:v8];
LABEL_23:

LABEL_29:
      goto LABEL_30;
    }
    if ([(RoutePlanningWaypointListView *)self editingMode] <= 1)
    {
      char v13 = [(RoutePlanningWaypointListView *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = [v6 row];
        unint64_t v16 = (unint64_t)v15;
        if (self->_hasCollapsedStops && v15 == (id)1)
        {
          __int16 v25 = sub_1005762E4();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            int v36 = 136315906;
            double v37 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
            __int16 v38 = 2080;
            double v39 = "RoutePlanningWaypointListView.m";
            __int16 v40 = 1024;
            int v41 = 862;
            __int16 v42 = 2080;
            double v43 = "!_hasCollapsedStops || adjustedIndex != 1";
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v36, 0x26u);
          }

          if (!sub_100BB36BC())
          {
            unint64_t v16 = 1;
            goto LABEL_20;
          }
          double v17 = sub_1005762E4();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            double v26 = +[NSThread callStackSymbols];
            int v36 = 138412290;
            double v37 = v26;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
          }
          unint64_t v16 = 1;
        }
        else
        {
          if (!self->_hasCollapsedStops || (unint64_t)v15 < 2) {
            goto LABEL_20;
          }
          if ((unint64_t)[(NSMutableArray *)self->_rows count] < 3
            || (unint64_t)[(NSMutableArray *)self->_rows count] >= 5)
          {
            CGFloat v27 = sub_1005762E4();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              int v36 = 136315906;
              double v37 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
              __int16 v38 = 2080;
              double v39 = "RoutePlanningWaypointListView.m";
              __int16 v40 = 1024;
              int v41 = 864;
              __int16 v42 = 2080;
              double v43 = "_rows.count >= 3 && _rows.count <= 4";
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v36, 0x26u);
            }

            if (sub_100BB36BC())
            {
              double v28 = sub_1005762E4();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                CGFloat v29 = +[NSThread callStackSymbols];
                int v36 = 138412290;
                double v37 = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
              }
            }
          }
          double v17 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:1];
          double v18 = [v17 waypoints];
          if ((unint64_t)[v18 count] <= 1)
          {
            double v30 = sub_1005762E4();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              int v36 = 136315906;
              double v37 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
              __int16 v38 = 2080;
              double v39 = "RoutePlanningWaypointListView.m";
              __int16 v40 = 1024;
              int v41 = 867;
              __int16 v42 = 2080;
              double v43 = "collapsedWaypoints.count > 1";
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v36, 0x26u);
            }

            if (sub_100BB36BC())
            {
              CGFloat v31 = sub_1005762E4();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                double v32 = +[NSThread callStackSymbols];
                int v36 = 138412290;
                double v37 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
              }
            }
          }
          unint64_t v16 = (unint64_t)[v18 count] + v16 - 1;
          if (v16 >= (unint64_t)[(NSMutableArray *)self->_waypoints count])
          {
            CGFloat v33 = sub_1005762E4();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              int v36 = 136315906;
              double v37 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
              __int16 v38 = 2080;
              double v39 = "RoutePlanningWaypointListView.m";
              __int16 v40 = 1024;
              int v41 = 869;
              __int16 v42 = 2080;
              double v43 = "adjustedIndex < _waypoints.count";
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v36, 0x26u);
            }

            if (sub_100BB36BC())
            {
              BOOL v34 = sub_1005762E4();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                double v35 = +[NSThread callStackSymbols];
                int v36 = 138412290;
                double v37 = v35;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
              }
            }
          }
        }
LABEL_20:
        int v19 = sub_1009998B0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v36 = 134217984;
          double v37 = (const char *)v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Did select waypoint at adjusted index %lu", (uint8_t *)&v36, 0xCu);
        }

        unint64_t v12 = [(RoutePlanningWaypointListView *)self delegate];
        unint64_t v20 = [v8 firstObject];
        [v12 waypointListView:self didSelectWaypoint:v20 atIndex:v16];

        goto LABEL_23;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v21 = sub_1009998B0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Did select Add Stop", (uint8_t *)&v36, 2u);
    }

    id v8 = [(RoutePlanningWaypointListView *)self delegate];
    [v8 waypointListViewDidSelectAddStop:self];
    goto LABEL_29;
  }
LABEL_30:
}

- (BOOL)_canDeleteWaypoints
{
  id v3 = sub_1000AC254(self->_waypoints, &stru_101312930);
  id v4 = [v3 count];

  return [(RoutePlanningWaypointListView *)self editingMode]
      && [(RoutePlanningWaypointListView *)self mprEnabled]
      && (unint64_t)v4 >= 3
      && !self->_hasCollapsedStops;
}

- (BOOL)canDeleteWaypointForCellAtIndex:(unint64_t)a3
{
  if (![(RoutePlanningWaypointListView *)self _canDeleteWaypoints]
    || (unint64_t)[(NSMutableArray *)self->_rows count] <= a3)
  {
    return 0;
  }
  id v5 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7
    && ([v7 waypoints],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        (unint64_t)v9 <= 1))
  {
    char v11 = [v7 waypoints];
    unint64_t v12 = [v11 firstObject];
    char v13 = [v12 composedWaypoint];
    unsigned __int8 v14 = [v13 isServerProvidedWaypoint];

    char v10 = v14 ^ 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  if ([(RoutePlanningWaypointListView *)self canDeleteWaypointForCellAtIndex:v8])
  {
    objc_initWeak(&location, self);
    id v9 = +[NSBundle mainBundle];
    char v10 = [v9 localizedStringForKey:@"[RoutePlanning] Delete" value:@"localized string not found" table:0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10099E230;
    v15[3] = &unk_101312958;
    objc_copyWeak(v16, &location);
    v16[1] = v8;
    char v11 = +[UIContextualAction contextualActionWithStyle:1 title:v10 handler:v15];
    double v18 = v11;
    unint64_t v12 = +[NSArray arrayWithObjects:&v18 count:1];
    char v13 = +[UISwipeActionsConfiguration configurationWithActions:v12];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)performDeleteAtIndex:(unint64_t)a3
{
  if (!-[RoutePlanningWaypointListView canDeleteWaypointForCellAtIndex:](self, "canDeleteWaypointForCellAtIndex:"))
  {
    unint64_t v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      CGFloat v33 = "-[RoutePlanningWaypointListView performDeleteAtIndex:]";
      __int16 v34 = 2080;
      double v35 = "RoutePlanningWaypointListView.m";
      __int16 v36 = 1024;
      *(_DWORD *)double v37 = 954;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      double v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        double v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        CGFloat v33 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v7 = sub_1009998B0();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    int v19 = self;
    if (!v19)
    {
      double v24 = @"<nil>";
      goto LABEL_36;
    }
    unint64_t v20 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      double v22 = [(RoutePlanningWaypointListView *)v19 performSelector:"accessibilityIdentifier"];
      double v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        double v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_29;
      }
    }
    double v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_29:

LABEL_36:
    rows = v19->_rows;
    *(_DWORD *)buf = 138543874;
    CGFloat v33 = (const char *)v24;
    __int16 v34 = 2048;
    double v35 = (const char *)a3;
    __int16 v36 = 2112;
    *(void *)double v37 = rows;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot delete stop at index (%lu) with rows %@", buf, 0x20u);

    goto LABEL_37;
  }
  [(RoutePlanningWaypointListView *)self deselectAllRows];
  if ((unint64_t)[(NSMutableArray *)self->_rows count] > a3)
  {
    id v5 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if ([(RoutePlanningWaypointListView *)self editingMode]
      && v7
      && ([v7 waypoints],
          id v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = [v8 count],
          v8,
          v9 == (id)1))
    {
      char v10 = sub_1009998B0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        CGFloat v33 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Deleting waypoint at index %lu", buf, 0xCu);
      }

      if (self->_selectedIndex == a3)
      {
        self->_activelyEditingSelectedField = 0;
        self->_unint64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
      }
      char v11 = [(RoutePlanningWaypointListView *)self waypoints];
      unint64_t v12 = [v11 mutableCopy];

      [v12 removeObjectAtIndex:a3];
      [(RoutePlanningWaypointListView *)self setWaypoints:v12];
      [(RoutePlanningWaypointListView *)self _refreshAddStopCellEnabled];
      char v13 = [(RoutePlanningWaypointListView *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = [(RoutePlanningWaypointListView *)self delegate];
        [v15 waypointListView:self didDeleteWaypointAtIndex:a3];
      }
    }
    else
    {
      double v28 = sub_1005762E4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        CGFloat v29 = "add stop cell";
        if (v7) {
          CGFloat v29 = "collapsed waypoint cell";
        }
        double v30 = +[NSString stringWithFormat:@"Trying to delete %s", v29];
        *(_DWORD *)buf = 136316162;
        CGFloat v33 = "-[RoutePlanningWaypointListView performDeleteAtIndex:]";
        __int16 v34 = 2080;
        double v35 = "RoutePlanningWaypointListView.m";
        __int16 v36 = 1024;
        *(_DWORD *)double v37 = 968;
        *(_WORD *)&v37[4] = 2080;
        *(void *)&v37[6] = "validToDelete";
        __int16 v38 = 2112;
        double v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (!sub_100BB36BC()) {
        goto LABEL_37;
      }
      unint64_t v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CGFloat v31 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        CGFloat v33 = v31;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }

LABEL_37:
    return;
  }
  __int16 v25 = sub_1005762E4();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    CGFloat v33 = "-[RoutePlanningWaypointListView performDeleteAtIndex:]";
    __int16 v34 = 2080;
    double v35 = "RoutePlanningWaypointListView.m";
    __int16 v36 = 1024;
    *(_DWORD *)double v37 = 962;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v26 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      CGFloat v33 = v26;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    goto LABEL_37;
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(RoutePlanningWaypointListView *)self editingMode]
    && (id v6 = [v5 row], v6 < -[NSMutableArray count](self->_waypoints, "count"))
    && !self->_hasCollapsedStops)
  {
    id v9 = [(NSMutableArray *)self->_waypoints objectAtIndexedSubscript:v6];
    char v10 = [v9 composedWaypoint];
    unsigned __int8 v11 = [v10 isServerProvidedWaypoint];

    char v7 = v11 ^ 1;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a5;
  char v7 = [(NSMutableArray *)self->_rows lastObject];
  objc_opt_class();
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_rows count] - 1;
  }

  id v9 = (char *)[v6 row];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || (char v10 = v9, (unint64_t)v9 < v8)
    || v9 >= [(NSMutableArray *)self->_rows count])
  {
    id v11 = v6;
  }
  else
  {
    +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10 - 1, [v6 section]);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v12 = v11;

  return v12;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v23 = a4;
  id v7 = a5;
  id v8 = [v23 row];
  id v9 = [v7 row];
  if (v8 != v9)
  {
    id v10 = v9;
    if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
    id v11 = [v23 row];
    id selectedIndex = self->_selectedIndex;
    if (v11 == selectedIndex)
    {
      id selectedIndex = [v7 row];
      self->_id selectedIndex = (unint64_t)selectedIndex;
    }
    if (selectedIndex == (id)0x7FFFFFFFFFFFFFFFLL || selectedIndex >= [(NSMutableArray *)self->_rows count])
    {
LABEL_8:
      char v13 = 0;
    }
    else
    {
      char v13 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:self->_selectedIndex];
    }
    [(NSMutableArray *)self->_rows _maps_moveObjectAtIndex:v8 toIndex:v10];
    [(NSMutableArray *)self->_waypoints _maps_moveObjectAtIndex:v8 toIndex:v10];
    if (v13) {
      self->_id selectedIndex = (unint64_t)[(NSMutableArray *)self->_rows indexOfObject:v13];
    }
    char v14 = [(NSMutableArray *)self->_rows objectAtIndex:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    [v16 setCellIndex:v8];
    double v17 = [(NSMutableArray *)self->_rows objectAtIndex:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v18 = v17;
    }
    else {
      double v18 = 0;
    }
    id v19 = v18;

    [v19 setCellIndex:v10];
    unint64_t v20 = [(RoutePlanningWaypointListView *)self delegate];
    LOBYTE(v19) = objc_opt_respondsToSelector();

    if (v19)
    {
      double v21 = [(RoutePlanningWaypointListView *)self delegate];
      double v22 = [(NSMutableArray *)self->_waypoints objectAtIndexedSubscript:v10];
      [v21 waypointListView:self didMoveWaypoint:v22 fromIndex:v8 toIndex:v10];
    }
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(RoutePlanningWaypointListView *)self _canDeleteWaypoints])
  {
    id v9 = [v7 cellForRowAtIndexPath:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (-[RoutePlanningWaypointListView canDeleteWaypointForCellAtIndex:](self, "canDeleteWaypointForCellAtIndex:", [v8 row]))
    {
      [(RoutePlanningWaypointListView *)self contextMenuForCell:v11];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10099EE98;
      v15[3] = &unk_1012F1000;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = v16;
      char v13 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v15];
    }
    else if (v11)
    {
      char v13 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:0];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(RoutePlanningWaypointListView *)self editingMode] != 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[(NSMutableArray *)self->_rows count] >= 4
    && [(RoutePlanningWaypointListView *)self mprEnabled]
    && !self->_hasCollapsedStops
    && [(RoutePlanningWaypointListView *)self editingMode])
  {
    id v10 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int64_t v8 = 0;
    if ((isKindOfClass & 1) != 0 && v10)
    {
      id v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_waypoints, "objectAtIndexedSubscript:", [v7 row]);
      char v13 = [v12 composedWaypoint];
      unsigned int v14 = [v13 isServerProvidedWaypoint];

      int64_t v8 = v14 ^ 1;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = [a5 row:a3];
    [(RoutePlanningWaypointListView *)self performDeleteAtIndex:v7];
  }
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (BOOL)mprEnabled
{
  return self->_mprEnabled;
}

- (RoutePlanningWaypointListViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningWaypointListViewDelegate *)WeakRetained;
}

- (UILayoutGuide)layoutGuideForCurrentlyEditingField
{
  return self->_layoutGuideForCurrentlyEditingField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuideForCurrentlyEditingField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dottedLines, 0);
  objc_destroyWeak((id *)&self->_addStopCell);
  objc_destroyWeak((id *)&self->_lastEmptyWaypointCell);
  objc_storeStrong((id *)&self->_layoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_waypointInfoProvider);
}

@end