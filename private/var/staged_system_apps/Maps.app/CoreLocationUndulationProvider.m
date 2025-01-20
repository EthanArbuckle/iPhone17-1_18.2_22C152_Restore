@interface CoreLocationUndulationProvider
+ (double)undulationAtLocation:(id)a3;
+ (id)_groundAltitudeAtLocation:(id)a3;
+ (id)sharedInstance;
- (CLLocationManager)locationManager;
- (CoreLocationUndulationProvider)init;
- (CoreLocationUndulationProvider)sharedInstance;
- (void)setLocationManager:(id)a3;
@end

@implementation CoreLocationUndulationProvider

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C516D0;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610C38 != -1) {
    dispatch_once(&qword_101610C38, block);
  }
  v2 = (void *)qword_101610C30;

  return v2;
}

- (CoreLocationUndulationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CoreLocationUndulationProvider;
  v2 = [(CoreLocationUndulationProvider *)&v6 init];
  if (v2)
  {
    v3 = (CLLocationManager *)objc_alloc_init((Class)CLLocationManager);
    locationManager = v2->_locationManager;
    v2->_locationManager = v3;

    [(CLLocationManager *)v2->_locationManager _setGroundAltitudeEnabled:1];
  }
  return v2;
}

+ (double)undulationAtLocation:(id)a3
{
  v3 = [a1 _groundAltitudeAtLocation:a3];
  [v3 undulation];
  double v5 = v4;

  return v5;
}

+ (id)_groundAltitudeAtLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = 0;
    do
    {
      objc_super v6 = sub_100C519FC();
      ++v5;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Calling _groundAltitudeAtLocation: %d/8 times", buf, 8u);
      }

      v7 = [a1 sharedInstance];
      v8 = [v7 locationManager];
      id v9 = [v8 _groundAltitudeAtLocation:v4];
    }
    while (v5 != 7);
    v10 = sub_100C519FC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Calling _groundAltitudeAtLocation: 8/8 times", buf, 2u);
    }

    v11 = [a1 sharedInstance];
    v12 = [v11 locationManager];
    v13 = [v12 _groundAltitudeAtLocation:v4];

    v14 = sub_100C519FC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got ground altitude: %@", buf, 0xCu);
    }
  }
  else
  {
    v14 = sub_100C519FC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Location cannot be nil; ignoring", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (CoreLocationUndulationProvider)sharedInstance
{
  return self->_sharedInstance;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_sharedInstance, 0);
}

@end