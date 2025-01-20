@interface RouteOverviewFieldsView
- (BOOL)hasExpandedWaypoints;
- (BOOL)hasRefinementsBar;
- (NSArray)overrideWaypoints;
- (RouteOverviewFieldsView)initWithDelegate:(id)a3 waypointInfoProvider:(id)a4;
- (RouteOverviewFieldsView)initWithDelegate:(id)a3 waypointInfoProvider:(id)a4 editingMode:(unint64_t)a5;
- (RouteOverviewFieldsViewDelegate)delegate;
- (RoutePlanningWaypointListView)waypointListView;
- (double)estimatedHeight;
- (void)_addRefinementsBar;
- (void)_pressedTiming;
- (void)_removeRefinementsBar;
- (void)collapseWaypointsIfNeeded;
- (void)expandWaypointsIfNeeded;
- (void)reset;
- (void)setHasRefinementsBar:(BOOL)a3;
- (void)setNeedsUpdateRefinements;
- (void)setNeedsUpdateWaypointsList;
- (void)setOverrideWaypoints:(id)a3;
- (void)updateRefinements;
- (void)updateWaypointsList;
@end

@implementation RouteOverviewFieldsView

- (RouteOverviewFieldsView)initWithDelegate:(id)a3 waypointInfoProvider:(id)a4
{
  return [(RouteOverviewFieldsView *)self initWithDelegate:a3 waypointInfoProvider:a4 editingMode:1];
}

- (RouteOverviewFieldsView)initWithDelegate:(id)a3 waypointInfoProvider:(id)a4 editingMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)RouteOverviewFieldsView;
  v10 = -[RouteOverviewFieldsView initWithFrame:](&v43, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = [RoutePlanningWaypointListView alloc];
    v13 = [v8 waypointsForFieldsView:v11];
    v14 = [(RoutePlanningWaypointListView *)v12 initWithWaypoints:v13 editingMode:a5 delegate:v8 waypointInfoProvider:v9];
    waypointListView = v11->_waypointListView;
    v11->_waypointListView = v14;

    id v16 = [v8 transportTypeForFieldsView:v11];
    uint64_t v17 = 0;
    id v41 = v9;
    id v42 = v8;
    switch((unint64_t)v16)
    {
      case 0uLL:
        if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v17 = 1;
        break;
      case 1uLL:
        uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
        goto LABEL_9;
      case 2uLL:
LABEL_6:
        uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
        goto LABEL_9;
      case 5uLL:
        uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_9:
        uint64_t v17 = IsEnabled_DrivingMultiWaypointRoutes;
        break;
      default:
        break;
    }
    [(RoutePlanningWaypointListView *)v11->_waypointListView setMprEnabled:v17];
    [(RoutePlanningWaypointListView *)v11->_waypointListView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RouteOverviewFieldsView *)v11 addSubview:v11->_waypointListView];
    v19 = [(RoutePlanningWaypointListView *)v11->_waypointListView bottomAnchor];
    v20 = [(RouteOverviewFieldsView *)v11 bottomAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    waypointListViewBottomConstraint = v11->_waypointListViewBottomConstraint;
    v11->_waypointListViewBottomConstraint = (NSLayoutConstraint *)v21;

    v40 = [(RoutePlanningWaypointListView *)v11->_waypointListView topAnchor];
    v23 = [(RouteOverviewFieldsView *)v11 topAnchor];
    v24 = [v40 constraintEqualToAnchor:v23];
    v44[0] = v24;
    v25 = [(RoutePlanningWaypointListView *)v11->_waypointListView leadingAnchor];
    v26 = [(RouteOverviewFieldsView *)v11 leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v44[1] = v27;
    v28 = [(RoutePlanningWaypointListView *)v11->_waypointListView trailingAnchor];
    v29 = [(RouteOverviewFieldsView *)v11 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v44[2] = v30;
    v31 = +[NSArray arrayWithObjects:v44 count:3];
    +[NSLayoutConstraint activateConstraints:v31];

    v32 = [RoutePlanningRefinementBarView alloc];
    v33 = [(RouteOverviewFieldsView *)v11 delegate];
    v34 = [v33 currentRefinementsForFieldsView:v11];
    id v8 = v42;
    v35 = [(RoutePlanningRefinementBarView *)v32 initWithDelegate:v42 refinements:v34];
    refinementBarView = v11->_refinementBarView;
    v11->_refinementBarView = v35;

    [(RoutePlanningRefinementBarView *)v11->_refinementBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v37) = 1148846080;
    [(RoutePlanningRefinementBarView *)v11->_refinementBarView setContentHuggingPriority:1 forAxis:v37];
    LODWORD(v38) = 1148846080;
    [(RoutePlanningRefinementBarView *)v11->_refinementBarView setContentCompressionResistancePriority:1 forAxis:v38];
    [(RouteOverviewFieldsView *)v11 _addRefinementsBar];
    v11->_hasRefinementsBar = 1;
    id v9 = v41;
  }

  return v11;
}

- (void)updateWaypointsList
{
  waypointsListUpdateTimer = self->_waypointsListUpdateTimer;
  if (waypointsListUpdateTimer)
  {
    [(GCDTimer *)waypointsListUpdateTimer invalidate];
    v4 = self->_waypointsListUpdateTimer;
    self->_waypointsListUpdateTimer = 0;
  }
  self->_estimatedHeight = 0.0;
  v5 = [(RouteOverviewFieldsView *)self overrideWaypoints];
  if (v5)
  {
    p_waypointListView = &self->_waypointListView;
    [(RoutePlanningWaypointListView *)self->_waypointListView setWaypoints:v5];
  }
  else
  {
    v7 = [(RouteOverviewFieldsView *)self delegate];
    id v8 = [v7 waypointsForFieldsView:self];
    p_waypointListView = &self->_waypointListView;
    [(RoutePlanningWaypointListView *)self->_waypointListView setWaypoints:v8];
  }
  id v9 = [(RouteOverviewFieldsView *)self delegate];
  id v10 = [v9 transportTypeForFieldsView:self];
  uint64_t v11 = 0;
  switch((unint64_t)v10)
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v11 = 1;
      break;
    case 1uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      goto LABEL_13;
    case 2uLL:
LABEL_10:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_13;
    case 5uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_13:
      uint64_t v11 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  [(RoutePlanningWaypointListView *)*p_waypointListView setMprEnabled:v11];

  v13 = *p_waypointListView;

  [(RoutePlanningWaypointListView *)v13 refreshWaypointDisplay];
}

- (void)setNeedsUpdateWaypointsList
{
  if (!self->_waypointsListUpdateTimer)
  {
    objc_initWeak(&location, self);
    id v3 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B01894;
    v6[3] = &unk_1012E7638;
    objc_copyWeak(&v7, &location);
    v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:2.22044605e-16];
    waypointsListUpdateTimer = self->_waypointsListUpdateTimer;
    self->_waypointsListUpdateTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)updateRefinements
{
  refinementsUpdateTimer = self->_refinementsUpdateTimer;
  if (refinementsUpdateTimer)
  {
    [(GCDTimer *)refinementsUpdateTimer invalidate];
    v4 = self->_refinementsUpdateTimer;
    self->_refinementsUpdateTimer = 0;
  }
  v5 = [(RouteOverviewFieldsView *)self delegate];
  if ([v5 transportTypeForFieldsView:self] == (id)4) {
    uint64_t v6 = GEOConfigGetBOOL() ^ 1;
  }
  else {
    uint64_t v6 = 1;
  }

  [(RouteOverviewFieldsView *)self setHasRefinementsBar:v6];
  self->_estimatedHeight = 0.0;
  id v8 = [(RouteOverviewFieldsView *)self delegate];
  id v7 = [v8 currentRefinementsForFieldsView:self];
  [(RoutePlanningRefinementBarView *)self->_refinementBarView setRefinements:v7];
}

- (void)setNeedsUpdateRefinements
{
  if (!self->_refinementsUpdateTimer)
  {
    objc_initWeak(&location, self);
    id v3 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B01AE4;
    v6[3] = &unk_1012E7638;
    objc_copyWeak(&v7, &location);
    v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:2.22044605e-16];
    refinementsUpdateTimer = self->_refinementsUpdateTimer;
    self->_refinementsUpdateTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setHasRefinementsBar:(BOOL)a3
{
  if (self->_hasRefinementsBar != a3)
  {
    self->_hasRefinementsBar = a3;
    if (a3) {
      [(RouteOverviewFieldsView *)self _addRefinementsBar];
    }
    else {
      [(RouteOverviewFieldsView *)self _removeRefinementsBar];
    }
  }
}

- (double)estimatedHeight
{
  double result = self->_estimatedHeight;
  if (result <= 0.0)
  {
    -[RouteOverviewFieldsView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    double result = v4;
    self->_estimatedHeight = v4;
  }
  return result;
}

- (BOOL)hasExpandedWaypoints
{
  return [(RoutePlanningWaypointListView *)self->_waypointListView hasExpandedStops];
}

- (void)expandWaypointsIfNeeded
{
  self->_estimatedHeight = 0.0;
  [(RoutePlanningWaypointListView *)self->_waypointListView expandStopsIfNeeded];
}

- (void)collapseWaypointsIfNeeded
{
  self->_estimatedHeight = 0.0;
  [(RoutePlanningWaypointListView *)self->_waypointListView collapseStopsIfNeeded];
}

- (void)reset
{
  self->_estimatedHeight = 0.0;
  [(RoutePlanningWaypointListView *)self->_waypointListView setWaypoints:&__NSArray0__struct];
  [(RoutePlanningWaypointListView *)self->_waypointListView collapseStopsIfNeeded];
  [(RoutePlanningRefinementBarView *)self->_refinementBarView setRefinements:&__NSArray0__struct];
  refinementBarView = self->_refinementBarView;

  [(RoutePlanningRefinementBarView *)refinementBarView resetScrollPosition];
}

- (void)_pressedTiming
{
  id v3 = [(RouteOverviewFieldsView *)self delegate];
  [v3 didTapTimingInFieldsView:self];
}

- (void)_addRefinementsBar
{
  [(RouteOverviewFieldsView *)self addSubview:self->_refinementBarView];
  self->_estimatedHeight = 0.0;
  [(NSLayoutConstraint *)self->_waypointListViewBottomConstraint setActive:0];
  v15 = [(RoutePlanningRefinementBarView *)self->_refinementBarView leadingAnchor];
  v14 = [(RouteOverviewFieldsView *)self leadingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v13;
  id v3 = [(RoutePlanningRefinementBarView *)self->_refinementBarView trailingAnchor];
  double v4 = [(RouteOverviewFieldsView *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v16[1] = v5;
  uint64_t v6 = [(RoutePlanningRefinementBarView *)self->_refinementBarView topAnchor];
  id v7 = [(RoutePlanningWaypointListView *)self->_waypointListView bottomAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7 constant:12.0];
  v16[2] = v8;
  id v9 = [(RoutePlanningRefinementBarView *)self->_refinementBarView bottomAnchor];
  id v10 = [(RouteOverviewFieldsView *)self bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v16[3] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_removeRefinementsBar
{
  self->_estimatedHeight = 0.0;
  [(RoutePlanningRefinementBarView *)self->_refinementBarView removeFromSuperview];
  waypointListViewBottomConstraint = self->_waypointListViewBottomConstraint;

  [(NSLayoutConstraint *)waypointListViewBottomConstraint setActive:1];
}

- (RoutePlanningWaypointListView)waypointListView
{
  return self->_waypointListView;
}

- (RouteOverviewFieldsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteOverviewFieldsViewDelegate *)WeakRetained;
}

- (NSArray)overrideWaypoints
{
  return self->_overrideWaypoints;
}

- (void)setOverrideWaypoints:(id)a3
{
}

- (BOOL)hasRefinementsBar
{
  return self->_hasRefinementsBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideWaypoints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waypointListView, 0);
  objc_storeStrong((id *)&self->_waypointListViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_waypointsListUpdateTimer, 0);
  objc_storeStrong((id *)&self->_refinementsUpdateTimer, 0);

  objc_storeStrong((id *)&self->_refinementBarView, 0);
}

@end