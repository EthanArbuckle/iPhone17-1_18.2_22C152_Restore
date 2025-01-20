@interface NPWaldoLocationManager
- (BOOL)exceededLocationTTL;
- (BOOL)shouldCheckLocation;
- (BOOL)sortEdgesByDistanceWithNewLocation:(id)a3 checkOnly:(BOOL)a4;
- (CLLocation)latestGeohashLocation;
- (CLLocation)latestLocation;
- (NPWaldo)waldoInfo;
- (NPWaldoLocationManager)initWithWaldo:(id)a3;
- (double)dislocation;
- (id)copyCurrentGeohash;
- (id)copyCurrentGeohashFromServer;
- (id)locationCompletionHandler;
- (void)handleNewLocation:(id)a3;
- (void)setCurrentGeohash:(id)a3;
- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5;
- (void)setLatestGeohashLocation:(id)a3;
- (void)setLatestLocation:(id)a3;
- (void)setLocationCompletionHandler:(id)a3;
- (void)setWaldoInfo:(id)a3;
- (void)sortEdgesByDistanceWithCompletionHandler:(id)a3;
@end

@implementation NPWaldoLocationManager

- (NPWaldoLocationManager)initWithWaldo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPWaldoLocationManager;
  v5 = [(NPWaldoLocationManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_waldoInfo, v4);
  }

  return v6;
}

- (BOOL)shouldCheckLocation
{
  v3 = [(NPWaldoLocationManager *)self waldoInfo];

  if (v3)
  {
    id v4 = [(NPWaldoLocationManager *)self waldoInfo];
    v5 = [v4 locationExpiration];

    if (v5)
    {
      v6 = nplog_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v44) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Location expiration set, should check location", (uint8_t *)&v44, 2u);
      }
      goto LABEL_24;
    }
    objc_super v8 = [(NPWaldoLocationManager *)self waldoInfo];
    v9 = [v8 useGeohashFromServer];

    if (!v9
      || ([(NPWaldoLocationManager *)self latestGeohashLocation],
          (v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = [(NPWaldoLocationManager *)self latestLocation];
      if (!v6) {
        goto LABEL_13;
      }
    }
    v10 = [v6 timestamp];
    [v10 timeIntervalSinceNow];
    double v12 = fabs(v11);
    v13 = [(NPWaldoLocationManager *)self waldoInfo];
    v14 = [v13 locationCheckInterval];
    [v14 doubleValue];
    double v16 = v15;

    if (v12 > v16) {
      goto LABEL_13;
    }
    if ([(NPWaldoLocationManager *)self sortEdgesByDistanceWithNewLocation:v6 checkOnly:1])
    {
      v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v44) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Current location might have moved substantially, should check location", (uint8_t *)&v44, 2u);
      }
    }
    else
    {
LABEL_13:
      v18 = [(NPWaldoLocationManager *)self waldoInfo];
      uint64_t v19 = [v18 locationCheckTimestamp];
      if (v19)
      {
        v20 = (void *)v19;
        v21 = [(NPWaldoLocationManager *)self waldoInfo];
        v22 = [v21 locationCheckTimestamp];
        [v22 timeIntervalSinceNow];
        double v24 = fabs(v23);
        v25 = [(NPWaldoLocationManager *)self waldoInfo];
        v26 = [v25 locationCheckInterval];
        [v26 doubleValue];
        double v28 = v27;

        if (v24 <= v28)
        {
          v29 = nplog_obj();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v41 = [(NPWaldoLocationManager *)self waldoInfo];
            v42 = [v41 locationCheckTimestamp];
            [v42 timeIntervalSinceNow];
            int v44 = 134217984;
            double v45 = fabs(v43);
            _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Last location check was %f seconds ago, do not check location", (uint8_t *)&v44, 0xCu);
          }
          BOOL v7 = 0;
          goto LABEL_25;
        }
      }
      else
      {
      }
      v30 = [(NPWaldoLocationManager *)self waldoInfo];
      v31 = [v30 locationCheckTimestamp];

      if (!v31) {
        goto LABEL_23;
      }
      v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(NPWaldoLocationManager *)self waldoInfo];
        v33 = [v32 locationCheckTimestamp];
        [v33 timeIntervalSinceNow];
        double v35 = fabs(v34);
        v36 = [(NPWaldoLocationManager *)self waldoInfo];
        v37 = [v36 locationCheckInterval];
        int v44 = 134218242;
        double v45 = v35;
        __int16 v46 = 2112;
        v47 = v37;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Last location check was %f seconds ago (interval is %@), should check location", (uint8_t *)&v44, 0x16u);
      }
    }

LABEL_23:
    v38 = +[NSDate date];
    v39 = [(NPWaldoLocationManager *)self waldoInfo];
    [v39 setLocationCheckTimestamp:v38];

LABEL_24:
    BOOL v7 = 1;
LABEL_25:

    return v7;
  }
  return 0;
}

- (void)handleNewLocation:(id)a3
{
  if (![(NPWaldoLocationManager *)self sortEdgesByDistanceWithNewLocation:a3 checkOnly:1])
  {
    id v4 = [(NPWaldoLocationManager *)self waldoInfo];
    [v4 setLocationExpiration:0];
  }
}

- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc((Class)CLLocation);
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(a3, a4);
  id v11 = [v9 initWithCoordinate:v8 altitude:v10.latitude horizontalAccuracy:v10.longitude verticalAccuracy:0.0 timestamp:-1.0];

  [(NPWaldoLocationManager *)self setLatestLocation:v11];
  double v12 = [(NPWaldoLocationManager *)self waldoInfo];
  uint64_t v13 = [v12 useGeohashFromServer];
  if (v13)
  {
    v14 = (void *)v13;
    double v15 = [(NPWaldoLocationManager *)self latestGeohashLocation];

    if (v15) {
      return;
    }
  }
  else
  {
  }
  id v16 = [(NPWaldoLocationManager *)self latestLocation];
  [(NPWaldoLocationManager *)self handleNewLocation:v16];
}

- (void)setCurrentGeohash:(id)a3
{
  if (a3)
  {
    if (geohashToLatitudeLongitude())
    {
      id v4 = [objc_alloc((Class)CLLocation) initWithLatitude:0.0 longitude:0.0];
      [(NPWaldoLocationManager *)self setLatestGeohashLocation:v4];
    }
    v5 = [(NPWaldoLocationManager *)self waldoInfo];
    uint64_t v6 = [v5 useGeohashFromServer];
    if (v6)
    {
      BOOL v7 = (void *)v6;
      id v8 = [(NPWaldoLocationManager *)self latestGeohashLocation];

      if (!v8) {
        return;
      }
      v5 = [(NPWaldoLocationManager *)self latestGeohashLocation];
      [(NPWaldoLocationManager *)self handleNewLocation:v5];
    }
  }
}

- (BOOL)sortEdgesByDistanceWithNewLocation:(id)a3 checkOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(NPWaldoLocationManager *)self waldoInfo];

  if (!v7)
  {
    double v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to sort edges with location, no waldoInfo", buf, 2u);
    }
    goto LABEL_37;
  }
  id v8 = [(NPWaldoLocationManager *)self waldoInfo];
  uint64_t v9 = [v8 cachedLocation];
  if (!v9)
  {
    id v16 = self;
    double v22 = 0.0;
    char v23 = 1;
    goto LABEL_8;
  }
  CLLocationCoordinate2D v10 = (void *)v9;
  BOOL v104 = v4;
  id v11 = objc_alloc((Class)CLLocation);
  double v12 = [(NPWaldoLocationManager *)self waldoInfo];
  uint64_t v13 = [v12 cachedLocation];
  [v13 latitude];
  double v15 = v14;
  id v16 = self;
  v17 = [(NPWaldoLocationManager *)self waldoInfo];
  v18 = [v17 cachedLocation];
  [v18 longtitude];
  id v20 = [v11 initWithLatitude:v15 longitude:v19];

  if (v20)
  {
    [v20 distanceFromLocation:v6];
    double v22 = v21;
    char v23 = 0;
    id v8 = v20;
    BOOL v4 = v104;
LABEL_8:

    goto LABEL_10;
  }
  double v22 = 0.0;
  char v23 = 1;
  BOOL v4 = v104;
LABEL_10:
  v25 = nplog_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v112 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Moved %f meters since last location", buf, 0xCu);
  }

  if ((v23 & 1) == 0)
  {
    v26 = [(NPWaldoLocationManager *)v16 waldoInfo];
    double v27 = [v26 locationToleranceDistance];
    [v27 doubleValue];
    double v29 = v28;

    if (v22 <= v29)
    {
      v77 = +[NSDate date];
      v78 = v16;
      v79 = [(NPWaldoLocationManager *)v16 waldoInfo];
      v80 = [v79 cachedLocation];
      [v80 setTimestamp:v77];

      double v24 = nplog_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v101 = [(NPWaldoLocationManager *)v78 waldoInfo];
        v102 = [v101 locationToleranceDistance];
        *(_DWORD *)buf = 134218242;
        double v112 = v22;
        __int16 v113 = 2112;
        v114 = v102;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Location change (%f meters) is within tolerance (%@ meters), no need to re-sort edges", buf, 0x16u);
      }
LABEL_37:
      LOBYTE(v31) = 0;
      goto LABEL_46;
    }
  }
  v30 = nplog_obj();
  double v24 = v30;
  if (v4)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v99 = [(NPWaldoLocationManager *)v16 waldoInfo];
      v100 = [v99 locationToleranceDistance];
      *(_DWORD *)buf = 134218242;
      double v112 = v22;
      __int16 v113 = 2112;
      v114 = v100;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Check Only: Location change (%f meters) exceeded tolerance (%@ meters)", buf, 0x16u);
    }
    LOBYTE(v31) = 1;
  }
  else
  {
    v32 = v16;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [(NPWaldoLocationManager *)v16 waldoInfo];
      double v34 = [v33 locationToleranceDistance];
      *(_DWORD *)buf = 134218242;
      double v112 = v22;
      __int16 v113 = 2112;
      v114 = v34;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Location change (%f meters) exceeded tolerance (%@ meters), sorting edges by distance", buf, 0x16u);
    }
    double v35 = [(NPWaldoLocationManager *)v32 waldoInfo];
    v36 = [v35 edges];
    v105 = [v36 copy];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v103 = v32;
    v37 = [(NPWaldoLocationManager *)v32 waldoInfo];
    v38 = [v37 edges];

    id v39 = [v38 countByEnumeratingWithState:&v106 objects:v110 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v107;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v107 != v41) {
            objc_enumerationMutation(v38);
          }
          double v43 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          id v44 = objc_alloc((Class)CLLocation);
          double v45 = [v43 location];
          [v45 latitude];
          double v47 = v46;
          v48 = [v43 location];
          [v48 longtitude];
          id v50 = [v44 initWithLatitude:v47 longitude:v49];

          [v6 distanceFromLocation:v50];
          [v43 setDistance:];
        }
        id v40 = [v38 countByEnumeratingWithState:&v106 objects:v110 count:16];
      }
      while (v40);
    }

    v51 = [(NPWaldoLocationManager *)v103 waldoInfo];
    v52 = [v51 edges];
    v53 = [v52 sortedArrayUsingSelector:"compareByDistance:"];
    v54 = [(NPWaldoLocationManager *)v103 waldoInfo];
    [v54 setEdges:v53];

    v55 = [(NPWaldoLocationManager *)v103 waldoInfo];
    v56 = [v55 edges];
    id v57 = [v56 count];

    if (v57)
    {
      unint64_t v58 = 0;
      do
      {
        v59 = [(NPWaldoLocationManager *)v103 waldoInfo];
        v60 = [v59 edges];
        v61 = [v60 objectAtIndexedSubscript:v58];
        [v61 setIndex:v58];

        ++v58;
        v62 = [(NPWaldoLocationManager *)v103 waldoInfo];
        v63 = [v62 edges];
        id v64 = [v63 count];
      }
      while (v58 < (unint64_t)v64);
    }
    v65 = [(NPWaldoLocationManager *)v103 waldoInfo];
    id v66 = [v65 probeSize];

    if (v66)
    {
      unint64_t v67 = 0;
      do
      {
        v68 = [v105 objectAtIndexedSubscript:v67];
        v69 = [v68 label];
        v70 = [(NPWaldoLocationManager *)v103 waldoInfo];
        v71 = [v70 edges];
        v72 = [v71 objectAtIndexedSubscript:v67];
        v73 = [v72 label];
        unsigned int v74 = [v69 isEqualToString:v73];

        if ((v74 & 1) == 0) {
          break;
        }
        ++v67;
        v75 = [(NPWaldoLocationManager *)v103 waldoInfo];
        id v76 = [v75 probeSize];
      }
      while (v67 < (unint64_t)v76);
      int v31 = v74 ^ 1;
    }
    else
    {
      int v31 = 0;
    }
    v81 = [(NPWaldoLocationManager *)v103 waldoInfo];
    v82 = [v81 edges];
    v83 = [v82 objectAtIndexedSubscript:0];

    id v84 = objc_alloc((Class)NPLocation);
    v85 = [v83 location];
    [v85 latitude];
    double v87 = v86;
    v88 = [v83 location];
    [v88 longtitude];
    double v90 = v89;
    v91 = +[NSDate date];
    id v92 = [v84 initWithLatitude:v91 longtitude:v87 timestamp:v90];
    v93 = [(NPWaldoLocationManager *)v103 waldoInfo];
    [v93 setCachedLocation:v92];

    v94 = nplog_obj();
    BOOL v95 = os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v95)
      {
        v96 = [v83 label];
        *(_DWORD *)buf = 138412290;
        double v112 = *(double *)&v96;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Location change resulted in new view, closet edge is %@", buf, 0xCu);
      }
      v94 = [(NPWaldoLocationManager *)v103 waldoInfo];
      [v94 linkLatenciesAllSignatures:0];
    }
    else if (v95)
    {
      v97 = [v83 label];
      *(_DWORD *)buf = 138412290;
      double v112 = *(double *)&v97;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Location change resulted in same view, closet edge is %@", buf, 0xCu);
    }
    double v24 = v105;
  }
LABEL_46:

  return v31;
}

- (BOOL)exceededLocationTTL
{
  v3 = [(NPWaldoLocationManager *)self waldoInfo];
  BOOL v4 = [v3 cachedLocation];

  if (v4)
  {
    v5 = [(NPWaldoLocationManager *)self waldoInfo];
    id v6 = [v5 locationExpiration];

    BOOL v7 = [(NPWaldoLocationManager *)self waldoInfo];
    id v8 = v7;
    if (v6)
    {
      uint64_t v9 = [v7 currentNetworkLastUsed];

      CLLocationCoordinate2D v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v42 = [(NPWaldoLocationManager *)self waldoInfo];
        double v43 = [v42 locationExpiration];
        int v51 = 138412546;
        double v52 = *(double *)&v9;
        __int16 v53 = 2112;
        v54 = v43;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Network last used %@, location expiration %@", (uint8_t *)&v51, 0x16u);
      }
      if (v9)
      {
        id v11 = [(NPWaldoLocationManager *)self waldoInfo];
        double v12 = [v11 locationExpiration];
        id v13 = [v9 compare:v12];

        if (v13 == (id)1)
        {
          double v14 = nplog_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v51) = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Location expiration date passed, invalidate cached location", (uint8_t *)&v51, 2u);
          }

          BOOL v4 = [(NPWaldoLocationManager *)self waldoInfo];
          [v4 setCachedLocation:0];

          double v15 = [(NPWaldoLocationManager *)self waldoInfo];
          [v15 setLocationExpiration:0];

          LOBYTE(v4) = 1;
          goto LABEL_20;
        }
      }
LABEL_19:
      LOBYTE(v4) = 0;
LABEL_20:

      return (char)v4;
    }
    id v16 = [v7 cachedLocation];
    if ([v16 isValid])
    {
      v17 = [(NPWaldoLocationManager *)self waldoInfo];
      v18 = [v17 cachedLocation];
      double v19 = [v18 timestamp];
      [v19 timeIntervalSinceNow];
      double v21 = fabs(v20);
      double v22 = [(NPWaldoLocationManager *)self waldoInfo];
      char v23 = [v22 locationTTL];
      [v23 doubleValue];
      double v25 = v24;

      if (v21 > v25)
      {
        v26 = nplog_obj();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          double v27 = [(NPWaldoLocationManager *)self waldoInfo];
          double v28 = [v27 cachedLocation];
          double v29 = [v28 timestamp];
          [v29 timeIntervalSinceNow];
          double v31 = fabs(v30);
          v32 = [(NPWaldoLocationManager *)self waldoInfo];
          v33 = [v32 locationTTL];
          int v51 = 134218242;
          double v52 = v31;
          __int16 v53 = 2112;
          v54 = v33;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Last valid location was timestamped %f seconds ago (threshold %@), exceeded TTL", (uint8_t *)&v51, 0x16u);
        }
        double v34 = [(NPWaldoLocationManager *)self waldoInfo];
        double v35 = [v34 locationTTL];
        uint64_t v36 = (uint64_t)[v35 integerValue] / 10;

        id v37 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:(double)v36];
        v38 = [(NPWaldoLocationManager *)self waldoInfo];
        [v38 setLocationExpiration:v37];

        uint64_t v9 = nplog_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = [(NPWaldoLocationManager *)self waldoInfo];
          id v40 = [v39 locationExpiration];
          int v51 = 134218242;
          double v52 = *(double *)&v36;
          __int16 v53 = 2112;
          v54 = v40;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Expiring cached location in %ld seconds at (%@)", (uint8_t *)&v51, 0x16u);
        }
        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v44 = [(NPWaldoLocationManager *)self waldoInfo];
      double v45 = [v44 cachedLocation];
      double v46 = [v45 timestamp];
      [v46 timeIntervalSinceNow];
      double v48 = fabs(v47);
      double v49 = [(NPWaldoLocationManager *)self waldoInfo];
      id v50 = [v49 locationTTL];
      int v51 = 134218242;
      double v52 = v48;
      __int16 v53 = 2112;
      v54 = v50;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Last valid location was timestamped %f seconds ago (threshold %@), within TTL", (uint8_t *)&v51, 0x16u);
    }
    goto LABEL_19;
  }
  return (char)v4;
}

- (void)sortEdgesByDistanceWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  v5 = [(NPWaldoLocationManager *)self waldoInfo];

  if (!v5)
  {
    double v19 = nplog_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to sort edges with completionHandler, no waldoInfo", (uint8_t *)&v21, 2u);
    }

    v4[2](v4, 0);
    goto LABEL_19;
  }
  id v6 = [(NPWaldoLocationManager *)self waldoInfo];
  BOOL v7 = [v6 useGeohashFromServer];

  if (!v7
    || ([(NPWaldoLocationManager *)self latestGeohashLocation],
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = [(NPWaldoLocationManager *)self latestLocation];
    if (!v8)
    {
      double v20 = nplog_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not allowed to get current location", (uint8_t *)&v21, 2u);
      }

      ((void (**)(id, BOOL))v4)[2](v4, [(NPWaldoLocationManager *)self exceededLocationTTL]);
LABEL_19:
      id v8 = 0;
      goto LABEL_20;
    }
  }
  uint64_t v9 = [v8 timestamp];
  [v9 timeIntervalSinceNow];
  double v11 = fabs(v10);
  double v12 = [(NPWaldoLocationManager *)self waldoInfo];
  id v13 = [v12 locationCheckInterval];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = nplog_obj();
  v17 = v16;
  if (v11 > v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Current location is too old", (uint8_t *)&v21, 2u);
    }

    BOOL v18 = [(NPWaldoLocationManager *)self exceededLocationTTL];
LABEL_15:
    v4[2](v4, v18);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 138412290;
    double v22 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Valid current location %@", (uint8_t *)&v21, 0xCu);
  }

  BOOL v18 = [(NPWaldoLocationManager *)self sortEdgesByDistanceWithNewLocation:v8 checkOnly:0];
  if (v4) {
    goto LABEL_15;
  }
LABEL_20:
}

- (id)copyCurrentGeohash
{
  v2 = [(NPWaldoLocationManager *)self latestLocation];
  v3 = v2;
  if (v2)
  {
    [v2 coordinate];
    [v3 coordinate];
    BOOL v4 = latitudeLongitudeToGeohash();
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)copyCurrentGeohashFromServer
{
  v3 = [(NPWaldoLocationManager *)self latestGeohashLocation];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(NPWaldoLocationManager *)self latestGeohashLocation];
  [v4 coordinate];
  v5 = [(NPWaldoLocationManager *)self latestGeohashLocation];
  [v5 coordinate];
  id v6 = latitudeLongitudeToGeohash();

  return v6;
}

- (double)dislocation
{
  uint64_t v3 = [(NPWaldoLocationManager *)self latestLocation];
  if (!v3) {
    return -1.0;
  }
  BOOL v4 = (void *)v3;
  v5 = [(NPWaldoLocationManager *)self latestGeohashLocation];

  if (!v5) {
    return -1.0;
  }
  id v6 = [(NPWaldoLocationManager *)self latestLocation];
  BOOL v7 = [(NPWaldoLocationManager *)self latestGeohashLocation];
  [v6 distanceFromLocation:v7];
  double v9 = v8;

  return v9;
}

- (NPWaldo)waldoInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waldoInfo);

  return (NPWaldo *)WeakRetained;
}

- (void)setWaldoInfo:(id)a3
{
}

- (CLLocation)latestLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatestLocation:(id)a3
{
}

- (CLLocation)latestGeohashLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLatestGeohashLocation:(id)a3
{
}

- (id)locationCompletionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setLocationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_latestGeohashLocation, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);

  objc_destroyWeak((id *)&self->_waldoInfo);
}

@end