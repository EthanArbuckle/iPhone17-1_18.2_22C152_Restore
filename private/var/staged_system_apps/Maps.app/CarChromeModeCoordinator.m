@interface CarChromeModeCoordinator
+ (id)sharedInstance;
- (CarChromeModeCoordinator)init;
- (SiriDirectActionSource)siriActionSource;
- (id)_replaceTopmostSearchResultContexts:(id)a3 withContext:(id)a4;
- (void)_displayKeyboardSearchWithInteractionModel:(unint64_t)a3 resultsProvider:(id)a4 animated:(BOOL)a5;
- (void)_displayMapRegion:(id *)a3 animated:(BOOL)a4;
- (void)_displayNavigationAnimated:(BOOL)a3;
- (void)_displaySearchAlongTheRouteForMapItems:(id)a3;
- (void)_displaySearchAlongTheRouteForMapItems:(id)a3 selectedItemIndex:(unint64_t)a4;
- (void)_displaySearchAlongTheRouteForSearchSession:(id)a3;
- (void)_displaySiriSearch;
- (void)_handleClientResolvedResultForSearchSession:(id)a3;
- (void)_performActionForCarBlock:(id)a3 dashboardMapBlock:(id)a4 smallWidgetsBlock:(id)a5;
- (void)_resolveSearchFieldItemWithSearchInfo:(id)a3 withCompletion:(id)a4;
- (void)_scheduleCoordinatedContextChangeForViewController:(id)a3 carBlock:(id)a4 dashboardMapBlock:(id)a5 smallWidgetsBlock:(id)a6;
- (void)_scheduleCoordinatedContextChangeWithCarBlock:(id)a3 dashboardMapBlock:(id)a4 smallWidgetsBlock:(id)a5;
- (void)_sendSearchCancelFeedback;
- (void)addChromeViewController:(id)a3;
- (void)cleanupForDisconnect;
- (void)dealloc;
- (void)displayAllSharedTrips;
- (void)displayCollectionList;
- (void)displayDestinations;
- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4;
- (void)displayIncidentReporting;
- (void)displayKeyboardSearchWithInteractionModel:(unint64_t)a3;
- (void)displayMapBrowsing;
- (void)displayMapPanning;
- (void)displayMapRegion:(id *)a3;
- (void)displayNavigation;
- (void)displayNavigationForRouteCollection:(id)a3 options:(NavigationDetailsOptions *)a4;
- (void)displayNavigationSearch;
- (void)displayRouteGenius;
- (void)displayRoutePlanningForDestination:(id)a3;
- (void)displayRoutePlanningForDestination:(id)a3 userInfo:(id)a4;
- (void)displayRoutePlanningForExistingRoute;
- (void)displaySearchAlongTheRouteForCategory:(id)a3;
- (void)displaySearchCategories;
- (void)displaySearchResultsWithCategory:(id)a3;
- (void)displaySearchResultsWithCollection:(id)a3;
- (void)displaySearchSession:(id)a3;
- (void)displaySearchWithInteractionModel:(unint64_t)a3;
- (void)displaySharedTrip:(id)a3;
- (void)displaySiriTripSharing;
- (void)displayTripSharing;
- (void)displayTripSharingContactKeyboardSearchWithInteractionModel:(unint64_t)a3 dataSource:(id)a4 searchHandler:(id)a5;
- (void)endNavigation;
- (void)endRouteGenius;
- (void)endRoutePlanning;
- (void)endSearchSession:(id)a3;
- (void)goToDetail;
- (void)goToOverview;
- (void)launchIntoKeyboardSearchWithRequestedInteractionModel:(unint64_t)a3;
- (void)launchIntoNavigation;
- (void)popFromContext:(id)a3;
- (void)refreshSessionWithEVResults:(id)a3 contexts:(id)a4;
- (void)setSiriActionSource:(id)a3;
@end

@implementation CarChromeModeCoordinator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100730080;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160F6F0 != -1) {
    dispatch_once(&qword_10160F6F0, block);
  }
  v2 = (void *)qword_10160F6E8;

  return v2;
}

- (CarChromeModeCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CarChromeModeCoordinator;
  v2 = [(CarChromeModeCoordinator *)&v8 init];
  if (v2)
  {
    v3 = +[NSDistributedNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_sendSearchCancelFeedback" name:@"SiriCanceledMapsSearch" object:@"com.apple.siri.CarDisplay"];

    v4 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
    chromeViewControllers = v2->_chromeViewControllers;
    v2->_chromeViewControllers = v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_resetForTestingAction" name:@"ResetForTestingActionNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(CarChromeModeCoordinator *)self siriActionSource];
  [v3 invalidate];

  v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CarChromeModeCoordinator;
  [(CarChromeModeCoordinator *)&v5 dealloc];
}

- (void)addChromeViewController:(id)a3
{
}

- (SiriDirectActionSource)siriActionSource
{
  siriActionSource = self->_siriActionSource;
  if (!siriActionSource)
  {
    v4 = (SiriDirectActionSource *)objc_alloc_init((Class)SiriDirectActionSource);
    objc_super v5 = self->_siriActionSource;
    self->_siriActionSource = v4;

    siriActionSource = self->_siriActionSource;
  }

  return siriActionSource;
}

- (void)popFromContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(NSHashTable *)self->_chromeViewControllers allObjects];
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "The top context will be popped. All chrome controllers : %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(NSHashTable *)self->_chromeViewControllers allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100730444;
        v13[3] = &unk_1012F6BE0;
        id v14 = v4;
        [v12 scheduleCoordinatedContextChange:v13 completionHandler:0];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_performActionForCarBlock:(id)a3 dashboardMapBlock:(id)a4 smallWidgetsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [(NSHashTable *)self->_chromeViewControllers allObjects];
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v14);
        id v16 = objc_retainBlock(v8);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v18 = v9;
        if (isKindOfClass & 1) != 0 || (objc_opt_class(), v19 = objc_opt_isKindOfClass(), long long v18 = v21, (v19))
        {
          id v20 = objc_retainBlock(v18);

          id v16 = v20;
        }
        if (v16) {
          (*((void (**)(id, uint64_t))v16 + 2))(v16, v15);
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)_scheduleCoordinatedContextChangeForViewController:(id)a3 carBlock:(id)a4 dashboardMapBlock:(id)a5 smallWidgetsBlock:(id)a6
{
  id v16 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = objc_retainBlock(a4);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v13 = v9;
  if (isKindOfClass & 1) != 0 || (objc_opt_class(), char v14 = objc_opt_isKindOfClass(), v13 = v10, (v14))
  {
    id v15 = objc_retainBlock(v13);

    id v11 = v15;
  }
  [v16 scheduleCoordinatedContextChange:v11 completionHandler:0];
}

- (void)_scheduleCoordinatedContextChangeWithCarBlock:(id)a3 dashboardMapBlock:(id)a4 smallWidgetsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [(NSHashTable *)self->_chromeViewControllers allObjects];
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeForViewController:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) carBlock:v8 dashboardMapBlock:v9 smallWidgetsBlock:v10];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)displayRouteGenius
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(NSHashTable *)self->_chromeViewControllers allObjects];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v7);
        id v9 = +[CarDisplayController sharedInstance];
        id v10 = [v9 routeGeniusManager];
        unsigned __int8 v11 = [v10 isActive];

        if (v11)
        {
          [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeForViewController:v8 carBlock:&stru_1012F6C20 dashboardMapBlock:&stru_1012F6C40 smallWidgetsBlock:&stru_1012F6C60];
        }
        else
        {
          id v12 = sub_100015DB4();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)id v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "routeGenius is not active", v13, 2u);
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)endRouteGenius
{
}

- (void)displayMapBrowsing
{
}

- (void)displayMapRegion:(id *)a3
{
}

- (void)_displayMapRegion:(id *)a3 animated:(BOOL)a4
{
  double v8 = v4;
  if (v5 < -180.0
    || (double v9 = v5, v5 > 180.0)
    || v4 < -90.0
    || v4 > 90.0
    || (double v10 = v6, v6 < 0.0)
    || v6 > 180.0
    || (double v11 = v7, v7 < 0.0)
    || v7 > 360.0)
  {
    long long v14 = sub_100015DB4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will not display map region, invalid", buf, 2u);
    }
  }
  else
  {
    char v12 = (char)a3;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100731CE8;
    v18[3] = &unk_1012F6D40;
    *(double *)&v18[4] = v4;
    *(double *)&v18[5] = v5;
    *(double *)&v18[6] = v6;
    *(double *)&v18[7] = v7;
    char v19 = (char)a3;
    long long v14 = objc_retainBlock(v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100731DE8;
    v16[3] = &unk_1012F6D40;
    *(double *)&v16[4] = v8;
    *(double *)&v16[5] = v9;
    *(double *)&v16[6] = v10;
    *(double *)&v16[7] = v11;
    char v17 = v12;
    long long v15 = objc_retainBlock(v16);
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v14 dashboardMapBlock:v15 smallWidgetsBlock:0];
  }
}

- (void)displayMapPanning
{
}

- (void)displayDestinations
{
}

- (void)_resolveSearchFieldItemWithSearchInfo:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    double v7 = objc_alloc_init(ClientTypeResolver);
    double v8 = [v5 clientResolvedResult];
    unsigned int v9 = [v8 itemType];
    if (v9 > 6)
    {
LABEL_12:

      goto LABEL_13;
    }
    if (((1 << v9) & 0x19) != 0)
    {
      char v12 = sub_100015DB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = (int)[v8 itemType];
        id v13 = "Unsupported clientResolved type: %ld";
        long long v14 = v12;
        uint32_t v15 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }
    else
    {
      if (((1 << v9) & 0x46) != 0)
      {
        double v10 = [(ClientTypeResolver *)v7 personalizedItemSource];
        id v11 = [v8 itemType];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1007323E4;
        v22[3] = &unk_1012F6DA8;
        id v23 = v6;
        [v10 addressOrLOIWithType:v11 completion:v22];

        goto LABEL_12;
      }
      id v16 = [v8 resultIndex];
      char v17 = [v5 results];
      id v18 = [v17 count];

      if (v16 < v18)
      {
        char v19 = [v5 results];
        id v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v8, "resultIndex"));

        id v21 = +[SearchFieldItem searchFieldItemWithObject:v20];
        (*((void (**)(id, void *))v6 + 2))(v6, v21);

        goto LABEL_12;
      }
      char v12 = sub_100015DB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v13 = "ResultIndex of clientResolved item with type .Server was not found in the searchInfo.results";
        long long v14 = v12;
        uint32_t v15 = 2;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  sub_100015DB4();
  double v7 = (ClientTypeResolver *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_ERROR, "resolveSearchFieldItemWithSearchInfo:withCompletion requires a completion handler", buf, 2u);
  }
LABEL_13:
}

- (void)_handleClientResolvedResultForSearchSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentResultsSearchInfo];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100732594;
  v7[3] = &unk_1012F6DD0;
  id v8 = v4;
  id v6 = v4;
  [(CarChromeModeCoordinator *)self _resolveSearchFieldItemWithSearchInfo:v5 withCompletion:v7];
}

- (void)refreshSessionWithEVResults:(id)a3 contexts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count])
  {
    unsigned int v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "There are no contexts available. Ignoring the call to refresh the ev chargers.", v10, 2u);
    }
    goto LABEL_6;
  }
  double v7 = [v6 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v9 = [v6 lastObject];
    [v9 updateChargerAvailabilityWithResults:v5];
LABEL_6:
  }
}

- (void)displaySearchSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentResultsSearchInfo];
  id v6 = [v5 placeCollections];
  if ([v6 count])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [v5 publisher];
    BOOL v7 = v8 != 0;
  }
  unsigned int v9 = [v5 results];
  id v10 = [v9 count];

  if (v10 || !v7)
  {
    id v11 = [v5 clientResolvedResult];

    if (v11)
    {
      [(CarChromeModeCoordinator *)self _handleClientResolvedResultForSearchSession:v4];
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id obj = [(NSHashTable *)self->_chromeViewControllers allObjects];
      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          uint32_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v15);
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1007328C0;
            v19[3] = &unk_1012F6DF8;
            id v20 = v4;
            id v21 = v5;
            long long v22 = self;
            char v17 = objc_retainBlock(v19);
            [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeForViewController:v16 carBlock:v17 dashboardMapBlock:0 smallWidgetsBlock:0];

            uint32_t v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)displaySearchAlongTheRouteForCategory:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_10073323C;
    id v11 = &unk_1012E9AF8;
    id v12 = v4;
    id v13 = self;
    id v6 = objc_retainBlock(&v8);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v6, 0, 0, v8, v9, v10, v11);

    BOOL v7 = v12;
  }
  else
  {
    BOOL v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not display SAR, category is nil.", buf, 2u);
    }
  }
}

- (void)_displaySearchAlongTheRouteForSearchSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentResults];
  if ([v5 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100733508;
    v8[3] = &unk_1012F6DF8;
    uint64_t v9 = v5;
    id v10 = v4;
    id v11 = self;
    id v6 = objc_retainBlock(v8);
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v6 dashboardMapBlock:0 smallWidgetsBlock:0];

    BOOL v7 = v9;
  }
  else
  {
    BOOL v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not show or update SAR mode, zero map items received", buf, 2u);
    }
  }
}

- (void)_displaySearchAlongTheRouteForMapItems:(id)a3
{
}

- (void)_displaySearchAlongTheRouteForMapItems:(id)a3 selectedItemIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_100733808;
    id v12 = &unk_1012F6E20;
    id v13 = v6;
    unint64_t v14 = a4;
    BOOL v7 = objc_retainBlock(&v9);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v7, 0, 0, v9, v10, v11, v12);

    id v8 = v13;
  }
  else
  {
    id v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will not show or update SAR mode, zero map items received", buf, 2u);
    }
  }
}

- (void)endSearchSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100733AE8;
    v8[3] = &unk_1012F6BE0;
    uint64_t v9 = v4;
    id v6 = objc_retainBlock(v8);
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v6 dashboardMapBlock:0 smallWidgetsBlock:0];

    BOOL v7 = v9;
  }
  else
  {
    BOOL v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not end search session, nil session provided.", buf, 2u);
    }
  }
}

- (void)displayIncidentReporting
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100733F88;
  v4[3] = &unk_1012F6BE0;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v3 dashboardMapBlock:0 smallWidgetsBlock:0];
}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10073419C;
  v9[3] = &unk_1012F6DF8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  id v6 = v11;
  id v7 = v10;
  id v8 = objc_retainBlock(v9);
  [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v8 dashboardMapBlock:0 smallWidgetsBlock:0];
}

- (id)_replaceTopmostSearchResultContexts:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass() & 1;
    *(void *)buf = 0;
    uint32_t v15 = buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    char v17 = (char *)[v5 count] - 1;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1007344A4;
    v12[3] = &unk_1012F6E48;
    char v13 = v7;
    v12[4] = buf;
    [v5 enumerateObjectsWithOptions:2 usingBlock:v12];
    [v5 _maps_subarrayToIndex:*((void *)v15 + 3)];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v8 arrayByAddingObject:v6];
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = sub_100015DB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Tried to replace top-most non-search mode with a nil. -> Ignoring the call.", buf, 2u);
    }

    id v8 = v5;
    uint64_t v9 = v8;
  }

  return v9;
}

- (void)displaySearchCategories
{
}

- (void)displaySearchWithInteractionModel:(unint64_t)a3
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"StarkSearchEnableKeyboard"];

  char v7 = sub_100015DB4();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will show CarKeyboardModeController because it is set in user defaults", buf, 2u);
    }

    [(CarChromeModeCoordinator *)self displayKeyboardSearchWithInteractionModel:a3];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will show Siri search", v9, 2u);
    }

    [(CarChromeModeCoordinator *)self _displaySiriSearch];
  }
}

- (void)_displaySiriSearch
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];
  id v8 = +[SiriDirectActionContext mapSearchDirectActionWithAppBundleId:v4];

  id v5 = [(CarChromeModeCoordinator *)self siriActionSource];
  [v5 activateWithContext:v8];

  unsigned int v6 = +[CarDisplayController sharedInstance];
  char v7 = [v6 chromeViewController];
  [v7 captureUserAction:8009 onTarget:1010];
}

- (void)_sendSearchCancelFeedback
{
  v2 = sub_100015DB4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Notified search was canceled", v5, 2u);
  }

  v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 chromeViewController];
  [v4 captureUserAction:18];
}

- (void)launchIntoKeyboardSearchWithRequestedInteractionModel:(unint64_t)a3
{
  id v5 = objc_alloc_init(CarKeyboardSearchResultsViewController);
  [(CarChromeModeCoordinator *)self _displayKeyboardSearchWithInteractionModel:a3 resultsProvider:v5 animated:0];
}

- (void)displayKeyboardSearchWithInteractionModel:(unint64_t)a3
{
  id v5 = objc_alloc_init(CarKeyboardSearchResultsViewController);
  [(CarChromeModeCoordinator *)self _displayKeyboardSearchWithInteractionModel:a3 resultsProvider:v5 animated:1];
}

- (void)_displayKeyboardSearchWithInteractionModel:(unint64_t)a3 resultsProvider:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  uint64_t v9 = +[MapsExternalDevice sharedInstance];
  unsigned int v10 = [v9 disableSoftwareKeyboard];

  if (v10)
  {
    id v11 = sub_100015DB4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will not show keyboard, car does not permit it", buf, 2u);
    }
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100734BF4;
    v13[3] = &unk_1012F6E90;
    BOOL v16 = a5;
    unint64_t v15 = a3;
    unint64_t v14 = v8;
    id v12 = objc_retainBlock(v13);
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v12 dashboardMapBlock:0 smallWidgetsBlock:0];

    id v11 = v14;
  }
}

- (void)displayNavigationSearch
{
}

- (void)displaySearchResultsWithCategory:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100735030;
  v6[3] = &unk_1012F6BE0;
  id v7 = a3;
  id v4 = v7;
  id v5 = objc_retainBlock(v6);
  [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v5 dashboardMapBlock:0 smallWidgetsBlock:0];
}

- (void)displayCollectionList
{
}

- (void)displaySearchResultsWithCollection:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100735274;
  v6[3] = &unk_1012F6BE0;
  id v7 = a3;
  id v4 = v7;
  id v5 = objc_retainBlock(v6);
  [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v5 dashboardMapBlock:0 smallWidgetsBlock:0];
}

- (void)displayRoutePlanningForDestination:(id)a3
{
}

- (void)displayRoutePlanningForDestination:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1007354B8;
    v17[3] = &unk_1012F6DF8;
    id v18 = v6;
    id v8 = v7;
    id v19 = v8;
    id v20 = self;
    uint64_t v9 = objc_retainBlock(v17);
    unsigned int v10 = [v8 objectForKeyedSubscript:@"skipEndNavigationPrompt"];
    unsigned int v11 = [v10 BOOLValue];

    uint64_t v12 = v11 ^ 1;
    char v13 = +[CarSessionController sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100735854;
    v15[3] = &unk_1012EB2E0;
    v15[4] = self;
    id v16 = v9;
    unint64_t v14 = v9;
    [v13 endNavigationIfNeededWithPrompt:v12 andPerformBlock:v15];
  }
}

- (void)displayRoutePlanningForExistingRoute
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100735904;
  v4[3] = &unk_1012F6BE0;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v3 dashboardMapBlock:0 smallWidgetsBlock:0];
}

- (void)endRoutePlanning
{
}

- (void)displayNavigationForRouteCollection:(id)a3 options:(NavigationDetailsOptions *)a4
{
  id v5 = a3;
  id v6 = [v5 currentRoute];
  unsigned int v7 = [v6 carplayDestinationHandoffRequired];

  if (v7)
  {
    id v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CarChromeModeCoordinator displayNavigationForRouteCollection:options:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s was called while requiring NAD handoff. This is not supported.", buf, 0xCu);
    }
  }
  uint64_t v9 = +[CarDisplayController sharedInstance];
  unsigned int v10 = [v9 platformController];

  unsigned int v11 = [v10 currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v13 = sub_100015DB4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = [v10 currentSession];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Attempted to begin navigation, but there is already a NavigationSession on the sessionStack: %@", buf, 0xCu);
    }
    goto LABEL_31;
  }
  unint64_t v15 = [v10 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  char v13 = v16;

  char v17 = [v10 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  v38 = v19;
  if (v19)
  {
    id v20 = [v19 configuration];
    unint64_t v21 = (unint64_t)[v20 isResumingMultipointRoute];
    long long v22 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (v13)
  {
    long long v23 = [v13 routeGeniusEntry];
    id v20 = [v23 entry];

    if ([v20 type] == (id)11)
    {
      long long v24 = [v20 waypoints];
      unint64_t v21 = (unint64_t)[v24 count] > 2;
    }
    else
    {
      unint64_t v21 = 0;
    }
    long long v22 = [v20 sharingContacts];
    goto LABEL_22;
  }
  long long v22 = 0;
  unint64_t v21 = 0;
LABEL_23:
  long long v25 = [NavigationSessionBuilder alloc];
  long long v26 = +[CarDisplayController sharedInstance];
  v27 = [v26 chromeViewController];
  v28 = [v27 currentTraits];
  long long v29 = *(_OWORD *)&a4->guidanceType;
  *(_OWORD *)buf = *(_OWORD *)&a4->shouldSimulateLocations;
  long long v40 = v29;
  long long v41 = *(_OWORD *)&a4->isReconnecting;
  unint64_t navigationModeContext = a4->navigationModeContext;
  v30 = [(NavigationSessionBuilder *)v25 initWithRouteCollection:v5 navigationDetailsOptions:buf mapServiceTraits:v28 sessionInitiator:2 isResumingMultipointRoute:v21 tracePlaybackPath:0];
  v31 = [(NavigationSessionBuilder *)v30 build];

  if ([v22 count])
  {
    v32 = [v31 configuration];
    v33 = [v32 sharedTripPrefetchContext];

    [v33 setAutomaticSharingContacts:v22];
    v34 = sub_100015DB4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = [v22 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Populated %lu Share ETA contacts from RG entry", buf, 0xCu);
    }
  }
  v36 = [v10 currentSession];
  objc_opt_class();
  char v37 = objc_opt_isKindOfClass();

  if (v37) {
    [v10 replaceCurrentSessionWithSession:v31];
  }
  else {
    [v10 pushSession:v31];
  }

LABEL_31:
}

- (void)displayNavigation
{
}

- (void)launchIntoNavigation
{
}

- (void)_displayNavigationAnimated:(BOOL)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100736398;
  v12[3] = &unk_1012F6F10;
  BOOL v13 = a3;
  id v5 = objc_retainBlock(v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100736AB4;
  v10[3] = &unk_1012F6F10;
  BOOL v11 = a3;
  id v6 = objc_retainBlock(v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100737380;
  v8[3] = &unk_1012F6F10;
  BOOL v9 = a3;
  unsigned int v7 = objc_retainBlock(v8);
  [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v5 dashboardMapBlock:v6 smallWidgetsBlock:v7];
}

- (void)endNavigation
{
}

- (void)goToDetail
{
  v3 = +[CarDisplayController sharedInstance];
  unsigned __int8 v4 = [v3 isAnyCarSceneHostingNavigation];

  if (v4)
  {
    [(CarChromeModeCoordinator *)self _performActionForCarBlock:&stru_1012F6FF0 dashboardMapBlock:&stru_1012F7010 smallWidgetsBlock:0];
  }
  else
  {
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will not show Overview, no active nav running", v6, 2u);
    }
  }
}

- (void)goToOverview
{
  v3 = +[CarDisplayController sharedInstance];
  unsigned __int8 v4 = [v3 isAnyCarSceneHostingNavigation];

  if (v4)
  {
    [(CarChromeModeCoordinator *)self _performActionForCarBlock:&stru_1012F7030 dashboardMapBlock:&stru_1012F7050 smallWidgetsBlock:0];
  }
  else
  {
    id v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will not show Overview, no active nav running", v6, 2u);
    }
  }
}

- (void)displayAllSharedTrips
{
  if (MSPSharedTripReceivingAvailable())
  {
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:&stru_1012F7070 dashboardMapBlock:0 smallWidgetsBlock:0];
  }
}

- (void)displaySharedTrip:(id)a3
{
  id v4 = a3;
  if (MSPSharedTripReceivingAvailable())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100738508;
    v6[3] = &unk_1012F6BE0;
    id v7 = v4;
    id v5 = objc_retainBlock(v6);
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:v5 dashboardMapBlock:0 smallWidgetsBlock:0];
  }
}

- (void)displayTripSharing
{
  if (MSPSharedTripSharingAvailable())
  {
    [(CarChromeModeCoordinator *)self _scheduleCoordinatedContextChangeWithCarBlock:&stru_1012F7090 dashboardMapBlock:0 smallWidgetsBlock:0];
  }
}

- (void)displayTripSharingContactKeyboardSearchWithInteractionModel:(unint64_t)a3 dataSource:(id)a4 searchHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [[CarShareTripKeyboardSearchController alloc] initWithContactSearchResults:0 dataSource:v8 searchHandler:v9];
  objc_initWeak(&location, v10);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1007387E0;
  v11[3] = &unk_1012E7ED0;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  [(CarShareTripKeyboardSearchController *)v10 setDismissHandler:v11];
  [(CarChromeModeCoordinator *)self _displayKeyboardSearchWithInteractionModel:a3 resultsProvider:v10 animated:1];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)displaySiriTripSharing
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];
  id v6 = +[SiriDirectActionContext mapShareEtaDirectActionWithAppBundleId:v4];

  id v5 = [(CarChromeModeCoordinator *)self siriActionSource];
  [v5 activateWithContext:v6];
}

- (void)cleanupForDisconnect
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSHashTable *)self->_chromeViewControllers allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) scheduleCoordinatedContextChange:&stru_1012F70B0 completionHandler:0];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setSiriActionSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionSource, 0);

  objc_storeStrong((id *)&self->_chromeViewControllers, 0);
}

@end