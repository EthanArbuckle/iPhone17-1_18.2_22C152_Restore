@interface NavigationCustomFeaturesSource
- (BOOL)isUpdatingCoalesced;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldUseDebugAttributes;
- (CLLocationCoordinate2D)lastUpdateLocation;
- (CLLocationCoordinate2D)overriddenPointToFrame;
- (NSArray)items;
- (NavigationCustomFeaturesPointsFraming)pointsFramer;
- (NavigationCustomFeaturesSource)initWithPointsFramer:(id)a3;
- (OS_dispatch_queue)lockQueue;
- (double)lastUpdateTimestamp;
- (id)allItems;
- (int64_t)framingMode;
- (void)_updateCoalesced;
- (void)_updateFraming;
- (void)_updateFramingWithNewLocationIfNeeded;
- (void)_updateLocationManager;
- (void)dealloc;
- (void)displayMapItems:(id)a3;
- (void)locationManagerDidReset:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)removeMapItems;
- (void)setFramingMode:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setLastUpdateLocation:(CLLocationCoordinate2D)a3;
- (void)setLastUpdateTimestamp:(double)a3;
- (void)setLockQueue:(id)a3;
- (void)setOverriddenPointToFrame:(CLLocationCoordinate2D)a3;
- (void)setPointsFramer:(id)a3;
- (void)setShouldUseDebugAttributes:(BOOL)a3;
- (void)setUpdatingCoalesced:(BOOL)a3;
@end

@implementation NavigationCustomFeaturesSource

- (NavigationCustomFeaturesSource)initWithPointsFramer:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NavigationCustomFeaturesSource;
  v6 = [(NavigationCustomFeaturesSource *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pointsFramer, a3);
    v7->_framingMode = 0;
    v7->_overriddenPointToFrame = kCLLocationCoordinate2DInvalid;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("NavigationCustomFeaturesSource.lock", v8);
    lockQueue = v7->_lockQueue;
    v7->_lockQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)dealloc
{
  [(NavigationCustomFeaturesPointsFraming *)self->_pointsFramer setSearchAlongTheRoutePoints:0];
  v3 = +[MKLocationManager sharedLocationManager];
  [v3 stopLocationUpdateWithObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NavigationCustomFeaturesSource;
  [(NavigationCustomFeaturesSource *)&v4 dealloc];
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  id v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR: setting items: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004B97D8;
  block[3] = &unk_1012EC608;
  id v7 = v4;
  id v9 = v7;
  v10 = self;
  p_long long buf = &buf;
  dispatch_sync(lockQueue, block);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    [(NavigationCustomFeaturesSource *)self _updateFraming];
    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }

  _Block_object_dispose(&buf, 8);
}

- (void)setOverriddenPointToFrame:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  p_overriddenPointToFrame = &self->_overriddenPointToFrame;
  if (self->_overriddenPointToFrame.latitude != a3.latitude || self->_overriddenPointToFrame.longitude != a3.longitude)
  {
    id v7 = sub_100109E50();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134218240;
      CLLocationDegrees v9 = latitude;
      __int16 v10 = 2048;
      CLLocationDegrees v11 = longitude;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR: setting overriddenPointToFrame. Lat: %f. Lng: %f", (uint8_t *)&v8, 0x16u);
    }

    p_overriddenPointToFrame->CLLocationDegrees latitude = latitude;
    p_overriddenPointToFrame->CLLocationDegrees longitude = longitude;
    [(NavigationCustomFeaturesSource *)self _updateCoalesced];
  }
}

- (void)_updateCoalesced
{
  if (![(NavigationCustomFeaturesSource *)self isUpdatingCoalesced])
  {
    [(NavigationCustomFeaturesSource *)self setUpdatingCoalesced:1];
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0, 100000001);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1004B9A18;
    v4[3] = &unk_1012E6708;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_updateFraming
{
  v2 = sub_100109E50();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v3 = [(NavigationCustomFeaturesSource *)self items];
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "SAR: _updateFraming for items: %@", buf, 0xCu);
  }
  id v4 = +[MKLocationManager sharedLocationManager];
  id v5 = [v4 lastLocation];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;

  +[NSDate timeIntervalSinceReferenceDate];
  -[NavigationCustomFeaturesSource setLastUpdateTimestamp:](self, "setLastUpdateTimestamp:");
  -[NavigationCustomFeaturesSource setLastUpdateLocation:](self, "setLastUpdateLocation:", v7, v9);
  [(NavigationCustomFeaturesSource *)self _updateLocationManager];
  [(NavigationCustomFeaturesSource *)self overriddenPointToFrame];
  if (CLLocationCoordinate2DIsValid(v55))
  {
    __int16 v10 = sub_100109E50();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SAR: framing single point only", buf, 2u);
    }

    CLLocationDegrees v11 = [(NavigationCustomFeaturesSource *)self pointsFramer];
    [(NavigationCustomFeaturesSource *)self overriddenPointToFrame];
    objc_super v12 = +[NSValue valueWithMKCoordinate:](NSValue, "valueWithMKCoordinate:");
    v50 = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:&v50 count:1];
    [v11 setSearchAlongTheRoutePoints:v13];
  }
  else
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = sub_100103C4C;
    v47 = sub_1001046B0;
    id v48 = 0;
    lockQueue = self->_lockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004BA084;
    block[3] = &unk_1012E73F0;
    void block[4] = self;
    block[5] = &v43;
    dispatch_sync(lockQueue, block);
    if ([(id)v44[5] count])
    {
      int64_t v15 = [(NavigationCustomFeaturesSource *)self framingMode];
      if (v15)
      {
        if (v15 == 1)
        {
          v16 = (void *)v44[5];
          *(void *)long long buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1004BA8C4;
          v52 = &unk_1012EC628;
          double v53 = v7;
          double v54 = v9;
          v17 = [v16 sortedArrayUsingComparator:buf];
          if ((unint64_t)[v17 count] > 2) {
            uint64_t v18 = 3;
          }
          else {
            uint64_t v18 = (uint64_t)[v17 count];
          }
          [v17 subarrayWithRange:0, v18];
          id v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = (id)v44[5];
      }
      v22 = sub_100109E50();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int64_t v23 = [(NavigationCustomFeaturesSource *)self framingMode];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SAR: items to frame: %@ framingMode: %ld", buf, 0x16u);
      }

      v24 = objc_opt_new();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v20 = v21;
      id v25 = [v20 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v39;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v39 != v26) {
              objc_enumerationMutation(v20);
            }
            v28 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v29 = sub_100109E50();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = [v28 mapItem];
              v31 = [v30 name];
              [v28 coordinate];
              uint64_t v33 = v32;
              [v28 coordinate];
              *(_DWORD *)long long buf = 138412802;
              *(void *)&buf[4] = v31;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v33;
              *(_WORD *)&buf[22] = 2048;
              v52 = v34;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "SAR: Adding point for Item: %@. Lat: %f. Lng: %f. ", buf, 0x20u);
            }
            [v28 coordinate];
            v35 = +[NSValue valueWithMKCoordinate:](NSValue, "valueWithMKCoordinate:");
            [v24 addObject:v35];
          }
          id v25 = [v20 countByEnumeratingWithState:&v38 objects:v49 count:16];
        }
        while (v25);
      }

      v36 = [(NavigationCustomFeaturesSource *)self pointsFramer];
      [v36 setSearchAlongTheRoutePoints:v24];
    }
    else
    {
      v19 = sub_100109E50();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "SAR: Not framing any SAR items as no items are set.", buf, 2u);
      }

      id v20 = [(NavigationCustomFeaturesSource *)self pointsFramer];
      [v20 setSearchAlongTheRoutePoints:0];
    }

    _Block_object_dispose(&v43, 8);
  }
}

- (void)_updateFramingWithNewLocationIfNeeded
{
  if ((id)[(NavigationCustomFeaturesSource *)self framingMode] == (id)1)
  {
    [(NavigationCustomFeaturesSource *)self overriddenPointToFrame];
    if (!CLLocationCoordinate2DIsValid(v17))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v4 = v3;
      [(NavigationCustomFeaturesSource *)self lastUpdateTimestamp];
      if (v4 - v5 >= 10.0)
      {
        double v6 = +[MKLocationManager sharedLocationManager];
        double v7 = [v6 lastLocation];
        [v7 coordinate];
        uint64_t v15 = v8;
        uint64_t v16 = v9;

        [(NavigationCustomFeaturesSource *)self lastUpdateLocation];
        uint64_t v13 = v10;
        uint64_t v14 = v11;
        CLLocationCoordinate2DGetDistanceFrom();
        if (v12 >= 100.0) {
          [(NavigationCustomFeaturesSource *)self _updateFraming];
        }
      }
    }
  }
}

- (void)_updateLocationManager
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004BA2F0;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  if ((id)[(NavigationCustomFeaturesSource *)self framingMode] == (id)1
    && *((unsigned char *)v7 + 24)
    && ([(NavigationCustomFeaturesSource *)self overriddenPointToFrame],
        !CLLocationCoordinate2DIsValid(v10)))
  {
    double v4 = +[MKLocationManager sharedLocationManager];
    [v4 startLocationUpdateWithObserver:self];
  }
  else
  {
    double v4 = +[MKLocationManager sharedLocationManager];
    [v4 stopLocationUpdateWithObserver:self];
  }

  _Block_object_dispose(&v6, 8);
}

- (void)setFramingMode:(int64_t)a3
{
  if (self->_framingMode != a3)
  {
    self->_framingMode = a3;
    [(NavigationCustomFeaturesSource *)self _updateFraming];
  }
}

- (id)allItems
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100103C4C;
  CLLocationCoordinate2D v10 = sub_1001046B0;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004BA46C;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)displayMapItems:(id)a3
{
  id v4 = a3;
  double v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR: displayMapItems: %@", buf, 0xCu);
  }

  uint64_t v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        uint64_t v13 = [NavigationCustomFeatureItem alloc];
        uint64_t v14 = -[NavigationCustomFeatureItem initWithMapItem:](v13, "initWithMapItem:", v12, (void)v15);
        [v6 addObject:v14];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(NavigationCustomFeaturesSource *)self setItems:v6];
}

- (void)removeMapItems
{
  id v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(NavigationCustomFeaturesSource *)self items];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SAR: removeMapItems: %@", (uint8_t *)&v5, 0xCu);
  }
  [(NavigationCustomFeaturesSource *)self setItems:0];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
}

- (void)locationManagerDidReset:(id)a3
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (NavigationCustomFeaturesPointsFraming)pointsFramer
{
  return self->_pointsFramer;
}

- (void)setPointsFramer:(id)a3
{
}

- (int64_t)framingMode
{
  return self->_framingMode;
}

- (CLLocationCoordinate2D)overriddenPointToFrame
{
  double latitude = self->_overriddenPointToFrame.latitude;
  double longitude = self->_overriddenPointToFrame.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
}

- (BOOL)shouldUseDebugAttributes
{
  return self->_shouldUseDebugAttributes;
}

- (void)setShouldUseDebugAttributes:(BOOL)a3
{
  self->_shouldUseDebugAttributes = a3;
}

- (CLLocationCoordinate2D)lastUpdateLocation
{
  double latitude = self->_lastUpdateLocation.latitude;
  double longitude = self->_lastUpdateLocation.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLastUpdateLocation:(CLLocationCoordinate2D)a3
{
  self->_lastUpdateLocation = a3;
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (void)setLastUpdateTimestamp:(double)a3
{
  self->_lastUpdateTimestamp = a3;
}

- (BOOL)isUpdatingCoalesced
{
  return self->_updatingCoalesced;
}

- (void)setUpdatingCoalesced:(BOOL)a3
{
  self->_updatingCoalesced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_pointsFramer, 0);
}

@end