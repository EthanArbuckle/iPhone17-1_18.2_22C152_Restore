@interface CarBaseSearchViewController
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)quickRouteShouldIncludeTransitWhenNotPreferredTransportType;
- (BOOL)quickRouteShouldOnlyUseAutomobile;
- (BOOL)userIsActive;
- (BOOL)userIsActiveStateChangeQueued;
- (CarBaseSearchViewController)initWithDisabledETAUpdates:(BOOL)a3;
- (CarTableView)tableView;
- (NSIndexPath)lastSelectedIndexPath;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_lastKnownETAForIndexPath:(id)a3;
- (id)_lastKnownETAForItem:(id)a3;
- (id)_quickRouteManagerForIndexPath:(id)a3;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)modelForItem:(id)a3;
- (id)modelForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)cellStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_markVisibleQuickRouteManagersVisible;
- (unint64_t)preferredDirectionsTypeForQuickRoute;
- (void)_applyRouteETA:(id)a3 toCell:(id)a4 animated:(BOOL)a5;
- (void)_markAllQuickRouteManagersNotVisible;
- (void)continueQuickRouteETAs;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)prepareQuickRouteETAs;
- (void)quickRouteManager:(id)a3 didUpdateETA:(id)a4 error:(id)a5 animated:(BOOL)a6;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUserIsActive:(BOOL)a3;
- (void)setUserIsActiveStateChangeQueued:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateAllETAs;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarBaseSearchViewController

- (CarBaseSearchViewController)initWithDisabledETAUpdates:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CarBaseSearchViewController;
  v4 = [(CarBaseSearchViewController *)&v11 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_disableETAUpdates = a3;
    v4->_suppressETAUpdates = 1;
    v4->_cellStyle = 0;
    uint64_t v6 = +[NSMapTable weakToStrongObjectsMapTable];
    modelsByItem = v5->_modelsByItem;
    v5->_modelsByItem = (NSMapTable *)v6;

    uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
    lastKnownETAResultsForItem = v5->_lastKnownETAResultsForItem;
    v5->_lastKnownETAResultsForItem = (NSMapTable *)v8;

    [(CarBaseSearchViewController *)v5 prepareQuickRouteETAs];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[MKLocationManager sharedLocationManager];
  [v3 stopLocationUpdateWithObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarBaseSearchViewController;
  [(CarBaseSearchViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarBaseSearchViewController;
  [(CarBaseSearchViewController *)&v4 viewWillAppear:a3];
  self->_suppressETAUpdates = 0;
  [(CarBaseSearchViewController *)self setUserIsActive:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarBaseSearchViewController;
  [(CarBaseSearchViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = +[MKLocationManager sharedLocationManager];
  [v4 startLocationUpdateWithObserver:self];

  [(CarBaseSearchViewController *)self setUserIsActive:0];
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarBaseSearchViewController;
  [(CarBaseSearchViewController *)&v4 viewWillDisappear:a3];
  [(CarBaseSearchViewController *)self _markAllQuickRouteManagersNotVisible];
  [(CarBaseSearchViewController *)self setUserIsActive:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarBaseSearchViewController;
  [(CarBaseSearchViewController *)&v5 viewDidDisappear:a3];
  self->_suppressETAUpdates = 1;
  objc_super v4 = +[MKLocationManager sharedLocationManager];
  [v4 stopLocationUpdateWithObserver:self];
}

- (void)setUserIsActive:(BOOL)a3
{
  if (a3)
  {
    self->_userIsActive = 1;
    +[CarQuickRouteRefreshOperation suspendQueues:1];
    [(CarBaseSearchViewController *)self _markAllQuickRouteManagersNotVisible];
  }
  else if (![(CarBaseSearchViewController *)self userIsActiveStateChangeQueued])
  {
    [(CarBaseSearchViewController *)self setUserIsActiveStateChangeQueued:1];
    dispatch_time_t v4 = dispatch_time(0, 1000000000* +[CarQuickRouteRefreshOperation throttlePreventionLevel]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100678C24;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)prepareQuickRouteETAs
{
  if (!self->_disableETAUpdates)
  {
    v3 = +[MKLocationManager sharedLocationManager];
    unsigned int v4 = [v3 isAuthorizedForPreciseLocation];

    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      objc_super v5 = [(NSMutableDictionary *)self->_quickRouteManagers allValues];
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            [v10 set_Car_isVisible:0];
            [v10 _Car_cancelUpdateETA];
            [v10 setDelegate:0];
          }
          id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }

      objc_super v11 = +[NSMutableDictionary dictionary];
      quickRouteManagers = self->_quickRouteManagers;
      self->_quickRouteManagers = v11;
    }
  }
}

- (void)continueQuickRouteETAs
{
  if ([(CarBaseSearchViewController *)self isViewLoaded])
  {
    if (!self->_disableETAUpdates)
    {
      v3 = +[MKLocationManager sharedLocationManager];
      unsigned int v4 = [v3 isAuthorizedForPreciseLocation];

      if (v4)
      {
        if (!self->_userIsActive
          && [(CarBaseSearchViewController *)self _markVisibleQuickRouteManagersVisible])
        {
          +[CarQuickRouteRefreshOperation suspendQueues:0];
        }
      }
    }
  }
}

- (void)updateAllETAs
{
  if (!self->_suppressETAUpdates && !self->_disableETAUpdates)
  {
    v3 = +[MKLocationManager sharedLocationManager];
    unsigned int v4 = [v3 isAuthorizedForPreciseLocation];

    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      objc_super v5 = [(NSMutableDictionary *)self->_quickRouteManagers allValues];
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            [v10 _Car_etaAge];
            if (v11 <= 90.0)
            {
              [v10 _Car_etaAge];
              if (v12 >= 0.0) {
                continue;
              }
            }
            [v10 _Car_queueUpdateETA];
          }
          id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (id)_lastKnownETAForItem:(id)a3
{
  if (a3)
  {
    v3 = -[NSMapTable objectForKey:](self->_lastKnownETAResultsForItem, "objectForKey:");
    if (v3)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [v3 responseTime];
      if (Current - v5 >= 90.0) {
        id v6 = 0;
      }
      else {
        id v6 = v3;
      }
      id v7 = v6;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_lastKnownETAForIndexPath:(id)a3
{
  unsigned int v4 = [(CarBaseSearchViewController *)self itemAtIndexPath:a3];
  double v5 = [(CarBaseSearchViewController *)self _lastKnownETAForItem:v4];

  return v5;
}

- (unint64_t)_markVisibleQuickRouteManagersVisible
{
  v3 = [(CarBaseSearchViewController *)self tableView];
  unsigned int v4 = [v3 _maps_isVisible];

  if (!v4) {
    return 0;
  }
  double v5 = objc_opt_new();
  id v6 = [(CarTableView *)self->_tableView indexPathsForVisibleRows];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [(CarBaseSearchViewController *)self _quickRouteManagerForIndexPath:*(void *)(*((void *)&v17 + 1) + 8 * (void)v10)];
        if (v11)
        {
          [v5 addObject:v11];
          [v11 set_Car_isVisible:1];
          uint64_t v12 = [v11 _Car_refreshOperation];
          if (!v12
            || (long long v13 = (void *)v12,
                unsigned __int8 v14 = objc_msgSend(v11, "_Car_isPrimaryRefreshQueue"),
                v13,
                (v14 & 1) == 0))
          {
            [v11 _Car_queueUpdateETA];
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  id v15 = [v6 count];

  return (unint64_t)v15;
}

- (void)_markAllQuickRouteManagersNotVisible
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSMutableDictionary *)self->_quickRouteManagers allValues];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 set_Car_isVisible:0];
        [v7 _Car_cancelUpdateETA];
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_quickRouteManagerForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_quickRouteManagers objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(CarBaseSearchViewController *)self modelForItemAtIndexPath:v4];
    id v5 = [v6 mapItem];

    if (v5)
    {
      id v5 = objc_alloc_init((Class)_MKQuickRouteManager);
      [v5 setDelegate:self];
      [v5 setView:self];
      id v7 = [v6 mapItem];
      [v5 setMapItem:v7];

      [(NSMutableDictionary *)self->_quickRouteManagers setObject:v5 forKeyedSubscript:v4];
    }
  }

  return v5;
}

- (void)quickRouteManager:(id)a3 didUpdateETA:(id)a4 error:(id)a5 animated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1006795C8;
  v16[3] = &unk_1012F3D00;
  id v12 = a5;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  long long v19 = self;
  id v14 = v11;
  id v20 = v14;
  BOOL v21 = a6;
  id v15 = objc_retainBlock(v16);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v15[2])(v15);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)_applyRouteETA:(id)a3 toCell:(id)a4 animated:(BOOL)a5
{
}

- (unint64_t)preferredDirectionsTypeForQuickRoute
{
  return 1;
}

- (BOOL)quickRouteShouldOnlyUseAutomobile
{
  return 1;
}

- (BOOL)quickRouteShouldIncludeTransitWhenNotPreferredTransportType
{
  return 0;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (id)itemAtIndexPath:(id)a3
{
  return 0;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  id v4 = [(CarBaseSearchViewController *)self itemAtIndexPath:a3];
  id v5 = [(CarBaseSearchViewController *)self modelForItem:v4];

  return v5;
}

- (id)modelForItem:(id)a3
{
  return [(NSMapTable *)self->_modelsByItem objectForKey:a3];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (a4.y <= 0.0) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = 8;
  }
  id v7 = +[CarDisplayController sharedInstance];
  id v6 = [v7 chromeViewController];
  [v6 captureUserAction:v5];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(CarBaseSearchViewController *)self setUserIsActive:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if (!self->_disableETAUpdates)
  {
    long long v8 = +[MKLocationManager sharedLocationManager];
    unsigned int v9 = [v8 isAuthorizedForPreciseLocation];

    if (v9)
    {
      id v10 = [(CarBaseSearchViewController *)self _lastKnownETAForIndexPath:v7];
      if (v10)
      {
        [(CarBaseSearchViewController *)self _applyRouteETA:v10 toCell:v12 animated:1];
      }
      else
      {
        id v11 = [(CarBaseSearchViewController *)self _quickRouteManagerForIndexPath:v7];
        if (v11)
        {
          if (![(CarBaseSearchViewController *)self userIsActive]) {
            [v11 set_Car_isVisible:1];
          }
          [v11 _Car_queueUpdateETA];
          [v12 expectUpdatedRouteETA];
        }
      }
    }
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CarBaseSearchViewController *)self itemAtIndexPath:v5];
  id v7 = [(CarBaseSearchViewController *)self modelForItemAtIndexPath:v5];

  if (!v7)
  {
    id v7 = +[CarSearchItemCellModel modelWithUpdateBlock:0];
    [v6 updateModel:v7];
  }
  long long v8 = [v7 rating];
  if (v8)
  {
  }
  else if (([v7 shouldShowChargerlabel] & 1) == 0)
  {
    goto LABEL_7;
  }
  if ((id)[(CarBaseSearchViewController *)self cellStyle] != (id)1)
  {
    unsigned int v9 = &CarSearchItemCellThreeLineHeight;
    goto LABEL_9;
  }
LABEL_7:
  unsigned int v9 = &CarSearchItemCellTwoLineHeight;
LABEL_9:
  double v10 = *(double *)v9;

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = +[CarSearchItemCell reuseIdentifier];
  unsigned int v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];

  double v10 = [(CarBaseSearchViewController *)self itemAtIndexPath:v7];
  id v11 = [(CarBaseSearchViewController *)self modelForItemAtIndexPath:v7];
  if (!v11)
  {
    objc_initWeak(&location, v9);
    objc_initWeak(&from, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100679CEC;
    v14[3] = &unk_1012F3D28;
    objc_copyWeak(&v15, &from);
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    id v12 = objc_retainBlock(v14);
    id v11 = +[CarSearchItemCellModel modelWithUpdateBlock:v12];
    [(NSMapTable *)self->_modelsByItem setObject:v11 forKey:v10];
    [v10 updateModel:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  [v11 setIsRecent:[v7 section] == (id)1];
  [v9 setupWithModel:v11 cellStyle:[self cellStyle]];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = (NSIndexPath *)a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = v6;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(CarBaseSearchViewController *)self itemAtIndexPath:self->_lastSelectedIndexPath];

  if (v5)
  {
    id v6 = self->_lastSelectedIndexPath;
  }
  else
  {
    id v7 = [v4 indexPathsForVisibleRows];
    id v8 = [v7 count];

    if (v8)
    {
      unsigned int v9 = [v4 indexPathsForVisibleRows];
      id v6 = [v9 firstObject];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (CarTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (BOOL)userIsActive
{
  return self->_userIsActive;
}

- (BOOL)userIsActiveStateChangeQueued
{
  return self->_userIsActiveStateChangeQueued;
}

- (void)setUserIsActiveStateChangeQueued:(BOOL)a3
{
  self->_userIsActiveStateChangeQueued = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_modelsByItem, 0);
  objc_storeStrong((id *)&self->_lastFetchedFromLocation, 0);
  objc_storeStrong((id *)&self->_lastKnownETAResultsForItem, 0);

  objc_storeStrong((id *)&self->_quickRouteManagers, 0);
}

@end