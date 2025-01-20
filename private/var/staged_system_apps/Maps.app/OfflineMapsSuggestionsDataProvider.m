@interface OfflineMapsSuggestionsDataProvider
- (BOOL)_homeAreaTipWasDismissed;
- (BOOL)_tripTipWasDismissed;
- (BOOL)isTrip:(id)a3 nearAtLeastOneShortcut:(id)a4;
- (NSString)uniqueName;
- (OfflineMapsSuggestionsDataProvider)initWithClientType:(int)a3 callbackQueue:(id)a4;
- (id)_filterEntriesWithOverLappingRects:(id)a3;
- (id)fetchHomeLocationsAsShortCuts;
- (void)_buildMapRegionForLatitude:(double)a3 longitude:(double)a4 handler:(id)a5;
- (void)_fetchAirportArrivalModelDataFromFlightEntry:(id)a3 usingCurrentLocation:(id)a4 completion:(id)a5;
- (void)_fetchHomeAreaModelDataFromEntry:(id)a3 onQueue:(id)a4 completionHandler:(id)a5;
- (void)_firstUpcomingTripOfflineSuggestion:(id)a3;
- (void)_offlineSuggestionsUsingLocation:(id)a3 withCompletion:(id)a4;
- (void)dismissedTipWithType:(int)a3;
- (void)displayedTipWithType:(int)a3;
- (void)offlineSuggestions:(id)a3;
- (void)offlineSuggestionsForLocation:(id)a3 completion:(id)a4;
- (void)showHomeAreaTipInFuture;
@end

@implementation OfflineMapsSuggestionsDataProvider

- (id)_filterEntriesWithOverLappingRects:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v23 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v34;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v7 = objc_alloc_init((Class)NSMutableArray);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v8 = [v4 copy];
        id v9 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v30;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
              double v28 = 0.0;
              MapsSuggestionsDistanceBetweenEntries();
              double v14 = v28;
              if (v14 <= (double)GEOConfigGetInteger())
              {
                if ([v13 type] == (id)1)
                {

                  goto LABEL_26;
                }
                if ([v6 type] == (id)1) {
                  [v7 addObject:v6];
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v15 = v7;
        id v16 = [v15 countByEnumeratingWithState:&v24 objects:v37 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (k = 0; k != v17; k = (char *)k + 1)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              [v4 removeObject:*(void *)(*((void *)&v24 + 1) + 8 * (void)k)];
            }
            id v17 = [v15 countByEnumeratingWithState:&v24 objects:v37 count:16];
          }
          while (v17);
        }

        [v4 addObject:v6];
LABEL_26:
      }
      id v23 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v23);
  }

  return v4;
}

- (void)_firstUpcomingTripOfflineSuggestion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  insightsQueue = self->_insightsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020400;
  v7[3] = &unk_1012E9730;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(insightsQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_homeAreaTipWasDismissed
{
  if (self->_clientType == 1)
  {
    if (self->_homeAreaTipDismissedThisSession)
    {
      v2 = sub_1000493C0();
      BOOL v3 = 1;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "The Offline Maps Home Area tip was already dismissed in this session", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      v2 = GEOConfigGetDate();
      if (v2)
      {
        id v4 = sub_1000493C0();
        BOOL v3 = 1;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          uint64_t v18 = v2;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not showing Offline Maps Home Area tip because a Home Area tip was dismissed on %@", (uint8_t *)&v17, 0xCu);
        }
      }
      else
      {
        id v4 = GEOConfigGetDate();
        uint64_t UInteger = GEOConfigGetUInteger();
        if (!v4) {
          goto LABEL_13;
        }
        uint64_t v6 = UInteger;
        id v7 = v4;
        id v8 = objc_alloc_init((Class)NSDateComponents);
        [v8 setDay:-v6];
        id v9 = +[NSCalendar currentCalendar];
        id v10 = +[NSDate now];
        uint64_t v11 = [v9 dateByAddingComponents:v8 toDate:v10 options:0];

        id v12 = [v7 compare:v11];
        if (v12 == (id)-1)
        {
          double v14 = sub_1000493C0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v17 = 134217984;
            uint64_t v18 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Automatically dismissing Offline Maps Home Area tip because user has not interacted with it for %lu days", (uint8_t *)&v17, 0xCu);
          }

          id v15 = +[NSDate now];
          GEOConfigSetDate();

          GEOConfigSetDate();
          BOOL v3 = 1;
          id v4 = v7;
        }
        else
        {
LABEL_13:
          v13 = sub_1000493C0();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            LOWORD(v17) = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Offline Maps Home Area tip has never been dismissed.", (uint8_t *)&v17, 2u);
          }

          BOOL v3 = 0;
        }
      }
    }
  }
  else
  {
    v2 = sub_1000493C0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "This OfflineMapsSuggestionsDataProvider is ignoring dismissal logic, force returning NO in _homeAreaTipWasDismissed.", (uint8_t *)&v17, 2u);
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_offlineSuggestionsUsingLocation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  LOBYTE(a4) = self->_clientType != 3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  engine = self->_engine;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004CC98;
  v11[3] = &unk_101314978;
  objc_copyWeak(&v15, &location);
  v11[4] = self;
  char v16 = (char)a4;
  id v9 = v6;
  id v12 = v9;
  double v14 = v17;
  id v10 = v7;
  id v13 = v10;
  [(MapsSuggestionsEngine *)engine oneShotTopSuggestionsForSink:self count:10 transportType:4 callback:v11 onQueue:self->_msgEngineQueue];

  objc_destroyWeak(&v15);
  _Block_object_dispose(v17, 8);
  objc_destroyWeak(&location);
}

- (BOOL)_tripTipWasDismissed
{
  if (self->_clientType == 1)
  {
    if (self->_tripTipDismissedThisSession)
    {
      v2 = sub_1000493C0();
      BOOL v3 = 1;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "The Offline Maps trip tip was already dismissed in this session", (uint8_t *)&v25, 2u);
      }
    }
    else
    {
      v2 = GEOConfigGetDate();
      id v4 = sub_1000493C0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        uint64_t v26 = (uint64_t)v2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Checking whether Offline Maps trip tip was dismissed, dismissal date is %@", (uint8_t *)&v25, 0xCu);
      }

      uint64_t UInteger = GEOConfigGetUInteger();
      if (!v2) {
        goto LABEL_14;
      }
      id v6 = v2;
      id v7 = objc_alloc_init((Class)NSDateComponents);
      [v7 setDay:-UInteger];
      id v8 = +[NSCalendar currentCalendar];
      id v9 = +[NSDate now];
      id v10 = [v8 dateByAddingComponents:v7 toDate:v9 options:0];

      id v11 = [v6 compare:v10];
      if (v11 == (id)-1)
      {
LABEL_14:
        id v12 = GEOConfigGetDate();
        uint64_t v13 = GEOConfigGetUInteger();
        if (!v12) {
          goto LABEL_16;
        }
        uint64_t v14 = v13;
        id v15 = v12;
        id v16 = objc_alloc_init((Class)NSDateComponents);
        [v16 setDay:-v14];
        int v17 = +[NSCalendar currentCalendar];
        char v18 = +[NSDate now];
        v19 = [v17 dateByAddingComponents:v16 toDate:v18 options:0];

        id v20 = [v15 compare:v19];
        if (v20 == (id)-1)
        {
          uint64_t v22 = sub_1000493C0();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            int v25 = 134217984;
            uint64_t v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Automatically dismissing Offline Maps trip tip because user has not interacted with it for %lu days", (uint8_t *)&v25, 0xCu);
          }

          id v23 = +[NSDate now];
          GEOConfigSetDate();

          GEOConfigSetDate();
          BOOL v3 = 1;
          id v12 = v15;
        }
        else
        {
LABEL_16:
          v21 = sub_1000493C0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            int v25 = 134217984;
            uint64_t v26 = UInteger;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Offline Maps trip tip was NOT dismissed in the past %lu days", (uint8_t *)&v25, 0xCu);
          }

          BOOL v3 = 0;
        }
      }
      else
      {
        id v12 = sub_1000493C0();
        BOOL v3 = 1;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Not showing Offline Maps trip tip because a trip tip was dismissed in the past six months.", (uint8_t *)&v25, 2u);
        }
      }
    }
  }
  else
  {
    v2 = sub_1000493C0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "This OfflineMapsSuggestionsDataProvider is ignoring dismissal logic, force returning NO in _tripTipWasDismissed.", (uint8_t *)&v25, 2u);
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (void)offlineSuggestionsForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ((GEOSupportsOfflineMaps() & 1) == 0) {
    v7[2](v7, 0);
  }
  id v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  dispatch_group_enter(v8);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_100104244;
  v35[4] = sub_1001049A0;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_100104244;
  v33[4] = sub_1001049A0;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100104244;
  v31[4] = sub_1001049A0;
  id v32 = 0;
  if ([(OfflineMapsSuggestionsDataProvider *)self _tripTipWasDismissed])
  {
    id v9 = sub_1000493C0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      id v10 = "Future trip tip was dismissed, no reason to look up trips in MSg Insights.";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if (self->_clientType != 3)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10002C148;
      v28[3] = &unk_1013147C0;
      long long v30 = v35;
      long long v29 = v8;
      [(OfflineMapsSuggestionsDataProvider *)self _firstUpcomingTripOfflineSuggestion:v28];

      goto LABEL_12;
    }
    id v9 = sub_1000493C0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      id v10 = "Client type does not consider trips";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      goto LABEL_9;
    }
  }

  dispatch_group_leave(v8);
LABEL_12:
  if (![(OfflineMapsSuggestionsDataProvider *)self _homeAreaTipWasDismissed]) {
    goto LABEL_21;
  }
  if ([(OfflineMapsSuggestionsDataProvider *)self _tripTipWasDismissed])
  {
    uint64_t v13 = sub_1000493C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      uint64_t v14 = "Both the Offline Maps trip tip and home area tip were dismissed, No reason to run MSg engine.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (self->_clientType != 3)
  {
LABEL_21:
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001E930;
    v24[3] = &unk_1013147E8;
    uint64_t v26 = v31;
    long long v27 = v33;
    int v25 = v8;
    [(OfflineMapsSuggestionsDataProvider *)self _offlineSuggestionsUsingLocation:v6 withCompletion:v24];

    goto LABEL_22;
  }
  uint64_t v13 = sub_1000493C0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    uint64_t v14 = "The Offline Maps home area tip were dismissed, and client type should not consider trips. No reason to run MSg engine.";
    goto LABEL_19;
  }
LABEL_20:

  dispatch_group_leave(v8);
LABEL_22:
  objc_initWeak(&buf, self);
  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CB68;
  block[3] = &unk_101314810;
  objc_copyWeak(&v22, &buf);
  id v20 = v35;
  v21 = v31;
  id v18 = v7;
  v19 = v33;
  id v16 = v7;
  dispatch_group_notify(v8, callbackQueue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&buf);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
}

- (OfflineMapsSuggestionsDataProvider)initWithClientType:(int)a3 callbackQueue:(id)a4
{
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)OfflineMapsSuggestionsDataProvider;
  id v8 = [(OfflineMapsSuggestionsDataProvider *)&v27 init];
  if (v8)
  {
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsSuggestionsDataProviderMSgEngineQueue", v9);
    msgEngineQueue = v8->_msgEngineQueue;
    v8->_msgEngineQueue = (OS_dispatch_queue *)v10;

    os_log_type_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsSuggestionsDataProviderInsightsQueue", v12);
    insightsQueue = v8->_insightsQueue;
    v8->_insightsQueue = (OS_dispatch_queue *)v13;

    id v15 = objc_alloc_init(MapsSuggestionsMKLocationManagerAdapter);
    id v16 = objc_alloc((Class)NSSet);
    id v17 = objc_alloc_init((Class)MapsSuggestionsFlightDeparturesOnlyFilter);
    id v18 = objc_alloc_init((Class)MapsSuggestionsFlightTooFarFilter);
    id v19 = [v16 initWithObjects:v17, v18, 0];

    id v20 = +[MapsSuggestionsEngineBuilder forDevice];
    v21 = [v20 withLocationUpdater:v15];
    id v22 = [v21 withoutTracker];
    id v23 = [v22 withoutPreFilters:v19];

    uint64_t v24 = [v23 build];

    engine = v8->_engine;
    v8->_engine = (MapsSuggestionsEngine *)v24;

    objc_storeStrong((id *)&v8->_callbackQueue, a4);
    *(_WORD *)&v8->_tripTipDismissedThisSession = 0;
    v8->_clientType = a3;
  }

  return v8;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)offlineSuggestions:(id)a3
{
}

- (void)dismissedTipWithType:(int)a3
{
  int clientType = self->_clientType;
  id v6 = sub_1000493C0();
  id v7 = v6;
  if (clientType == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting dismissal date for Offline Maps tip type: %d", (uint8_t *)v11, 8u);
    }

    switch(a3)
    {
      case 0:
        id v7 = sub_1000493C0();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        LOWORD(v11[0]) = 0;
        id v8 = "Unknown type passed to dismissedTipWithType, this should never happen.";
        goto LABEL_9;
      case 1:
        self->_homeAreaTipDismissedThisSession = 1;
        id v9 = +[NSDate now];
        GEOConfigSetSyncDate();

        goto LABEL_14;
      case 2:
        self->_tripTipDismissedThisSession = 1;
        goto LABEL_13;
      case 3:
LABEL_13:
        dispatch_queue_t v10 = +[NSDate now];
        GEOConfigSetSyncDate();

LABEL_14:
        GEOConfigSetSyncDate();
        break;
      default:
        return;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      id v8 = "This OfflineMapsSuggestionsDataProvider is not being used for tips, this method should not be called.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v11, 2u);
    }
LABEL_10:
  }
}

- (void)displayedTipWithType:(int)a3
{
  int clientType = self->_clientType;
  v5 = sub_1000493C0();
  id v6 = v5;
  if (clientType == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10[0] = 67109120;
      v10[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Offline Maps Tip with type %d was displayed", (uint8_t *)v10, 8u);
    }

    if (a3 == 2)
    {
      id v6 = GEOConfigGetDate();
      if (v6)
      {
        id v8 = sub_1000493C0();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10[0]) = 0;
          id v9 = "Trip Tip first display date is already set.";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)v10, 2u);
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      if (a3 != 1)
      {
        if (a3) {
          return;
        }
        id v6 = sub_1000493C0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v10[0]) = 0;
          id v7 = "Unknown type passed to displayedTipWithType, this should never happen.";
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)v10, 2u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      id v6 = GEOConfigGetDate();
      if (v6)
      {
        id v8 = sub_1000493C0();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10[0]) = 0;
          id v9 = "Home Area Tip first display date is already set.";
          goto LABEL_18;
        }
        goto LABEL_20;
      }
    }
    id v8 = +[NSDate now];
    GEOConfigSetDate();
    goto LABEL_20;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v10[0]) = 0;
    id v7 = "This OfflineMapsSuggestionsDataProvider is not being used for tips, this method should not be called.";
    goto LABEL_11;
  }
LABEL_21:
}

- (void)showHomeAreaTipInFuture
{
  int clientType = self->_clientType;
  BOOL v3 = sub_1000493C0();
  id v4 = v3;
  if (clientType == 3)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User tapped \"Remind Me Later\" on Offline Maps welcome screen, home area tip will show after two weeks pass.", v5, 2u);
    }

    id v4 = +[NSDate date];
    GEOConfigSetDate();
    GEOConfigSetDate();
    GEOConfigSetDate();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "This OfflineMapsSuggestionsDataProvider is not being used for the welcome screen, this method should not be called.", buf, 2u);
  }
}

- (id)fetchHomeLocationsAsShortCuts
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  dispatch_group_enter(v2);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = sub_100018584();
  v5 = [v4 oneFavorites];

  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100A1B048;
  id v17 = &unk_1012E7B20;
  id v18 = v2;
  id v19 = v3;
  id v6 = v3;
  id v7 = v2;
  id v8 = objc_retainBlock(&v14);
  [v5 loadAllShortcutsWithHandler:v8, v14, v15, v16, v17];
  id v9 = sub_100018584();
  dispatch_queue_t v10 = [v9 oneRoutine];

  uint64_t UInteger = GEOConfigGetUInteger();
  [v10 fetchSuggestedShortcutsForType:2 minVisits:UInteger maxAge:v8 handler:(double)(unint64_t)GEOConfigGetUInteger()];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = [v6 copy];

  return v12;
}

- (BOOL)isTrip:(id)a3 nearAtLeastOneShortcut:(id)a4
{
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v5 placemark:v20];
        id v12 = [v11 location];
        dispatch_queue_t v13 = [v10 geoMapItem];
        uint64_t v14 = MapsSuggestionsLocationForMapItem();
        [v12 distanceFromLocation:v14];
        double v16 = v15;

        double Integer = (double)GEOConfigGetInteger();
        if (v16 > 0.0 && v16 < Integer)
        {
          LOBYTE(v7) = 1;
          goto LABEL_14;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v7;
}

- (void)_fetchAirportArrivalModelDataFromFlightEntry:(id)a3 usingCurrentLocation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_queue_t v10 = (void (**)(id, void))a5;
  id v11 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned int v12 = [v11 isCellConnection];

  if (v12)
  {
    dispatch_queue_t v13 = sub_1000493C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      uint64_t v14 = "Airport Arrival Tip: User has a cellular data connection, not constructing tip.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  double v15 = +[GEONetworkObserver sharedNetworkObserver];
  int v16 = [v15 isNetworkReachable];

  if (v16)
  {
    id v17 = [v9 latLng];
    [v17 lat];
    id v18 = [v9 latLng];
    [v18 lng];

    id v19 = CLLocationFromGEOLocationCoordinate2D();
    if (MapsSuggestionsIsValidLocation())
    {
      long long v20 = v19;
    }
    else
    {
      long long v20 = MapsSuggestionsCurrentBestLocation();

      char IsValidLocation = MapsSuggestionsIsValidLocation();
      long long v22 = sub_1000493C0();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if ((IsValidLocation & 1) == 0)
      {
        if (v23)
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "The location from DiscoverySource is nil AND MapsSuggestionsCurrentBestLocation() is nil too. Returning and not showing the tip.", buf, 2u);
        }

        v10[2](v10, 0);
        goto LABEL_33;
      }
      if (v23)
      {
        [v20 coordinate];
        double v25 = v24;
        [v20 coordinate];
        *(_DWORD *)id buf = 134218240;
        double v50 = v25;
        __int16 v51 = 2048;
        double v52 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Location from the DiscoverySource is nil. Using MapsSuggestionsCurrentBestLocation(): %f, %f", buf, 0x16u);
      }
    }
    objc_super v27 = [v8 numberForKey:@"MapsSuggestionsFlightArrivalAirportLatitudeKey"];
    [v27 doubleValue];
    double v29 = v28;

    long long v30 = [v8 numberForKey:@"MapsSuggestionsFlightArrivalAirportLongitudeKey"];
    [v30 doubleValue];
    double v32 = v31;

    id v33 = [objc_alloc((Class)CLLocation) initWithLatitude:v29 longitude:v32];
    id v34 = sub_1000493C0();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 134218240;
      double v50 = v29;
      __int16 v51 = 2048;
      double v52 = v32;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Airport Arrival Tip: Arrival airport lat/long is %f, %f", buf, 0x16u);
    }

    [v33 distanceFromLocation:v20];
    double v36 = v35;
    GEOConfigGetDouble();
    double v38 = v37;
    v39 = sub_1000493C0();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    if (v36 <= v38)
    {
      if (v40)
      {
        *(_DWORD *)id buf = 134217984;
        double v50 = v36;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Airport Arrival Tip: User is considered to be at the arrival airport, because they are %f meters from the airport lat/long.", buf, 0xCu);
      }

      v41 = [v8 stringForKey:@"MapsSuggestionsFlightArrivalAirportLocalityKey"];
      if (v41)
      {
        v42 = +[NSBundle mainBundle];
        v43 = [v42 localizedStringForKey:@"MAPS_OFFLINE_TIP_TITLE_FOR_AIRPORT_ARRIVAL" value:@"localized string not found" table:@"Offline"];

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100A1BCF4;
        v46[3] = &unk_1013148B0;
        id v47 = [objc_alloc((Class)NSString) initWithFormat:v43, v41];
        v48 = v10;
        id v44 = v47;
        [(OfflineMapsSuggestionsDataProvider *)self _buildMapRegionForLatitude:v46 longitude:v29 handler:v32];
      }
      else
      {
        v45 = sub_1000493C0();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Airport Arrival Tip: MapsSuggestionsFlightArrivalAirportLocalityKey is nil, not showing airport arrival tip.", buf, 2u);
        }

        v10[2](v10, 0);
      }
    }
    else
    {
      if (v40)
      {
        *(_DWORD *)id buf = 134217984;
        double v50 = v36;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Airport Arrival Tip: User is %f meters from the airport lat/long, which is too far for an airport arrival tip.", buf, 0xCu);
      }

      v10[2](v10, 0);
    }

LABEL_33:
    goto LABEL_34;
  }
  dispatch_queue_t v13 = sub_1000493C0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    uint64_t v14 = "Airport Arrival Tip: Network is not reachable (user is not connected to WiFi), not constructing tip.";
    goto LABEL_9;
  }
LABEL_10:

  v10[2](v10, 0);
LABEL_34:
}

- (void)_fetchHomeAreaModelDataFromEntry:(id)a3 onQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = GEOConfigGetDate();
  uint64_t UInteger = GEOConfigGetUInteger();
  if (self->_clientType != 1) {
    goto LABEL_7;
  }
  uint64_t v13 = UInteger;
  if (!v11) {
    goto LABEL_4;
  }
  double v36 = v11;
  id v14 = v11;
  id v15 = objc_alloc_init((Class)NSDateComponents);
  [v15 setDay:-v13];
  int v16 = +[NSCalendar currentCalendar];
  id v17 = +[NSDate now];
  id v18 = [v16 dateByAddingComponents:v15 toDate:v17 options:0];

  id v19 = [v14 compare:v18];
  id v11 = v36;

  if (v19 == (id)-1)
  {
LABEL_7:
    BOOL v23 = sub_1000493C0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      double v24 = [v8 geoMapItem];
      [v24 coordinate];
      objc_super v27 = +[NSString stringWithFormat:@"%+.8f, %+.8f", v25, v26];
      *(_DWORD *)id buf = 138412290;
      uint64_t v44 = (uint64_t)v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Using home entry for the Offline Maps Home Area Tip with lat/long of %@", buf, 0xCu);
    }
    double v28 = [v8 geoMapItem];
    [v28 coordinate];
    double v30 = v29;
    double v31 = [v8 geoMapItem];
    [v31 coordinate];
    double v33 = v32;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100A1C2E8;
    v37[3] = &unk_101314900;
    long long v21 = (id *)v38;
    id v34 = v9;
    id v40 = v10;
    v38[0] = v34;
    v38[1] = self;
    id v39 = v8;
    id v35 = v10;
    [(OfflineMapsSuggestionsDataProvider *)self _buildMapRegionForLatitude:v37 longitude:v30 handler:v33];
  }
  else
  {
LABEL_4:
    long long v20 = sub_1000493C0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 134217984;
      uint64_t v44 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "User has either never tapped \"Remind Me Later\" for the Home Area tip or tapped it less than %lu days ago.", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A1C2D4;
    block[3] = &unk_1012E6EA8;
    long long v21 = &v42;
    id v42 = v10;
    id v22 = v10;
    dispatch_async(v9, block);
  }
}

- (void)_buildMapRegionForLatitude:(double)a3 longitude:(double)a4 handler:(id)a5
{
  id v6 = a5;
  GEOConfigGetInteger();
  GEOMapRectMakeWithRadialDistance();
  id v11 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v7, v8, v9, v10];
  unsigned int v12 = +[MapsOfflineUIHelper sharedHelper];
  GEOConfigGetDouble();
  unsigned int v13 = [v12 isRegionDownloaded:v11 requireFullyDownloaded:0 coverageRequirement:];

  if (v13)
  {
    id v14 = sub_1000493C0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Map Region that was built was already added, caling back with nil", buf, 2u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    unsigned int clientType = self->_clientType;
    if (clientType > 3 || clientType == 2)
    {
      id v18 = +[MapsOfflineUIHelper sharedHelper];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100A1CD30;
      v20[3] = &unk_1013149A0;
      id v22 = v6;
      id v21 = v11;
      id v19 = [v18 determineEstimatedSizeForSubscriptionWithRegion:v21 completionHandler:v20];
    }
    else
    {
      int v16 = sub_1000493C0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = self->_clientType;
        *(_DWORD *)id buf = 67109120;
        int v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Purposely not fetching region size for this client type: %d", buf, 8u);
      }

      (*((void (**)(id, id, void))v6 + 2))(v6, v11, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_insightsQueue, 0);
  objc_storeStrong((id *)&self->_msgEngineQueue, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

@end