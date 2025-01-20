@interface DTMFeatureDiscoverySource
+ (void)resetAllPreviousDismissals;
- (BOOL)_userPreviouslyDismissedTransportType:(int64_t)a3;
- (BOOL)isAvailable;
- (BOOL)wantsAllRouteCollectionChanges;
- (DTMFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4;
- (FeatureDiscoveryModel)model;
- (FeatureDiscoverySourceDelegate)delegate;
- (id)_bestModelForCurrentState;
- (int)_targetForTransportType:(int64_t)a3;
- (int64_t)_fetchRepeatedRecentTransportType;
- (int64_t)_performRemovalForTransportType;
- (int64_t)priority;
- (int64_t)repeatedTransportType;
- (int64_t)transportType;
- (void)_didDisplayModelForPreference:(int64_t)a3;
- (void)_dismiss;
- (void)_performDTMActionWithPreference:(int64_t)a3;
- (void)_recordDismissalForTransportType:(int64_t)a3;
- (void)_reloadAvailability;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
- (void)setRepeatedTransportType:(int64_t)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4;
@end

@implementation DTMFeatureDiscoverySource

- (DTMFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DTMFeatureDiscoverySource;
  v7 = [(DTMFeatureDiscoverySource *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = +[NSDate date];
    recentsCutoffDate = v8->_recentsCutoffDate;
    v8->_recentsCutoffDate = (NSDate *)v9;

    v8->_repeatedTransportType = [(DTMFeatureDiscoverySource *)v8 _fetchRepeatedRecentTransportType];
  }

  return v8;
}

- (BOOL)isAvailable
{
  v2 = [(DTMFeatureDiscoverySource *)self model];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t transportType = self->_transportType;
  if (transportType == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (transportType)
    {
      if (!a3)
      {
        recentsCutoffDate = self->_recentsCutoffDate;
        self->_recentsCutoffDate = 0;

        self->_repeatedTransportType = 0;
      }
    }
    else
    {
      uint64_t v9 = +[NSDate date];
      v10 = self->_recentsCutoffDate;
      self->_recentsCutoffDate = v9;

      self->_repeatedTransportType = [(DTMFeatureDiscoverySource *)self _fetchRepeatedRecentTransportType];
      v11 = sub_10000A540();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v12 = self->_repeatedTransportType - 1;
        if (v12 > 4) {
          CFStringRef v13 = @"Undefined";
        }
        else {
          CFStringRef v13 = *(&off_1012F0750 + v12);
        }
        v14 = self->_recentsCutoffDate;
        int v16 = 138412546;
        CFStringRef v17 = v13;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Fetched repeated type %@ given cut-off date %@", (uint8_t *)&v16, 0x16u);
      }

      if (GEOConfigGetBOOL())
      {
        v15 = sub_10000A540();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Will allow DTM suggestion to reappear for next route planning session", (uint8_t *)&v16, 2u);
        }

        self->_dismissed = 0;
      }
    }
    self->_int64_t transportType = a3;
    os_unfair_lock_unlock(p_lock);
    [(DTMFeatureDiscoverySource *)self _reloadAvailability];
  }
}

- (int64_t)_fetchRepeatedRecentTransportType
{
  BOOL v3 = +[Recents sharedRecents];
  v4 = [v3 orderedRecents];

  uint64_t UInteger = GEOConfigGetUInteger();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    int64_t v9 = 0;
    obj = v5;
    uint64_t v32 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v33 + 1) + 8 * i);
        unint64_t v12 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
        objc_opt_class();
        id v13 = v11;
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          int v16 = self;
          CFStringRef v17 = [v15 historyEntry];
          unsigned int v18 = [v17 conformsToProtocol:v12];

          if (v18) {
            id v19 = v13;
          }
          else {
            id v19 = 0;
          }
          self = v16;
        }
        else
        {
          id v19 = 0;
        }

        if (v19)
        {
          if (!self->_recentsCutoffDate) {
            goto LABEL_18;
          }
          v20 = [v19 historyEntry];
          v21 = [v20 usageDate];
          [v21 timeIntervalSinceDate:self->_recentsCutoffDate];
          double v23 = v22;

          if (v23 < 0.0)
          {
LABEL_18:
            v24 = [v19 historyEntry];
            id v25 = [v24 transportType];

            if (v9)
            {
              if ((id)v9 != v25)
              {

                int64_t v9 = 0;
                v5 = obj;
                goto LABEL_30;
              }
            }
            else
            {
              int64_t v9 = (int64_t)v25;
            }
            if (++v8 == UInteger)
            {
              v26 = sub_10000A540();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v38 = UInteger;
                __int16 v39 = 2048;
                int64_t v40 = v9;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "User has consistently (x%lu) requested routes of type: %ld", buf, 0x16u);
              }

              v5 = obj;
              v27 = obj;
              goto LABEL_33;
            }
          }
        }
      }
      v5 = obj;
      id v7 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v9 = 0;
    uint64_t v8 = 0;
  }
LABEL_30:

  v27 = sub_10000A540();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = [v5 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v38 = v8;
    __int16 v39 = 2048;
    int64_t v40 = v9;
    __int16 v41 = 2048;
    id v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "No clear pattern. hits: %lu repeatedTransportType: %ld numberOfRecents: %lu", buf, 0x20u);
  }
  int64_t v9 = 0;
LABEL_33:

  return v9;
}

- (FeatureDiscoveryModel)model
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_model;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    v5 = sub_10000A540();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will create model on demand", v7, 2u);
    }

    v4 = [(DTMFeatureDiscoverySource *)self _bestModelForCurrentState];
    os_unfair_lock_lock(p_lock);
    objc_storeStrong((id *)&self->_model, v4);
    os_unfair_lock_unlock(p_lock);
  }

  return v4;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 0;
}

- (id)_bestModelForCurrentState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL dismissed = self->_dismissed;
  int64_t transportType = self->_transportType;
  int64_t repeatedTransportType = self->_repeatedTransportType;
  os_unfair_lock_unlock(p_lock);
  if ((unint64_t)(transportType - 1) >= 5)
  {
    id v7 = sub_10000A540();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v51 = transportType;
      uint64_t v8 = "Will not suggest DTM change: current transport type %lu is not applicable.";
LABEL_7:
      int64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      uint32_t v11 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (dismissed)
  {
    id v7 = sub_10000A540();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "Will not suggest DTM change: it was dismissed by user since app launch.";
LABEL_11:
      int64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_12:
      uint32_t v11 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  unint64_t v12 = off_1012F0728[transportType - 1];
  if (GEOConfigGetBOOL())
  {
    id v7 = sub_10000A540();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "Will force hide DTM change suggestion.";
      goto LABEL_11;
    }
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  id v15 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v16 = [v15 BOOLForKey:@"DTMFeatureDiscoveryAllowForTests"];

  if ((v16 & 1) == 0
    && +[MapsAppDelegate mapsIsLaunchedForTesting])
  {
    id v7 = sub_10000A540();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Will force hide DTM change suggestion: app was launched for testing.";
    goto LABEL_11;
  }
  id v17 = [v12 integerValue];
  if (GEOConfigGetBOOL())
  {
    unsigned int v18 = sub_10000A540();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Will force show DTM change suggestion.", buf, 2u);
    }

    goto LABEL_26;
  }
  if ([(DTMFeatureDiscoverySource *)self _userPreviouslyDismissedTransportType:transportType])
  {
    id v7 = sub_10000A540();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Will not suggest DTM change: it was previously dismissed by user for this transport type.";
    goto LABEL_55;
  }
  if (!repeatedTransportType)
  {
    id v7 = sub_10000A540();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Will not suggest DTM change: no pattern in recents.";
    goto LABEL_55;
  }
  if (repeatedTransportType != transportType)
  {
    id v7 = sub_10000A540();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Will not suggest DTM change: pattern does not match current transport type.";
LABEL_55:
    int64_t v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
    goto LABEL_12;
  }
  if (v17 == (id)GEOGetUserTransportTypePreference())
  {
    id v7 = sub_10000A540();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Will not suggest DTM change: current matches preferred.";
    goto LABEL_55;
  }
LABEL_26:
  switch([(DTMFeatureDiscoverySource *)self transportType])
  {
    case 1:
      id v19 = +[NSBundle mainBundle];
      id v7 = [v19 localizedStringForKey:@"Prefer Driving [Title, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"Prefer Driving [Subtitle, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      double v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"Prefer Driving [Action, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];
      break;
    case 2:
      v26 = +[NSBundle mainBundle];
      id v7 = [v26 localizedStringForKey:@"Prefer Walking [Title, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      v27 = +[NSBundle mainBundle];
      v21 = [v27 localizedStringForKey:@"Prefer Walking [Subtitle, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      double v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"Prefer Walking [Action, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];
      break;
    case 3:
      id v28 = +[NSBundle mainBundle];
      id v7 = [v28 localizedStringForKey:@"Prefer Transit [Title, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      v29 = +[NSBundle mainBundle];
      v21 = [v29 localizedStringForKey:@"Prefer Transit [Subtitle, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      double v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"Prefer Transit [Action, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];
      break;
    case 4:
      v30 = +[NSBundle mainBundle];
      id v7 = [v30 localizedStringForKey:@"Prefer Ride-Sharing [Title, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      v31 = +[NSBundle mainBundle];
      v21 = [v31 localizedStringForKey:@"Prefer Ride-Sharing [Subtitle, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      double v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"Prefer Ride-Sharing [Action, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];
      break;
    case 5:
      uint64_t v32 = +[NSBundle mainBundle];
      id v7 = [v32 localizedStringForKey:@"Prefer Cycling [Title, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      long long v33 = +[NSBundle mainBundle];
      v21 = [v33 localizedStringForKey:@"Prefer Cycling [Subtitle, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];

      double v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"Prefer Cycling [Action, Route Planning, Feature Discovery, DTM]", @"localized string not found", 0 value table];
      break;
    default:
      id v7 = sub_10000A540();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      int64_t v24 = [(DTMFeatureDiscoverySource *)self transportType];
      if ((unint64_t)(v24 - 1) > 4) {
        CFStringRef v25 = @"Undefined";
      }
      else {
        CFStringRef v25 = *(&off_1012F0750 + v24 - 1);
      }
      *(_DWORD *)buf = 138412290;
      int64_t v51 = (int64_t)v25;
      uint64_t v8 = "Will not suggest DTM change: unknown transport type %@";
      goto LABEL_7;
  }
  long long v34 = (void *)v23;

  long long v35 = +[UIDevice currentDevice];
  BOOL v36 = [v35 userInterfaceIdiom] == (id)5;

  if (v36)
  {
    v37 = +[NSBundle mainBundle];
    uint64_t v38 = [v37 localizedStringForKey:@"Change [Action, Route Planning, Feature Discovery, DTM", @"localized string not found", 0 value table];

    long long v34 = (void *)v38;
  }
  __int16 v39 = sub_10000A540();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v40 = [(DTMFeatureDiscoverySource *)self transportType];
    if ((unint64_t)(v40 - 1) > 4) {
      CFStringRef v41 = @"Undefined";
    }
    else {
      CFStringRef v41 = *(&off_1012F0750 + v40 - 1);
    }
    *(_DWORD *)buf = 138412290;
    int64_t v51 = (int64_t)v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Will suggest DTM change to %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v42 = [FeatureDiscoveryModel alloc];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100594284;
  v48[3] = &unk_1012F0708;
  objc_copyWeak(v49, (id *)buf);
  v49[1] = v17;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1005942D4;
  v46[3] = &unk_1012F0708;
  objc_copyWeak(v47, (id *)buf);
  v47[1] = v17;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100594324;
  v44[3] = &unk_1012E6708;
  objc_copyWeak(&v45, (id *)buf);
  LOBYTE(v43) = 0;
  id v13 = [(FeatureDiscoveryModel *)v42 initWithImage:0 title:v7 subtitle:v21 actionTitle:v34 actionHandler:v48 bodyTapHandler:0 displayedHandler:v46 dismissHandler:v44 disableAffordanceAfterAction:v43];
  objc_destroyWeak(&v45);
  objc_destroyWeak(v47);
  objc_destroyWeak(v49);
  objc_destroyWeak((id *)buf);

LABEL_15:

  return v13;
}

- (void)_reloadAvailability
{
  BOOL v3 = [(DTMFeatureDiscoverySource *)self _bestModelForCurrentState];
  os_unfair_lock_lock(&self->_lock);
  model = self->_model;
  id v5 = v3;
  id v6 = (FeatureDiscoveryModel *)v5;
  if ((unint64_t)v5 | (unint64_t)model) {
    unsigned int v7 = [v5 isEqual:model] ^ 1;
  }
  else {
    unsigned int v7 = 0;
  }

  uint64_t v8 = self->_model;
  self->_model = v6;

  os_unfair_lock_unlock(&self->_lock);
  if ((v6 != 0) != (model != 0) || v7)
  {
    int64_t v9 = sub_10000A540();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        os_log_type_t v10 = @"YES";
      }
      else {
        os_log_type_t v10 = @"NO";
      }
      uint32_t v11 = v10;
      if (v7) {
        unint64_t v12 = @"YES";
      }
      else {
        unint64_t v12 = @"NO";
      }
      id v13 = v12;
      int v15 = 138412546;
      unsigned __int8 v16 = v11;
      __int16 v17 = 2112;
      unsigned int v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Did update availability of DTM source to: %@, new model: %@", (uint8_t *)&v15, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained source:self didUpdateAvailability:v6 != 0];
  }
}

- (void)_didDisplayModelForPreference:(int64_t)a3
{
  id v5 = sub_10000A540();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Suggestion was displayed to change DTM", v10, 2u);
  }

  switch(a3)
  {
    case 0:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 64;
      goto LABEL_9;
    case 1:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 66;
      goto LABEL_9;
    case 2:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 65;
      goto LABEL_9;
    case 3:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 71;
      goto LABEL_9;
    case 4:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 2175;
LABEL_9:
      [v8 captureUserAction:v9 onTarget:v7 eventValue:0];

      break;
    default:
      return;
  }
}

- (void)_performDTMActionWithPreference:(int64_t)a3
{
  id v5 = sub_10000A540();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User accepted suggestion, changing DTM to %ld", (uint8_t *)&v10, 0xCu);
  }

  switch(a3)
  {
    case 0:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 68;
      goto LABEL_9;
    case 1:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 70;
      goto LABEL_9;
    case 2:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 69;
      goto LABEL_9;
    case 3:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 72;
      goto LABEL_9;
    case 4:
      id v6 = +[MKMapService sharedService];
      uint64_t v7 = [(DTMFeatureDiscoverySource *)self _targetForTransportType:self->_transportType];
      uint64_t v8 = v6;
      uint64_t v9 = 2180;
LABEL_9:
      [v8 captureUserAction:v9 onTarget:v7 eventValue:0];

      break;
    default:
      break;
  }
  GEOSetUserTransportTypePreference();
  [(DTMFeatureDiscoverySource *)self _performRemovalForTransportType];
}

- (void)_dismiss
{
  BOOL v3 = sub_10000A540();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "User dismissed suggestion to change DTM", v4, 2u);
  }

  [(DTMFeatureDiscoverySource *)self _recordDismissalForTransportType:[(DTMFeatureDiscoverySource *)self _performRemovalForTransportType]];
}

- (int64_t)_performRemovalForTransportType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL dismissed = 1;
  int64_t transportType = self->_transportType;
  os_unfair_lock_unlock(p_lock);
  [(DTMFeatureDiscoverySource *)self _reloadAvailability];
  return transportType;
}

- (BOOL)_userPreviouslyDismissedTransportType:(int64_t)a3
{
  v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:@"PreferDTMDismissedTransportTypes"];

  if ((unint64_t)(a3 - 1) > 4)
  {
    uint64_t v6 = 4;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    unsigned __int8 v8 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = dword_100F6FE00[a3 - 1];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = +[NSNumber numberWithInt:v6];
  unsigned __int8 v8 = [v5 containsObject:v7];

LABEL_6:
  return v8;
}

- (void)_recordDismissalForTransportType:(int64_t)a3
{
  v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"PreferDTMDismissedTransportTypes"];

  if (v5) {
    uint64_t v6 = (void *)v5;
  }
  else {
    uint64_t v6 = &__NSArray0__struct;
  }
  id v7 = [v6 mutableCopy];
  if ((unint64_t)(a3 - 1) >= 5)
  {
    int64_t v11 = sub_10000A540();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      CFStringRef v12 = @"Bicycle";
      if (!a3) {
        CFStringRef v12 = @"Undefined";
      }
      int v15 = 138412290;
      CFStringRef v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Will not record dimissal, transport type resolved to UNKNOWN (%@)", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = dword_100F6FE00[a3 - 1];
    uint64_t v9 = sub_10000A540();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 2) > 3) {
        CFStringRef v10 = @"Drive";
      }
      else {
        CFStringRef v10 = *(&off_1012F0778 + a3 - 2);
      }
      int v15 = 138412290;
      CFStringRef v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Recording user dismissal for DTM switch (%@)", (uint8_t *)&v15, 0xCu);
    }

    id v13 = +[NSNumber numberWithInt:v8];
    [v7 addObject:v13];

    int64_t v11 = +[NSUserDefaults standardUserDefaults];
    id v14 = [v7 copy];
    [v11 setObject:v14 forKey:@"PreferDTMDismissedTransportTypes"];
  }
}

+ (void)resetAllPreviousDismissals
{
  v2 = sub_10000A540();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Resetting user dismissals for DTM switch", v4, 2u);
  }

  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"PreferDTMDismissedTransportTypes"];
}

- (int)_targetForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 5) {
    return 0;
  }
  else {
    return a3 + 300;
  }
}

- (FeatureDiscoverySourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FeatureDiscoverySourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_int64_t transportType = a3;
}

- (int64_t)repeatedTransportType
{
  return self->_repeatedTransportType;
}

- (void)setRepeatedTransportType:(int64_t)a3
{
  self->_int64_t repeatedTransportType = a3;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_recentsCutoffDate, 0);
}

@end