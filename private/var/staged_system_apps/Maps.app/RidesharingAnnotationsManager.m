@interface RidesharingAnnotationsManager
- (BOOL)hasConfirmedRide;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (IOSBasedChromeViewController)chromeViewController;
- (MKAnnotationView)vehicleAnnotationView;
- (MKMapView)mapView;
- (MKMarkerAnnotationView)pickupAnnotationView;
- (MKPointAnnotation)pickupAnnotation;
- (MKPointAnnotation)vehicleAnnotation;
- (NSArray)waypointAnnotations;
- (NSDate)lastVehicleLocationUpdateDate;
- (NSString)applicationIdentifier;
- (RideBookingRideStatus)rideStatus;
- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy;
- (RidesharingAnnotationsManager)initWithMapView:(id)a3;
- (RidesharingBalloonETAView)ETAView;
- (RidesharingPOIAnnotation)dropoffAnnotation;
- (_MKCustomFeatureStore)customFeatureStore;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)_updateFromRideStatus:(id)a3;
- (void)addCurrentRideWithApplicationIdentifier:(id)a3;
- (void)removeCurrentRide;
- (void)rideStatusMapDidChange:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setCustomFeatureStore:(id)a3;
- (void)setDropoffAnnotation:(id)a3;
- (void)setETAView:(id)a3;
- (void)setHasConfirmedRide:(BOOL)a3;
- (void)setLastVehicleLocationUpdateDate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setPickupAnnotation:(id)a3;
- (void)setPickupAnnotationView:(id)a3;
- (void)setRideStatus:(id)a3;
- (void)setRideStatusObserverProxy:(id)a3;
- (void)setVehicleAnnotation:(id)a3;
- (void)setVehicleAnnotationView:(id)a3;
- (void)setWaypointAnnotations:(id)a3;
@end

@implementation RidesharingAnnotationsManager

- (RidesharingAnnotationsManager)initWithMapView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RidesharingAnnotationsManager;
  v6 = [(RidesharingAnnotationsManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    v8 = (_MKCustomFeatureStore *)[objc_alloc((Class)_MKCustomFeatureStore) initWithClustering:0];
    customFeatureStore = v7->_customFeatureStore;
    v7->_customFeatureStore = v8;
  }
  return v7;
}

- (void)addCurrentRideWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  [(RidesharingAnnotationsManager *)self removeCurrentRide];
  mapView = self->_mapView;
  v6 = [(RidesharingAnnotationsManager *)self customFeatureStore];
  [(MKMapView *)mapView _addCustomFeatureDataSource:v6];

  self->_shouldReframeMapView = 1;
  id v7 = [v4 copy];

  [(RidesharingAnnotationsManager *)self setApplicationIdentifier:v7];
  v8 = [[RideBookingRideStatusObserverProxy alloc] initWithDelegate:self];
  [(RidesharingAnnotationsManager *)self setRideStatusObserverProxy:v8];
}

- (void)removeCurrentRide
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Removing current ride"];
    *(_DWORD *)buf = 136315394;
    v19 = v4;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  v6 = [(RidesharingAnnotationsManager *)self chromeViewController];
  id v7 = [v6 currentIOSBasedContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  [(RidesharingAnnotationsManager *)self setRideStatusObserverProxy:0];
  [(RidesharingAnnotationsManager *)self setApplicationIdentifier:0];
  [(RidesharingAnnotationsManager *)self setVehicleAnnotation:0];
  [(RidesharingAnnotationsManager *)self setVehicleAnnotationView:0];
  [(RidesharingAnnotationsManager *)self setPickupAnnotation:0];
  [(RidesharingAnnotationsManager *)self setPickupAnnotationView:0];
  v9 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];

  if (v9)
  {
    v10 = [(RidesharingAnnotationsManager *)self customFeatureStore];
    objc_super v11 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];
    v17 = v11;
    v12 = +[NSArray arrayWithObjects:&v17 count:1];
    [v10 removeAnnotations:v12];

    [(RidesharingAnnotationsManager *)self setDropoffAnnotation:0];
  }
  mapView = self->_mapView;
  v14 = [(RidesharingAnnotationsManager *)self customFeatureStore];
  [(MKMapView *)mapView _removeCustomFeatureDataSource:v14];

  [(RidesharingAnnotationsManager *)self setWaypointAnnotations:0];
  [(RidesharingAnnotationsManager *)self setETAView:0];
  [(RidesharingAnnotationsManager *)self setLastVehicleLocationUpdateDate:0];
  if (isKindOfClass)
  {
    v15 = [(RidesharingAnnotationsManager *)self mapView];
    [v15 _setApplicationState:0];

    v16 = [(RidesharingAnnotationsManager *)self mapView];
    [v16 setShowsUserLocation:1];
  }
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(RidesharingAnnotationsManager *)self applicationIdentifier];
  v6 = [v4 objectForKey:v5];

  [(RidesharingAnnotationsManager *)self setRideStatus:v6];
  id v7 = [(RidesharingAnnotationsManager *)self rideStatus];
  [(RidesharingAnnotationsManager *)self _updateFromRideStatus:v7];
}

- (void)_updateFromRideStatus:(id)a3
{
  id v4 = a3;
  if [v4 isValidRide] && (objc_msgSend(v4, "isActiveRide"))
  {
    BOOL v5 = ([v4 isScheduledRide] & 1) == 0 && [v4 phase] != (id)1;
    v6 = [v4 vehicleLocation];
    [v6 coordinate];
    double v8 = v7;
    double v10 = v9;

    id v11 = [v4 vehicleLocation];
    v12 = v11;
    if (!v11) {
      goto LABEL_16;
    }
    [v11 coordinate];
    double latitude = v168.latitude;
    double longitude = v168.longitude;
    if (!CLLocationCoordinate2DIsValid(v168)) {
      goto LABEL_16;
    }
    double v15 = -latitude;
    if (latitude >= 0.0) {
      double v15 = latitude;
    }
    if (v15 > 2.22044605e-16)
    {
      if (longitude < 0.0) {
        double longitude = -longitude;
      }

      if (longitude > 2.22044605e-16)
      {
        LODWORD(v16) = 1;
        goto LABEL_20;
      }
    }
    else
    {
LABEL_16:
    }
    GEOFindOrCreateLog();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      id v19 = [objc_alloc((Class)NSString) initWithFormat:@"Vehicle coordinate was invalid"];
      *(_DWORD *)buf = 136315394;
      v165 = v18;
      __int16 v166 = 2112;
      uint64_t v167 = (uint64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    LODWORD(v16) = 0;
LABEL_20:
    __int16 v20 = [v4 application];
    id v21 = [v20 identifier];
    v22 = [v4 identifier];
    v157 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v21 rideIdentifier:v22];

    if (v5)
    {
      v23 = [v4 vehicleLocation];

      if (v23)
      {
        if ((v16 & 1) == 0) {
          [v157 setInvalidVehicleLocation:1];
        }
      }
      else
      {
        [v157 setMissingVehicleLocation:1];
      }
    }
    v24 = [v4 pickupLocation];
    v25 = [v24 location];
    [v25 coordinate];
    double v27 = v26;
    double v29 = v28;

    v30 = [v4 pickupLocation];
    id v31 = [v30 location];
    v32 = v31;
    if (!v31) {
      goto LABEL_34;
    }
    [v31 coordinate];
    double v33 = v169.latitude;
    double v34 = v169.longitude;
    if (!CLLocationCoordinate2DIsValid(v169)) {
      goto LABEL_34;
    }
    double v35 = -v33;
    if (v33 >= 0.0) {
      double v35 = v33;
    }
    if (v35 > 2.22044605e-16)
    {
      if (v34 < 0.0) {
        double v34 = -v34;
      }

      if (v34 > 2.22044605e-16)
      {
        int v36 = 1;
        goto LABEL_38;
      }
    }
    else
    {
LABEL_34:
    }
    GEOFindOrCreateLog();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      id v39 = [objc_alloc((Class)NSString) initWithFormat:@"Pickup coordinate was invalid"];
      *(_DWORD *)buf = 136315394;
      v165 = v38;
      __int16 v166 = 2112;
      uint64_t v167 = (uint64_t)v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    int v36 = 0;
LABEL_38:
    v40 = [v4 dropoffLocation];
    id v41 = [v40 location];
    v42 = v41;
    if (!v41) {
      goto LABEL_47;
    }
    [v41 coordinate];
    double v43 = v170.latitude;
    double v44 = v170.longitude;
    if (!CLLocationCoordinate2DIsValid(v170)) {
      goto LABEL_47;
    }
    double v45 = -v43;
    if (v43 >= 0.0) {
      double v45 = v43;
    }
    if (v45 > 2.22044605e-16)
    {
      if (v44 < 0.0) {
        double v44 = -v44;
      }

      if (v44 > 2.22044605e-16)
      {
        int v156 = 1;
        goto LABEL_51;
      }
    }
    else
    {
LABEL_47:
    }
    GEOFindOrCreateLog();
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      id v48 = [objc_alloc((Class)NSString) initWithFormat:@"Dropoff coordinate was invalid"];
      *(_DWORD *)buf = 136315394;
      v165 = v47;
      __int16 v166 = 2112;
      uint64_t v167 = (uint64_t)v48;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    int v156 = 0;
LABEL_51:
    v49 = [(RidesharingAnnotationsManager *)self mapView];
    v50 = [v49 userLocation];
    [v50 coordinate];

    v51 = [(RidesharingAnnotationsManager *)self mapView];
    v52 = [v51 userLocation];
    id v53 = [v52 location];
    v54 = v53;
    if (!v53) {
      goto LABEL_59;
    }
    [v53 coordinate];
    double v55 = v171.latitude;
    double v56 = v171.longitude;
    if (!CLLocationCoordinate2DIsValid(v171)) {
      goto LABEL_59;
    }
    double v57 = -v55;
    if (v55 >= 0.0) {
      double v57 = v55;
    }
    if (v57 > 2.22044605e-16)
    {
      double v58 = -v56;
      if (v56 >= 0.0) {
        double v58 = v56;
      }
      BOOL v59 = v58 > 2.22044605e-16;
    }
    else
    {
LABEL_59:
      BOOL v59 = 0;
    }

    if (!v59)
    {
      GEOFindOrCreateLog();
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
        id v62 = [objc_alloc((Class)NSString) initWithFormat:@"User location coordinate was invalid"];
        *(_DWORD *)buf = 136315394;
        v165 = v61;
        __int16 v166 = 2112;
        uint64_t v167 = (uint64_t)v62;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
      }
    }
    id v63 = objc_alloc_init((Class)NSMutableArray);
    if (v16
      && ([v4 vehicleImage], v64 = objc_claimAutoreleasedReturnValue(), v64, v64))
    {
      int v154 = v36;
      BOOL v155 = v59;
      v65 = +[NSDate date];
      v66 = [(RidesharingAnnotationsManager *)self lastVehicleLocationUpdateDate];
      if (v66)
      {
        v67 = [(RidesharingAnnotationsManager *)self lastVehicleLocationUpdateDate];
        [v65 timeIntervalSinceDate:v67];
        BOOL v69 = v68 <= 10.0;
      }
      else
      {
        BOOL v69 = 1;
      }

      [(RidesharingAnnotationsManager *)self setLastVehicleLocationUpdateDate:v65];
      v73 = [(RidesharingAnnotationsManager *)self vehicleAnnotation];

      if (!v73)
      {
        GEOFindOrCreateLog();
        v74 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v75 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
          char v76 = v16;
          uint64_t v16 = (uint64_t)[objc_alloc((Class)NSString) initWithFormat:@"Creating vehicle annotation"];
          *(_DWORD *)buf = 136315394;
          v165 = v75;
          __int16 v166 = 2112;
          uint64_t v167 = v16;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

          LOBYTE(v16) = v76;
        }

        self->_shouldReframeMapView = 1;
        id v77 = objc_alloc_init((Class)MKPointAnnotation);
        [(RidesharingAnnotationsManager *)self setVehicleAnnotation:v77];

        BOOL v69 = 0;
      }
      GEOFindOrCreateLog();
      v78 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v79 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
        char v152 = v16;
        id v80 = objc_alloc((Class)NSString);
        v81 = [v4 vehicleLocation];
        [v81 course];
        CFStringRef v83 = @"No";
        if (v69) {
          CFStringRef v83 = @"Yes";
        }
        uint64_t v16 = (uint64_t)[v80 initWithFormat:@"Updating vehicle annotation: %f,%f at %f with animation: %@", *(void *)&v8, *(void *)&v10, v82, v83];
        *(_DWORD *)buf = 136315394;
        v165 = v79;
        __int16 v166 = 2112;
        uint64_t v167 = v16;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        LOBYTE(v16) = v152;
      }

      if (v69)
      {
        v158[0] = _NSConcreteStackBlock;
        v158[1] = 3221225472;
        v158[2] = sub_100976958;
        v158[3] = &unk_1012EAA08;
        v158[4] = self;
        double v160 = v8;
        double v161 = v10;
        id v159 = v4;
        +[UIView animateWithDuration:4 delay:v158 options:0 animations:0.6 completion:0.0];
      }
      else
      {
        v84 = [(RidesharingAnnotationsManager *)self vehicleAnnotation];
        [v84 setCoordinate:v8, v10];

        v85 = [(RidesharingAnnotationsManager *)self vehicleAnnotationView];
        v86 = [v4 vehicleLocation];
        [v86 course];
        [v85 _setDirection:];

        v87 = [(RidesharingAnnotationsManager *)self vehicleAnnotationView];
        [v87 setAlpha:1.0];
      }
      v88 = [(RidesharingAnnotationsManager *)self vehicleAnnotation];
      [v63 addObject:v88];

      int v36 = v154;
      BOOL v59 = v155;
    }
    else
    {
      v70 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
        id v72 = [objc_alloc((Class)NSString) initWithFormat:@"Stale vehicle annotation"];
        *(_DWORD *)buf = 136315394;
        v165 = v71;
        __int16 v166 = 2112;
        uint64_t v167 = (uint64_t)v72;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
      }
      v65 = [(RidesharingAnnotationsManager *)self vehicleAnnotationView];
      [v65 setAlpha:0.25];
    }

    if (!v36 || [v4 phase] == (id)3 || objc_msgSend(v4, "phase") == (id)4)
    {
      [(RidesharingAnnotationsManager *)self setPickupAnnotation:0];
    }
    else
    {
      v142 = [(RidesharingAnnotationsManager *)self pickupAnnotation];

      if (!v142)
      {
        self->_shouldReframeMapView = 1;
        id v143 = objc_alloc_init((Class)MKPointAnnotation);
        [(RidesharingAnnotationsManager *)self setPickupAnnotation:v143];
      }
      v144 = [(RidesharingAnnotationsManager *)self pickupAnnotation];
      [v144 setCoordinate:v27, v29];

      v145 = [(RidesharingAnnotationsManager *)self pickupAnnotationView];
      [v145 setSelected:1 animated:1];

      unsigned int v146 = [v4 isScheduledRide];
      v147 = [(RidesharingAnnotationsManager *)self ETAView];
      if (v146)
      {
        v148 = [v4 scheduledPickupWindowStartDateComponents];
        [v147 setScheduledPickupWindowStart:v148];
      }
      else
      {
        v148 = [v4 pickupETAMinutes];
        [v147 setMinutes:v148 withState:0];
      }

      v149 = [(RidesharingAnnotationsManager *)self pickupAnnotationView];
      v150 = [(RidesharingAnnotationsManager *)self ETAView];
      [v149 setSelectedContentView:v150];

      v151 = [(RidesharingAnnotationsManager *)self pickupAnnotation];
      [v63 addObject:v151];
    }
    v89 = [(RidesharingAnnotationsManager *)self chromeViewController];
    v90 = [v89 currentIOSBasedContext];
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

    if (v156 && (([v4 phase] == (id)3) & isKindOfClass) == 1)
    {
      v92 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];

      if (!v92)
      {
        self->_shouldReframeMapView = 1;
        id v93 = objc_alloc((Class)MKMapItem);
        v94 = [v4 dropoffLocation];
        [v94 _geoMapItem];
        v95 = char v153 = v16;
        id v96 = [v93 initWithGeoMapItem:v95 isPlaceHolderPlace:0];

        v97 = [[RidesharingPOIAnnotation alloc] initWithMapItem:v96];
        [(RidesharingAnnotationsManager *)self setDropoffAnnotation:v97];

        v98 = [(RidesharingAnnotationsManager *)self customFeatureStore];
        uint64_t v16 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];
        uint64_t v163 = v16;
        v99 = +[NSArray arrayWithObjects:&v163 count:1];
        [v98 addAnnotations:v99];

        LOBYTE(v16) = v153;
        v100 = [(RidesharingAnnotationsManager *)self mapView];
        [v100 _setApplicationState:1];
      }
      v101 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];
      [v63 addObject:v101];

      if (!v59) {
        goto LABEL_104;
      }
    }
    else
    {
      v102 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];

      if (v102)
      {
        v103 = [(RidesharingAnnotationsManager *)self customFeatureStore];
        v104 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];
        v162 = v104;
        +[NSArray arrayWithObjects:&v162 count:1];
        BOOL v105 = v59;
        uint64_t v16 = v106 = v16;
        [v103 removeAnnotations:v16];

        LOBYTE(v16) = v106;
        BOOL v59 = v105;
      }
      [(RidesharingAnnotationsManager *)self setDropoffAnnotation:0];
      if (!v59) {
        goto LABEL_104;
      }
    }
    id v107 = [v4 phase];
    char v108 = v16 ^ 1;
    if (v107 != (id)3) {
      char v108 = 1;
    }
    if ((v108 & 1) == 0)
    {
      GEOCalculateDistance();
      double v110 = v109;
      GEOConfigGetDouble();
      if (v110 < v111)
      {
        v112 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          v113 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
          id v114 = [objc_alloc((Class)NSString) initWithFormat:@"Hiding user location because it is close to the vehicle location"];
          *(_DWORD *)buf = 136315394;
          v165 = v113;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v114;
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
        }
        uint64_t v115 = 0;
LABEL_105:

        if (isKindOfClass)
        {
          v117 = [(RidesharingAnnotationsManager *)self mapView];
          [v117 setShowsUserLocation:v115];
        }
        if (![v63 count] || (self->_shouldReframeMapView & isKindOfClass) != 1) {
          goto LABEL_125;
        }
        self->_shouldReframeMapView = 0;
        v118 = [(RidesharingAnnotationsManager *)self vehicleAnnotation];
        if ([v63 containsObject:v118])
        {
        }
        else
        {
          v119 = [(RidesharingAnnotationsManager *)self dropoffAnnotation];
          unsigned int v120 = [v63 containsObject:v119];

          if (!v120)
          {
            v121 = [(RidesharingAnnotationsManager *)self mapView];
            [v121 showAnnotations:v63 animated:1];
LABEL_124:

LABEL_125:
            goto LABEL_126;
          }
        }
        v121 = +[GEOMapRegion _mapkit_mapRegionEnclosingAnnotations:v63];
        GEOFindOrCreateLog();
        v122 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
        {
          v123 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
          id v124 = [objc_alloc((Class)NSString) initWithFormat:@"Enclosing map region for annotations: %@", v121];
          *(_DWORD *)buf = 136315394;
          v165 = v123;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v124;
          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
        }
        if (v121)
        {
          GEOMapRectForMapRegion();
          double v126 = v125;
          double v128 = v127;
          double v130 = v129;
          double v132 = v131;
          v133 = [(RidesharingAnnotationsManager *)self vehicleAnnotationView];
          v134 = [v133 image];
          [v134 size];
          double v136 = v135;
          double v138 = v137;

          if (v138 <= v136) {
            double v139 = v136;
          }
          else {
            double v139 = v138;
          }
          double v140 = v139 * 0.5 + 25.0;
          v141 = [(RidesharingAnnotationsManager *)self mapView];
          [v141 setVisibleMapRect:1, v126, v128, v130, v132, v140, v140, v140, v140];
        }
        goto LABEL_124;
      }
    }
LABEL_104:
    v112 = [(RidesharingAnnotationsManager *)self mapView];
    v116 = [v112 userLocation];
    [v63 addObject:v116];

    uint64_t v115 = 1;
    goto LABEL_105;
  }
  [(RidesharingAnnotationsManager *)self removeCurrentRide];
LABEL_126:
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  id v6 = [(RidesharingAnnotationsManager *)self vehicleAnnotation];

  if (v6 == v5)
  {
    uint64_t v9 = [(RidesharingAnnotationsManager *)self vehicleAnnotationView];
  }
  else
  {
    id v7 = [(RidesharingAnnotationsManager *)self pickupAnnotation];

    if (v7 != v5)
    {
      double v8 = 0;
      goto LABEL_7;
    }
    double v10 = [(RidesharingAnnotationsManager *)self pickupAnnotationView];
    id v11 = [(RidesharingAnnotationsManager *)self ETAView];
    [v10 setSelectedContentView:v11];

    uint64_t v9 = [(RidesharingAnnotationsManager *)self pickupAnnotationView];
  }
  double v8 = (void *)v9;
LABEL_7:

  return v8;
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return 0;
}

- (void)setPickupAnnotation:(id)a3
{
  id v5 = (MKPointAnnotation *)a3;
  p_pickupAnnotation = &self->_pickupAnnotation;
  pickupAnnotation = self->_pickupAnnotation;
  if (pickupAnnotation != v5)
  {
    double v10 = v5;
    if (pickupAnnotation)
    {
      double v8 = [(RidesharingAnnotationsManager *)self mapView];
      [v8 removeAnnotation:self->_pickupAnnotation];

      id v5 = v10;
    }
    if (v5)
    {
      uint64_t v9 = [(RidesharingAnnotationsManager *)self mapView];
      [v9 addAnnotation:v10];
    }
    objc_storeStrong((id *)p_pickupAnnotation, a3);
    id v5 = v10;
  }
}

- (void)setVehicleAnnotation:(id)a3
{
  id v5 = (MKPointAnnotation *)a3;
  p_vehicleAnnotation = &self->_vehicleAnnotation;
  vehicleAnnotation = self->_vehicleAnnotation;
  if (vehicleAnnotation != v5)
  {
    double v10 = v5;
    if (vehicleAnnotation)
    {
      double v8 = [(RidesharingAnnotationsManager *)self mapView];
      [v8 removeAnnotation:self->_vehicleAnnotation];

      id v5 = v10;
    }
    if (v5)
    {
      uint64_t v9 = [(RidesharingAnnotationsManager *)self mapView];
      [v9 addAnnotation:v10];
    }
    objc_storeStrong((id *)p_vehicleAnnotation, a3);
    id v5 = v10;
  }
}

- (void)setWaypointAnnotations:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_waypointAnnotations = (id *)&self->_waypointAnnotations;
    if (![(NSArray *)self->_waypointAnnotations isEqualToArray:v5])
    {
      if (*p_waypointAnnotations)
      {
        id v7 = [(RidesharingAnnotationsManager *)self mapView];
        [v7 removeAnnotations:self->_waypointAnnotations];
      }
      double v8 = [(RidesharingAnnotationsManager *)self mapView];
      [v8 addAnnotations:v5];

      objc_storeStrong(p_waypointAnnotations, a3);
    }
    objc_storeStrong(p_waypointAnnotations, a3);
  }
  else
  {
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      id v11 = [objc_alloc((Class)NSString) initWithFormat:@"waypointAnnotations is nil. Returning."];
      int v12 = 136315394;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (MKMarkerAnnotationView)pickupAnnotationView
{
  pickupAnnotationView = self->_pickupAnnotationView;
  if (!pickupAnnotationView)
  {
    id v4 = objc_alloc((Class)MKMarkerAnnotationView);
    id v5 = [(RidesharingAnnotationsManager *)self pickupAnnotation];
    id v6 = (MKMarkerAnnotationView *)[v4 initWithAnnotation:v5 reuseIdentifier:@"RidesharingPickupAnnotationView"];
    id v7 = self->_pickupAnnotationView;
    self->_pickupAnnotationView = v6;

    double v8 = self->_pickupAnnotationView;
    uint64_t v9 = objc_opt_new();
    [(MKMarkerAnnotationView *)v8 setGlyphImage:v9];

    [(MKMarkerAnnotationView *)self->_pickupAnnotationView setCanShowCallout:1];
    double v10 = self->_pickupAnnotationView;
    id v11 = +[RidesharingBalloonETAView balloonFillColor];
    [(MKMarkerAnnotationView *)v10 setMarkerTintColor:v11];

    int v12 = self->_pickupAnnotationView;
    v13 = [(RidesharingAnnotationsManager *)self ETAView];
    [(MKMarkerAnnotationView *)v12 setSelectedContentView:v13];

    [(MKMarkerAnnotationView *)self->_pickupAnnotationView setSelected:1 animated:1];
    pickupAnnotationView = self->_pickupAnnotationView;
  }

  return pickupAnnotationView;
}

- (MKAnnotationView)vehicleAnnotationView
{
  vehicleAnnotationView = self->_vehicleAnnotationView;
  if (!vehicleAnnotationView)
  {
    id v4 = objc_alloc((Class)MKAnnotationView);
    id v5 = [(RidesharingAnnotationsManager *)self vehicleAnnotation];
    id v6 = (MKAnnotationView *)[v4 initWithAnnotation:v5 reuseIdentifier:@"RidesharingVehicleAnnotationView"];
    id v7 = self->_vehicleAnnotationView;
    self->_vehicleAnnotationView = v6;

    double v8 = [(RidesharingAnnotationsManager *)self rideStatus];
    uint64_t v9 = [v8 vehicleImage];
    GEOConfigGetDouble();
    double v11 = v10;
    GEOConfigGetDouble();
    v13 = [v9 _maps_imageWithAspectFitScalingForMaximumSize:v11, v12];

    [(MKAnnotationView *)self->_vehicleAnnotationView setImage:v13];
    __int16 v14 = self->_vehicleAnnotationView;
    id v15 = +[UIColor clearColor];
    [(MKAnnotationView *)v14 setBackgroundColor:v15];

    [(MKAnnotationView *)self->_vehicleAnnotationView setSelected:1 animated:1];
    vehicleAnnotationView = self->_vehicleAnnotationView;
  }

  return vehicleAnnotationView;
}

- (RidesharingBalloonETAView)ETAView
{
  ETAView = self->_ETAView;
  if (!ETAView)
  {
    id v4 = objc_alloc_init(RidesharingBalloonETAView);
    id v5 = self->_ETAView;
    self->_ETAView = v4;

    ETAView = self->_ETAView;
  }

  return ETAView;
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (MKPointAnnotation)vehicleAnnotation
{
  return self->_vehicleAnnotation;
}

- (MKPointAnnotation)pickupAnnotation
{
  return self->_pickupAnnotation;
}

- (RidesharingPOIAnnotation)dropoffAnnotation
{
  return self->_dropoffAnnotation;
}

- (void)setDropoffAnnotation:(id)a3
{
}

- (NSArray)waypointAnnotations
{
  return self->_waypointAnnotations;
}

- (void)setVehicleAnnotationView:(id)a3
{
}

- (void)setPickupAnnotationView:(id)a3
{
}

- (void)setETAView:(id)a3
{
}

- (BOOL)hasConfirmedRide
{
  return self->_hasConfirmedRide;
}

- (void)setHasConfirmedRide:(BOOL)a3
{
  self->_hasConfirmedRide = a3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (_MKCustomFeatureStore)customFeatureStore
{
  return self->_customFeatureStore;
}

- (void)setCustomFeatureStore:(id)a3
{
}

- (NSDate)lastVehicleLocationUpdateDate
{
  return self->_lastVehicleLocationUpdateDate;
}

- (void)setLastVehicleLocationUpdateDate:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy
{
  return self->_rideStatusObserverProxy;
}

- (void)setRideStatusObserverProxy:(id)a3
{
}

- (RideBookingRideStatus)rideStatus
{
  return self->_rideStatus;
}

- (void)setRideStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideStatus, 0);
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastVehicleLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_customFeatureStore, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_ETAView, 0);
  objc_storeStrong((id *)&self->_pickupAnnotationView, 0);
  objc_storeStrong((id *)&self->_vehicleAnnotationView, 0);
  objc_storeStrong((id *)&self->_waypointAnnotations, 0);
  objc_storeStrong((id *)&self->_dropoffAnnotation, 0);
  objc_storeStrong((id *)&self->_pickupAnnotation, 0);
  objc_storeStrong((id *)&self->_vehicleAnnotation, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end