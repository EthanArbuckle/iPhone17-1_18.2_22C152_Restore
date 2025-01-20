@interface _MapsActivityRestoreHandlingTask
- (BOOL)coldLaunch;
- (void)performTask;
- (void)setColdLaunch:(BOOL)a3;
@end

@implementation _MapsActivityRestoreHandlingTask

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = [(UserActivityHandlingTask *)self userActivity];
  v4 = [v3 userInfo];

  v5 = [v4 objectForKeyedSubscript:@"MapsActivity"];
  if (v5)
  {
    v6 = [[MapsActivity alloc] initWithData:v5];
    if (v6)
    {
      v7 = v6;
      v8 = [v4 objectForKeyedSubscript:@"MapsActivityTimestamp"];
      uint64_t Integer = GEOConfigGetInteger();
      if (v8)
      {
        [v8 timeIntervalSinceNow];
        BOOL v11 = v10 < (double)-Integer;
      }
      else
      {
        BOOL v11 = 0;
      }
      if ([(MapsActivity *)v7 hasDirectionsPlan])
      {
        uint64_t v48 = Integer;
        BOOL v14 = v11;
        v15 = [(MapsActivity *)v7 directionsPlan];
        unsigned int v16 = [v15 hasExpiryTime];

        if (!v16) {
          goto LABEL_20;
        }
        v17 = [(MapsActivity *)v7 directionsPlan];
        [v17 expiryTime];
        v18 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

        [v18 timeIntervalSinceNow];
        double v20 = v19;

        if (v20 < 0.0)
        {
          v21 = sub_1000A930C();
          BOOL v11 = v14;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "_MapsActivityRestoreHandlingTask directionsHaveExpired", buf, 2u);
          }

          uint64_t Integer = v48;
          if ([(MapsActivity *)v7 hasDirectionsPlan])
          {
            [(MapsActivity *)v7 setDirectionsPlan:0];
            int v22 = 0;
            int v51 = 1;
          }
          else
          {
            int v51 = 0;
            int v22 = 1;
          }
        }
        else
        {
LABEL_20:
          int v51 = 0;
          int v22 = 1;
          BOOL v11 = v14;
          uint64_t Integer = v48;
        }
      }
      else
      {
        int v22 = 0;
        int v51 = 0;
      }
      if ([(MapsActivity *)v7 hasDirectionsPlan])
      {
        v23 = [(MapsActivity *)v7 directionsPlan];
        if ([v23 displayMethod] != 1)
        {
LABEL_25:

          goto LABEL_26;
        }
        [(MapsActivity *)v7 directionsPlan];
        v24 = BOOL v49 = v11;
        [v24 routeRequestStorage];
        v25 = v5;
        v26 = v4;
        uint64_t v27 = Integer;
        v29 = v28 = v8;
        unsigned int v47 = [v29 transportType];

        v8 = v28;
        uint64_t Integer = v27;
        v4 = v26;
        v5 = v25;

        BOOL v11 = v49;
        if (v47 != 1)
        {
          v23 = [(MapsActivity *)v7 directionsPlan];
          v30 = [v23 routeRequestStorage];
          [v30 setRouteHandle:0];

          BOOL v11 = v49;
          goto LABEL_25;
        }
      }
LABEL_26:
      v31 = +[NSUserDefaults standardUserDefaults];
      v32 = v31;
      if (((v22 | !v11) & 1) != 0
        || ([v31 BOOLForKey:@"__internal__MapsDebugDontResetUserLocation"] & 1) != 0)
      {
        v33 = v7;
        int v34 = v51;
        if (!v8) {
          goto LABEL_36;
        }
      }
      else
      {
        v33 = +[MapsActivity mapsActivityPerDefault];
        if ([(MapsActivity *)v7 hasDisplayOptions])
        {
          uint64_t v50 = Integer;
          v35 = v8;
          id v36 = objc_alloc_init((Class)GEOURLOptions);
          v37 = [(MapsActivity *)v7 displayOptions];
          [v36 setMapType:[v37 mapType]];

          v38 = [(MapsActivity *)v7 displayOptions];
          unsigned int v39 = [v38 hasEnableTraffic];

          if (v39)
          {
            v40 = [(MapsActivity *)v7 displayOptions];
            [v36 setEnableTraffic:[v40 enableTraffic]];
          }
          [v33 setDisplayOptions:v36];

          v8 = v35;
          uint64_t Integer = v50;
        }

        int v34 = 1;
        if (!v8) {
          goto LABEL_36;
        }
      }
      if (((v34 | [(_MapsActivityRestoreHandlingTask *)self coldLaunch]) & 1) == 0)
      {
        v44 = sub_1000A930C();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v53 = v8;
          __int16 v54 = 2048;
          uint64_t v55 = Integer;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "no need to restore : storage date : %@ TTL: %ld", buf, 0x16u);
        }

        [(RichMapsActivityCreatingTaskImpl *)self taskFailed];
        goto LABEL_47;
      }
LABEL_36:
      if ([v33 hasDisplayOptions])
      {
        v41 = [v33 displayOptions];
        if ([v41 hasCamera])
        {
          unsigned int v42 = 0;
        }
        else
        {
          v45 = [v33 displayOptions];
          unsigned int v42 = [v45 hasCenterSpan] ^ 1;
        }
        v43 = objc_alloc_init(RestorationAction);
        if (!v42) {
          goto LABEL_46;
        }
      }
      else
      {
        v43 = objc_alloc_init(RestorationAction);
      }
      [(MapsAction *)v43 setUserLocationAccuracy:kCLLocationAccuracyBest];
LABEL_46:
      v46 = [[RichMapsActivity alloc] initWithMapsActivity:v33 mapsAction:v43];
      [(UserActivityHandlingTask *)self taskFinished:v46];

LABEL_47:
      goto LABEL_48;
    }
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "_MapsActivityRestoreHandlingTask no mapsActivity from data";
      goto LABEL_9;
    }
  }
  else
  {
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "_MapsActivityRestoreHandlingTask no data";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    }
  }

  [(RichMapsActivityCreatingTaskImpl *)self taskFailed];
LABEL_48:
}

- (BOOL)coldLaunch
{
  return self->_coldLaunch;
}

- (void)setColdLaunch:(BOOL)a3
{
  self->_coldLaunch = a3;
}

@end