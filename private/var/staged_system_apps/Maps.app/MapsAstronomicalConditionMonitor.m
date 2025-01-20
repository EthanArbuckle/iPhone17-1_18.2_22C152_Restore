@interface MapsAstronomicalConditionMonitor
- (BOOL)isBeforeSolarTransit;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (CLLocation)currentLocation;
- (GCDTimer)timeCheckTimer;
- (MapsAstronomicalConditionMonitor)init;
- (int64_t)_computeOnQueueAstronomicalConditionForTime:(double)a3 currentLocation:(id)a4 isBeforeSolarTransit:(BOOL *)a5;
- (int64_t)astronomicalCondition;
- (void)_setMonitoring:(BOOL)a3;
- (void)computeAstronomicalConditionForTime:(double)a3 currentLocation:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)scheduleTimeCheck;
- (void)setAstronomicalCondition:(int64_t)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setTimeCheckTimer:(id)a3;
- (void)timeDidChangeSignificantly;
@end

@implementation MapsAstronomicalConditionMonitor

- (void)computeAstronomicalConditionForTime:(double)a3 currentLocation:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = *(NSObject **)((char *)&self->_twilightAlmanac + 1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000159A4;
  v9[3] = &unk_1012F27A8;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)setAstronomicalCondition:(int64_t)a3
{
  if (*(void *)(&self->_isBeforeSolarTransit + 1) != a3)
  {
    v5 = sub_10008FEAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = *(void *)(&self->_isBeforeSolarTransit + 1);
      if (v6 >= 4)
      {
        v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", *(void *)(&self->_isBeforeSolarTransit + 1)];
      }
      else
      {
        v7 = off_1013153B0[v6];
      }
      id v8 = v7;
      if ((unint64_t)a3 >= 4)
      {
        v9 = +[NSString stringWithFormat:@"<Unknown: %ld>", a3];
      }
      else
      {
        v9 = off_1013153B0[a3];
      }
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing condition from %@ to %@", buf, 0x16u);
    }
    *(void *)(&self->_isBeforeSolarTransit + 1) = a3;
    [(MapsBaseLightMonitor *)self _notifyDidChange];
  }
}

- (void)_setMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsBaseLightMonitor *)self _isMonitoring];
  v12.receiver = self;
  v12.super_class = (Class)MapsAstronomicalConditionMonitor;
  [(MapsBaseLightMonitor *)&v12 _setMonitoring:v3];
  if (v5 != v3)
  {
    unint64_t v6 = +[MKLocationManager sharedLocationManager];
    v7 = v6;
    if (v3)
    {
      [v6 listenForLocationUpdates:self];

      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"timeDidChangeSignificantly" name:UIApplicationSignificantTimeChangeNotification object:0];

      v9 = +[MKLocationManager sharedLocationManager];
      id v10 = [v9 lastLocation];
      [(MapsAstronomicalConditionMonitor *)self setCurrentLocation:v10];

      [(MapsAstronomicalConditionMonitor *)self scheduleTimeCheck];
    }
    else
    {
      [v6 stopListeningForLocationUpdates:self];

      v11 = +[NSNotificationCenter defaultCenter];
      [v11 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

      [(MapsAstronomicalConditionMonitor *)self setCurrentLocation:0];
      [(MapsAstronomicalConditionMonitor *)self setTimeCheckTimer:0];
      [(MapsAstronomicalConditionMonitor *)self setAstronomicalCondition:0];
    }
  }
}

- (MapsAstronomicalConditionMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)MapsAstronomicalConditionMonitor;
  v2 = [(MapsBaseLightMonitor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = *(void **)(v2 + 17);
    *(void *)(v2 + 17) = v3;

    uint64_t v5 = objc_opt_new();
    unint64_t v6 = *(void **)(v2 + 25);
    *(void *)(v2 + 25) = v5;

    *(void *)(v2 + 49) = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Maps.AstronomicalConditionMonitor.compute", v7);
    v9 = *(void **)(v2 + 33);
    *(void *)(v2 + 33) = v8;
  }
  return (MapsAstronomicalConditionMonitor *)v2;
}

- (void)scheduleTimeCheck
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_100A517E8;
  dispatch_queue_t v8 = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v5 block:300.0];
  -[MapsAstronomicalConditionMonitor setTimeCheckTimer:](self, "setTimeCheckTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = [a3 lastLocation];
  [(MapsAstronomicalConditionMonitor *)self setCurrentLocation:v4];
}

- (void)setCurrentLocation:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  v7 = (void **)((char *)&self->_astronomicalCondition + 1);
  id v8 = *(id *)((char *)&self->_astronomicalCondition + 1);
  if (v8 != v5)
  {
    if (v5)
    {
      if (!v8)
      {
        id v10 = sub_10008FEAC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          v16 = v6;
          objc_super v12 = "Calculating condition with first currrentLocation: %@";
          v13 = v10;
          uint32_t v14 = 12;
          goto LABEL_10;
        }
LABEL_11:

        objc_storeStrong((id *)((char *)&self->_astronomicalCondition + 1), a3);
        [(MapsAstronomicalConditionMonitor *)self computeAstronomicalConditionForTime:v6 currentLocation:CFAbsoluteTimeGetCurrent()];
        goto LABEL_12;
      }
      [v5 distanceFromLocation:];
      if (v9 > 3000.0)
      {
        id v10 = sub_10008FEAC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_super v11 = *v7;
          int v15 = 138412546;
          v16 = v11;
          __int16 v17 = 2112;
          v18 = v6;
          objc_super v12 = "currentLocation moved significantly from %@ to %@";
          v13 = v10;
          uint32_t v14 = 22;
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, v14);
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
      NSObject *v7 = 0;
    }
  }
LABEL_12:
}

- (int64_t)_computeOnQueueAstronomicalConditionForTime:(double)a3 currentLocation:(id)a4 isBeforeSolarTransit:(BOOL *)a5
{
  id v45 = a4;
  [v45 coordinate];
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = *(void **)(&self->super._monitoring + 1);
  GEOConfigGetDouble();
  [v12 calculateAstronomicalTimeForLocation:v9 time:v11 altitudeInDegrees:a3];
  uint32_t v14 = *(GEOAlmanac **)((char *)&self->_daylightAlmanac + 1);
  GEOConfigGetDouble();
  [v14 calculateAstronomicalTimeForLocation:v9 time:v11 altitudeInDegrees:a3];
  v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  __int16 v17 = objc_opt_new();
  v18 = [*(id *)(&self->super._monitoring + 1) previousTransit];

  if (v18)
  {
    v19 = [*(id *)(&self->super._monitoring + 1) previousTransit];
    [v17 addObject:v19];
  }
  v20 = [*(id *)(&self->super._monitoring + 1) transit];

  if (v20)
  {
    v21 = [*(id *)(&self->super._monitoring + 1) transit];
    [v17 addObject:v21];
  }
  v22 = [*(id *)(&self->super._monitoring + 1) nextTransit];

  if (v22)
  {
    v23 = [*(id *)(&self->super._monitoring + 1) nextTransit];
    [v17 addObject:v23];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v24 = v17;
  id v25 = [v24 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (v25)
  {
    id v26 = v25;
    v27 = 0;
    uint64_t v28 = *(void *)v47;
    double v29 = 1.79769313e308;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(v24);
        }
        v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v31 timeIntervalSinceDate:v16];
        double v33 = fabs(v32);
        if (v33 < v29)
        {
          id v34 = v31;

          double v29 = v33;
          v27 = v34;
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v46 objects:v66 count:16];
    }
    while (v26);

    if (v27)
    {
      BOOL v35 = [v16 compare:v27] == (id)-1;
      goto LABEL_20;
    }
  }
  else
  {

    v27 = 0;
  }
  BOOL v35 = 0;
LABEL_20:
  *a5 = v35;
  v36 = sub_10008FEAC();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = *(void **)(&self->super._monitoring + 1);
    uint64_t v43 = *(uint64_t *)((char *)&self->_daylightAlmanac + 1);
    BOOL v44 = *a5;
    v38 = [v37 previousTransit];
    v39 = [*(id *)(&self->super._monitoring + 1) transit];
    v40 = [*(id *)(&self->super._monitoring + 1) nextTransit];
    *(_DWORD *)buf = 138414082;
    id v51 = v45;
    __int16 v52 = 2112;
    v53 = v16;
    __int16 v54 = 2112;
    v55 = v37;
    __int16 v56 = 2112;
    uint64_t v57 = v43;
    __int16 v58 = 1024;
    BOOL v59 = v44;
    __int16 v60 = 2112;
    v61 = v38;
    __int16 v62 = 2112;
    v63 = v39;
    __int16 v64 = 2112;
    v65 = v40;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "computeAstronomicalCondition updated conditions for %@ at %@; daylightAlmanac: %@ twilightAlamanac: %@; isBeforeSo"
      "larTransit: %d; transits: %@ %@ %@",
      buf,
      0x4Eu);
  }
  if ([*(id *)(&self->super._monitoring + 1) isDayLightForTime:a3])
  {
    int64_t v41 = 3;
  }
  else if ([*(id *)((char *)&self->_daylightAlmanac + 1) isDayLightForTime:a3])
  {
    int64_t v41 = 2;
  }
  else
  {
    int64_t v41 = 1;
  }

  return v41;
}

- (int64_t)astronomicalCondition
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"MapsDebugAstronomicalLightLevelKey"];

  if (objc_opt_respondsToSelector())
  {
    unint64_t v5 = (unint64_t)[v4 integerValue];
    uint64_t v6 = sub_10008FEAC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 4)
      {
        v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", v5];
      }
      else
      {
        v7 = off_1013153B0[v5];
      }
      *(_DWORD *)buf = 138412290;
      double v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Using override astronomical condition: %@", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v5 = *(void *)(&self->_isBeforeSolarTransit + 1);
  }

  return v5;
}

- (void)setTimeCheckTimer:(id)a3
{
}

- (BOOL)isBeforeSolarTransit
{
  return BYTE1(self->_computeQueue);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)timeDidChangeSignificantly
{
  id v3 = [(MapsAstronomicalConditionMonitor *)self currentLocation];
  if (v3)
  {
    [(MapsAstronomicalConditionMonitor *)self computeAstronomicalConditionForTime:v3 currentLocation:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    id v4 = sub_10008FEAC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "-timeDidChangeSignificantly cannot compute astronomical condition without a current location", v5, 2u);
    }
  }
}

- (CLLocation)currentLocation
{
  return *(CLLocation **)((char *)&self->_astronomicalCondition + 1);
}

- (GCDTimer)timeCheckTimer
{
  return *(GCDTimer **)((char *)&self->_currentLocation + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_currentLocation + 1), 0);
  objc_storeStrong((id *)((char *)&self->_astronomicalCondition + 1), 0);
  objc_storeStrong((id *)((char *)&self->_twilightAlmanac + 1), 0);
  objc_storeStrong((id *)((char *)&self->_daylightAlmanac + 1), 0);

  objc_storeStrong((id *)(&self->super._monitoring + 1), 0);
}

@end