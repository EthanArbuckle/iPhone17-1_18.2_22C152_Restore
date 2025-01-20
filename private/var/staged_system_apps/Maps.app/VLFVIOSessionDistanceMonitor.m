@interface VLFVIOSessionDistanceMonitor
+ (BOOL)isAvailable;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldDisableVIOSession;
- (CLLocation)vlfLocation;
- (NSString)description;
- (VLFVIOSessionDistanceMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (double)_distanceFromOrigin;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)setVlfLocation:(id)a3;
@end

@implementation VLFVIOSessionDistanceMonitor

- (VLFVIOSessionDistanceMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)VLFVIOSessionDistanceMonitor;
  v4 = [(VIOSessionMonitor *)&v27 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_1005B9BE0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v29 = v4;
      __int16 v30 = 2112;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = [(VIOSessionMonitor *)v4 configuration];
    unsigned int v9 = [v8 isVLF];

    if (!v9)
    {
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_1005B9BE0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v17);
        *(_DWORD *)buf = 134349314;
        v29 = v4;
        __int16 v30 = 2112;
        v31 = v15;
        v16 = "[%{public}p] %@ will not run because the session is not configured for VLF";
        goto LABEL_10;
      }
LABEL_13:

      return v4;
    }
    v10 = [(VIOSessionMonitor *)v4 platformController];
    v11 = [v10 currentSession];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_1005B9BE0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 134349314;
        v29 = v4;
        __int16 v30 = 2112;
        v31 = v15;
        v16 = "[%{public}p] %@ will not run because we are currently navigating";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v16, buf, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    v18 = [(VIOSessionMonitor *)v4 platformController];
    [v18 addObserver:v4];

    v19 = [(VIOSessionMonitor *)v4 session];
    [v19 _addObserver:v4];

    v20 = [(VIOSessionMonitor *)v4 session];
    v21 = [v20 technique];
    uint64_t v22 = [v21 vlfLocation];
    vlfLocation = v4->_vlfLocation;
    v4->_vlfLocation = (CLLocation *)v22;

    v24 = [(VIOSessionMonitor *)v4 session];
    id v25 = [v24 state];

    if (v25 == (id)1)
    {
      v13 = +[MKLocationManager sharedLocationManager];
      [v13 startLocationUpdateWithObserver:v4];
      goto LABEL_13;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_1005B9BE0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6 = [(VIOSessionMonitor *)self platformController];
  [v6 removeObserver:self];

  v7 = [(VIOSessionMonitor *)self session];
  [v7 _removeObserver:self];

  v8 = +[MKLocationManager sharedLocationManager];
  [v8 stopLocationUpdateWithObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)VLFVIOSessionDistanceMonitor;
  [(VLFVIOSessionDistanceMonitor *)&v9 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  GEOConfigGetDouble();
  uint64_t v6 = v5;
  [(VLFVIOSessionDistanceMonitor *)self _distanceFromOrigin];
  v8 = +[NSString stringWithFormat:@"<%@ %p distanceThreshold: %f distanceFromOrigin: %f>", v4, self, v6, v7];

  return (NSString *)v8;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldDisableVIOSession
{
  [(VLFVIOSessionDistanceMonitor *)self _distanceFromOrigin];
  double v3 = v2;
  GEOConfigGetDouble();
  return v3 >= v4;
}

- (double)_distanceFromOrigin
{
  double v3 = +[MKLocationManager sharedLocationManager];
  double v4 = [v3 lastLocation];

  uint64_t v5 = [(VLFVIOSessionDistanceMonitor *)self vlfLocation];
  [v4 coordinate];
  CLLocationDegrees v7 = v6;
  CLLocationDegrees v9 = v8;
  [v5 coordinate];
  double v25 = v10;
  double v26 = v11;
  if (!v4)
  {
    v20 = sub_1005B9BE0();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 134349056;
    v28 = self;
    v21 = "[%{public}p] Current location is nil; ignoring";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v5)
  {
    v20 = sub_1005B9BE0();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 134349056;
    v28 = self;
    v21 = "[%{public}p] Origin location is nil; ignoring";
    goto LABEL_15;
  }
  CLLocationDegrees v12 = v10;
  CLLocationDegrees v13 = v11;
  v33.latitude = v7;
  v33.longitude = v9;
  if (!CLLocationCoordinate2DIsValid(v33))
  {
    v20 = sub_1005B9BE0();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 134349056;
    v28 = self;
    v21 = "[%{public}p] Current coordinate is invalid; ignoring";
    goto LABEL_15;
  }
  v34.latitude = v12;
  v34.longitude = v13;
  if (!CLLocationCoordinate2DIsValid(v34))
  {
    v20 = sub_1005B9BE0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v28 = self;
      v21 = "[%{public}p] Origin coordinate is invalid; ignoring";
      goto LABEL_15;
    }
LABEL_16:

    double v19 = 0.0;
    goto LABEL_17;
  }
  v14 = [v4 timestamp:v25, v26];
  v15 = [v5 timestamp];
  [v14 timeIntervalSinceDate:v15];
  double v17 = v16;

  if (v17 <= 0.0)
  {
    v20 = sub_1005B9BE0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v23 = [v4 timestamp];
      v24 = [v5 timestamp];
      *(_DWORD *)buf = 134349570;
      v28 = self;
      __int16 v29 = 2112;
      __int16 v30 = v23;
      __int16 v31 = 2112;
      v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}p] Current location estimate (%@) was obtained before VLF fix occurred (%@); waiting for a location up"
        "date before calculating true distance",
        buf,
        0x20u);
    }
    goto LABEL_16;
  }
  CLLocationCoordinate2DGetDistanceFrom();
  double v19 = v18;
LABEL_17:

  return v19;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      double v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136316418;
        v23 = (VLFVIOSessionDistanceMonitor *)"-[VLFVIOSessionDistanceMonitor locationManagerUpdatedLocation:]";
        __int16 v24 = 2080;
        double v25 = "VLFVIOSessionDistanceMonitor.m";
        __int16 v26 = 1024;
        *(_DWORD *)objc_super v27 = 123;
        *(_WORD *)&v27[4] = 2080;
        *(void *)&v27[6] = "dispatch_get_main_queue()";
        __int16 v28 = 2080;
        __int16 v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v30 = 2080;
        __int16 v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v22,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = +[NSThread callStackSymbols];
          int v22 = 138412290;
          v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
  double v8 = [v4 lastLocation];
  CLLocationDegrees v9 = v8;
  if (!v8 || ([v8 coordinate], !CLLocationCoordinate2DIsValid(v32)))
  {
    double v18 = sub_1005B9BE0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 134349056;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Location was nil or invalid; ignoring update",
        (uint8_t *)&v22,
        0xCu);
    }
    goto LABEL_15;
  }
  GEOConfigGetDouble();
  double v11 = v10;
  [(VLFVIOSessionDistanceMonitor *)self _distanceFromOrigin];
  if (v12 >= v11)
  {
    double v13 = v12;
    v14 = sub_1005B9BE0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v22 = 134349569;
      v23 = self;
      __int16 v24 = 2049;
      double v25 = *(const char **)&v13;
      __int16 v26 = 2049;
      *(double *)objc_super v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Distance traveled from origin (%{private}f) is larger than the threshold (%{private}f); disabling VIO session",
        (uint8_t *)&v22,
        0x20u);
    }

    v15 = [(VIOSessionMonitor *)self stateManager];
    [v15 recordSessionDisableEvent:9];

    double v16 = [(VIOSessionMonitor *)self platformController];
    [v16 removeObserver:self];

    double v17 = [(VIOSessionMonitor *)self session];
    [v17 _removeObserver:self];

    double v18 = +[MKLocationManager sharedLocationManager];
    [v18 stopLocationUpdateWithObserver:self];
LABEL_15:
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005BA57C;
  block[3] = &unk_1012F0708;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = sub_1005B9BE0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 134349056;
      double v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Navigation started; stop monitoring location updates",
        (uint8_t *)&v12,
        0xCu);
    }

    CLLocationDegrees v9 = [(VIOSessionMonitor *)self platformController];
    [v9 removeObserver:self];

    double v10 = [(VIOSessionMonitor *)self session];
    [v10 _removeObserver:self];

    double v11 = +[MKLocationManager sharedLocationManager];
    [v11 stopLocationUpdateWithObserver:self];

    [(VIOSessionMonitor *)self setEnabled:0];
  }
}

- (CLLocation)vlfLocation
{
  return self->_vlfLocation;
}

- (void)setVlfLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end