@interface RouteAnnotationTextUpdater
- (RouteAnnotationTextUpdater)initWithRouteWaypoint:(id)a3 mapView:(id)a4;
- (void)_updateAnnotationText;
- (void)dealloc;
@end

@implementation RouteAnnotationTextUpdater

- (RouteAnnotationTextUpdater)initWithRouteWaypoint:(id)a3 mapView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RouteAnnotationTextUpdater;
  v8 = [(RouteAnnotationTextUpdater *)&v13 init];
  if (v8)
  {
    v9 = sub_10093A5B4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing for waypoint: %@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v8->_waypoint, v6);
    objc_storeWeak((id *)&v8->_mapView, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10093A608;
    block[3] = &unk_1012E5D08;
    v12 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v8;
}

- (void)dealloc
{
  v3 = sub_10093A5B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_waypoint);
    *(_DWORD *)buf = 134349314;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating for waypoint: %@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)RouteAnnotationTextUpdater;
  [(RouteAnnotationTextUpdater *)&v5 dealloc];
}

- (void)_updateAnnotationText
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v31 = (RouteAnnotationTextUpdater *)"-[RouteAnnotationTextUpdater _updateAnnotationText]";
        __int16 v32 = 2080;
        v33 = "RouteAnnotationsController.m";
        __int16 v34 = 1024;
        *(_DWORD *)v35 = 94;
        *(_WORD *)&v35[4] = 2080;
        *(void *)&v35[6] = "dispatch_get_main_queue()";
        __int16 v36 = 2080;
        v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v38 = 2080;
        v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v25 = sub_1005762E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v31 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waypoint);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    double v29 = 0.0;
    __int16 v8 = [WeakRetained waypoint];
    id v9 = [v8 location];
    [v9 timestamp];
    v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = +[NSDate date];
    v12 = +[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:v10 referenceDate:v11 smallestUnit:64 timeUntilNextUpdate:&v29];

    objc_super v13 = sub_10093A5B4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349570;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2048;
      *(double *)v35 = v29;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Setting annotation text to: %@ with next update in: %f seconds", buf, 0x20u);
    }

    [v7 setAnnotationText:v12];
    id v14 = objc_loadWeakRetained((id *)&self->_mapView);
    [v14 forceLayout];

    double v15 = v29;
    __int16 v16 = sub_10093A5B4();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v15 <= 0.0)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        v31 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] No next update provided; stopping timer",
          buf,
          0xCu);
      }

      timer = self->_timer;
      self->_timer = 0;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        v31 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Starting annotation text updating timer", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      double v18 = v29;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10093ABD8;
      v27[3] = &unk_1012E7638;
      objc_copyWeak(&v28, (id *)buf);
      v19 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v27 block:v18];
      v20 = self->_timer;
      self->_timer = v19;

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v21 = sub_10093A5B4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v31 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Lost waypoint; stopping timer",
        buf,
        0xCu);
    }

    v22 = self->_timer;
    self->_timer = 0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_waypoint);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end