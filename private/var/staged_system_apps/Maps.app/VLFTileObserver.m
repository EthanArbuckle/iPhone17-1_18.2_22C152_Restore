@interface VLFTileObserver
- (BOOL)areTilesAvailable;
- (BOOL)isAvailabilityCheckInFlight;
- (BOOL)isNavigatingInUnsupportedTransportType;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (CLLocationCoordinate2D)previouslyCheckedCoordinate;
- (GEOObserverHashTable)observers;
- (MKLocationManager)locationManager;
- (MNNavigationService)navigationService;
- (NSDate)lastErrorDate;
- (VLFTileObserver)initWithLocationManager:(id)a3 navigationService:(id)a4 purpose:(int64_t)a5;
- (VLLocalizer)localizer;
- (double)distanceThreshold;
- (double)errorTimeoutThreshold;
- (int64_t)purpose;
- (void)addAvailabilityObserver:(id)a3;
- (void)checkForTileAvailabilityAtLocation:(id)a3;
- (void)checkForUnsupportedNavigationTransportType;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)removeAvailabilityObserver:(id)a3;
- (void)setAreTilesAvailable:(BOOL)a3;
- (void)setAvailabilityCheckInFlight:(BOOL)a3;
- (void)setLastErrorDate:(id)a3;
- (void)setLocalizer:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setNavigatingInUnsupportedTransportType:(BOOL)a3;
- (void)setNavigationService:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreviouslyCheckedCoordinate:(CLLocationCoordinate2D)a3;
- (void)setPurpose:(int64_t)a3;
@end

@implementation VLFTileObserver

- (void)addAvailabilityObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(VLFTileObserver *)self observers];
  [v5 registerObserver:v4];
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (VLFTileObserver)initWithLocationManager:(id)a3 navigationService:(id)a4 purpose:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[VLFTileObserver initWithLocationManager:navigationService:purpose:]";
      __int16 v28 = 2080;
      v29 = "VLFTileObserver.m";
      __int16 v30 = 1024;
      int v31 = 54;
      __int16 v32 = 2080;
      v33 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v10)
  {
    v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[VLFTileObserver initWithLocationManager:navigationService:purpose:]";
      __int16 v28 = 2080;
      v29 = "VLFTileObserver.m";
      __int16 v30 = 1024;
      int v31 = 55;
      __int16 v32 = 2080;
      v33 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v27 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)VLFTileObserver;
  v11 = [(VLFTileObserver *)&v25 init];
  if (v11)
  {
    v12 = sub_10009E2D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v27 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v11->_purpose = a5;
    v13 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___VLFTileAvailabilityObserver queue:&_dispatch_main_q];
    observers = v11->_observers;
    v11->_observers = v13;

    objc_storeStrong((id *)&v11->_locationManager, a3);
    [(MKLocationManager *)v11->_locationManager listenForLocationUpdates:v11];
    objc_storeStrong((id *)&v11->_navigationService, a4);
    [(MNNavigationService *)v11->_navigationService registerObserver:v11];
    [(VLFTileObserver *)v11 checkForUnsupportedNavigationTransportType];
    v15 = (VLLocalizer *)[objc_alloc((Class)VLLocalizer) initWithAuditToken:0];
    localizer = v11->_localizer;
    v11->_localizer = v15;

    v11->_previouslyCheckedCoordinate = kCLLocationCoordinate2DInvalid;
    v17 = [(MKLocationManager *)v11->_locationManager lastLocation];
    if (v17) {
      [(VLFTileObserver *)v11 checkForTileAvailabilityAtLocation:v17];
    }
  }
  return v11;
}

- (void)checkForUnsupportedNavigationTransportType
{
  v3 = [(VLFTileObserver *)self navigationService];
  unsigned __int8 v4 = [v3 isInNavigatingState];

  if ((v4 & 1) == 0)
  {
    v8 = sub_10009E2D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 134349056;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Detected not navigating", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_10;
  }
  id v5 = [(VLFTileObserver *)self navigationService];
  unsigned int v6 = [v5 navigationTransportType] - 1;
  if (v6 > 5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = qword_100F70240[v6];
  }
  unsigned __int8 v9 = +[VLFSessionTask isSupportedForTransportType:v7];

  v8 = sub_10009E2D4();
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v10)
    {
      v11 = [(VLFTileObserver *)self navigationService];
      int v13 = 134349312;
      v14 = self;
      __int16 v15 = 1024;
      unsigned int v16 = [v11 navigationTransportType];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Detected navigating in a supported transport type: %d", (uint8_t *)&v13, 0x12u);
    }
LABEL_10:

    [(VLFTileObserver *)self setNavigatingInUnsupportedTransportType:0];
    return;
  }
  if (v10)
  {
    v12 = [(VLFTileObserver *)self navigationService];
    int v13 = 134349312;
    v14 = self;
    __int16 v15 = 1024;
    unsigned int v16 = [v12 navigationTransportType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Detected navigating in an unsupported transport type: %d", (uint8_t *)&v13, 0x12u);
  }
  [(VLFTileObserver *)self setNavigatingInUnsupportedTransportType:1];
  [(VLFTileObserver *)self setAreTilesAvailable:0];
}

- (void)setNavigatingInUnsupportedTransportType:(BOOL)a3
{
  if (self->_navigatingInUnsupportedTransportType != a3)
  {
    self->_navigatingInUnsupportedTransportType = a3;
    if (!a3)
    {
      unsigned __int8 v4 = sub_10009E2D4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v5 = 134349056;
        unsigned int v6 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] No longer navigating in an unsupported transport type; clearing previously checked coordinate",
          (uint8_t *)&v5,
          0xCu);
      }

      -[VLFTileObserver setPreviouslyCheckedCoordinate:](self, "setPreviouslyCheckedCoordinate:", kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);
    }
  }
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)checkForTileAvailabilityAtLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v28 = sub_1005762E4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "-[VLFTileObserver checkForTileAvailabilityAtLocation:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "VLFTileObserver.m";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 148;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "dispatch_get_main_queue()";
        *(_WORD *)&buf[38] = 2080;
        v41 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v42 = 2080;
        v43 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v29 = sub_1005762E4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          __int16 v30 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(VLFTileObserver *)self isAvailabilityCheckInFlight])
  {
    v8 = sub_10009E2D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] An availability check is currently in flight; ignoring",
        buf,
        0xCu);
    }
LABEL_34:

    goto LABEL_35;
  }
  if ([(VLFTileObserver *)self isNavigatingInUnsupportedTransportType])
  {
    v8 = sub_10009E2D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Currently navigating with an unsupported transport type; ignoring",
        buf,
        0xCu);
    }
    goto LABEL_34;
  }
  unsigned __int8 v9 = [(VLFTileObserver *)self lastErrorDate];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    [(VLFTileObserver *)self errorTimeoutThreshold];
    double v12 = v11;
    int v13 = +[NSDate date];
    v14 = [(VLFTileObserver *)self lastErrorDate];
    [v13 timeIntervalSinceDate:v14];
    BOOL v16 = v15 >= v12;

    v8 = sub_10009E2D4();
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (!v16)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349312;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] An error occurred less than %f seconds ago; ignoring",
          buf,
          0x16u);
      }
      goto LABEL_34;
    }
    if (v17)
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Error timeout has passed, will start checking tile availability again", buf, 0xCu);
    }

    [(VLFTileObserver *)self setLastErrorDate:0];
  }
  [v4 coordinate];
  CLLocationCoordinate2D v39 = v44;
  if (!CLLocationCoordinate2DIsValid(v44))
  {
    v8 = sub_10009E2D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}p] Invalid coordinate from location update; ignoring",
        buf,
        0xCu);
    }
    goto LABEL_34;
  }
  [(VLFTileObserver *)self previouslyCheckedCoordinate];
  if (CLLocationCoordinate2DIsValid(v45))
  {
    [(VLFTileObserver *)self distanceThreshold];
    double v19 = v18;
    CLLocationCoordinate2DGetDistanceFrom();
    double v21 = v20;
    if (v20 < v19)
    {
      v8 = sub_10009E2D4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349568;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v19;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Distance from previous tile availability check (%.2f) is less than %.2f meters; ignoring",
          buf,
          0x20u);
      }
      goto LABEL_34;
    }
  }
  v22 = sub_10009E2D4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int64_t v23 = [(VLFTileObserver *)self purpose];
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[%{public}p] Checking for VLF tile availability at the current location for purpose: %ld", buf, 0x16u);
  }

  GEOLocationCoordinate2DFromCLLocationCoordinate2D();
  [v4 altitude];
  VLECEFFromCoordinate();
  long long v31 = v38;
  long long v32 = v37;
  [v4 horizontalAccuracy];
  uint64_t v25 = v24;
  [(VLFTileObserver *)self setAvailabilityCheckInFlight:1];
  objc_initWeak(&location, self);
  v26 = [(VLFTileObserver *)self localizer];
  int64_t v27 = [(VLFTileObserver *)self purpose];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10067C534;
  v33[3] = &unk_1012F3F00;
  objc_copyWeak(&v34, &location);
  CLLocationCoordinate2D v35 = v39;
  *(_OWORD *)buf = v32;
  *(_OWORD *)&buf[16] = v31;
  *(void *)&buf[32] = v25;
  v41 = 0;
  [v26 determineAvailabilityAtLocation:buf purpose:v27 callbackQueue:&_dispatch_main_q callback:v33];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
LABEL_35:
}

- (void)setAvailabilityCheckInFlight:(BOOL)a3
{
  self->_availabilityCheckInFlight = a3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (CLLocationCoordinate2D)previouslyCheckedCoordinate
{
  double latitude = self->_previouslyCheckedCoordinate.latitude;
  double longitude = self->_previouslyCheckedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (VLLocalizer)localizer
{
  return self->_localizer;
}

- (NSDate)lastErrorDate
{
  return self->_lastErrorDate;
}

- (BOOL)isNavigatingInUnsupportedTransportType
{
  return self->_navigatingInUnsupportedTransportType;
}

- (BOOL)isAvailabilityCheckInFlight
{
  return self->_availabilityCheckInFlight;
}

- (BOOL)areTilesAvailable
{
  return self->_areTilesAvailable;
}

- (void)dealloc
{
  v3 = sub_10009E2D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    unsigned int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  [(MKLocationManager *)self->_locationManager stopListeningForLocationUpdates:self];
  v4.receiver = self;
  v4.super_class = (Class)VLFTileObserver;
  [(VLFTileObserver *)&v4 dealloc];
}

- (void)removeAvailabilityObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(VLFTileObserver *)self observers];
  [v5 unregisterObserver:v4];
}

- (double)errorTimeoutThreshold
{
  GEOConfigGetDouble();
  return result;
}

- (double)distanceThreshold
{
  GEOConfigGetDouble();
  return result;
}

- (void)setAreTilesAvailable:(BOOL)a3
{
  if (self->_areTilesAvailable != a3)
  {
    self->_areTilesAvailable = a3;
    id v4 = [(VLFTileObserver *)self observers];
    [v4 tileObserver:self didChangeTileAvailability:self->_areTilesAvailable];
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = [a3 lastLocation];
  if (v4)
  {
    [(VLFTileObserver *)self checkForTileAvailabilityAtLocation:v4];
  }
  else
  {
    id v5 = sub_10009E2D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134349056;
      BOOL v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Got nil location update; ignoring",
        (uint8_t *)&v6,
        0xCu);
    }
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (void)setObservers:(id)a3
{
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void)setLocalizer:(id)a3
{
}

- (void)setNavigationService:(id)a3
{
}

- (void)setLastErrorDate:(id)a3
{
}

- (void)setPreviouslyCheckedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_previouslyCheckedCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastErrorDate, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_localizer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end