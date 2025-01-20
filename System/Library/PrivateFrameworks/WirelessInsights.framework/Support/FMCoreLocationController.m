@interface FMCoreLocationController
+ (double)distanceBetween:(double)a3 srcLongitude:(double)a4 destLatitude:(double)a5 destLongitude:(double)a6;
- (CLLocationManager)authorizationManager;
- (CLLocationManager)locationManager;
- (FMCoreLocationController)initWithFMModel:(id)a3;
- (FMModel)fmModel;
- (const)authStatusAsString:(int)a3;
- (dispatch_queue_s)queue;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didReportVisit:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setFmModel:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
@end

@implementation FMCoreLocationController

- (FMCoreLocationController)initWithFMModel:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_10;
  }
  v19.receiver = self;
  v19.super_class = (Class)FMCoreLocationController;
  v5 = [(FMCoreLocationController *)&v19 init];
  self = v5;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100146030();
    }
    self = 0;
    goto LABEL_10;
  }
  [(FMCoreLocationController *)v5 setFmModel:v4];
  [(FMCoreLocationController *)self setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.CoreLocationController", 0)];
  if (![(FMCoreLocationController *)self queue])
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  id v6 = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", @"/System/Library/LocationBundles/WirelessDiagnostics.bundle", self, -[FMCoreLocationController queue](self, "queue"));
  [(FMCoreLocationController *)self setLocationManager:v6];

  id v7 = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", @"/System/Library/LocationBundles/FedMobility.bundle", self, -[FMCoreLocationController queue](self, "queue"));
  [(FMCoreLocationController *)self setAuthorizationManager:v7];

  v8 = [(FMCoreLocationController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E3C4;
  block[3] = &unk_1001B5F28;
  v9 = self;
  v18 = v9;
  dispatch_async((dispatch_queue_t)v8, block);
  objc_initWeak(&location, v9);
  dispatch_time_t v10 = dispatch_time(0, 120000000000);
  v11 = [(FMCoreLocationController *)v9 queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007E504;
  v14[3] = &unk_1001B6880;
  objc_copyWeak(&v15, &location);
  dispatch_after(v10, v11, v14);
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100146064();
  }
  self = v9;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  v12 = self;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100146098();
  }
  v3 = [(FMCoreLocationController *)self locationManager];
  [v3 setDelegate:0];

  id v4 = [(FMCoreLocationController *)self authorizationManager];
  [v4 setDelegate:0];

  if ([(FMCoreLocationController *)self queue]) {
    dispatch_release((dispatch_object_t)[(FMCoreLocationController *)self queue]);
  }
  v5.receiver = self;
  v5.super_class = (Class)FMCoreLocationController;
  [(FMCoreLocationController *)&v5 dealloc];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  id v5 = [(FMCoreLocationController *)self authorizationManager];

  if (v5 == v4)
  {
    id v6 = [v4 authorizationStatus];
    id v7 = *(NSObject **)(qword_1001D8080 + 40);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = [(FMCoreLocationController *)self authStatusAsString:v6];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FederatedMobility[FMCoreLocationController]:#N Updated auth status from locationd %s", (uint8_t *)&v10, 0xCu);
    }
    v8 = [(FMCoreLocationController *)self fmModel];
    v9 = v8;
    if (v8) {
      [v8 handleLocationAuthorizationUpdate:v6];
    }
  }
}

- (const)authStatusAsString:(int)a3
{
  if (a3 > 4) {
    return "Auth status is unknown";
  }
  else {
    return off_1001B8BA0[a3];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  id v6 = [(FMCoreLocationController *)self fmModel];
  if (v6)
  {
    id v7 = [v5 lastObject];
    if (v7)
    {
      v8 = [FMLocation alloc];
      v9 = [v7 timestamp];
      [v7 coordinate];
      double v11 = v10;
      [v7 coordinate];
      double v13 = v12;
      [v7 horizontalAccuracy];
      id v15 = [(FMLocation *)v8 init:v9 latitude:v11 longitude:v13 accuracy:v14];

      [v6 handleLocationUpdate:v15];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      sub_1001460CC();
    }
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v5 = a4;
  id v6 = +[FMConfiguration sharedInstance];
  unsigned int v7 = [v6 disableVisitChecking];

  if (!v7)
  {
    v8 = [(FMCoreLocationController *)self fmModel];
    if (v8)
    {
      v9 = [v5 _placeInference];
      if (v9)
      {
        double v10 = [v5 _placeInference];
        double v11 = [v10 placemark];
        if (v11)
        {
          double v12 = [v5 _placeInference];
          double v13 = [v12 placemark];
          double v14 = [v13 location];

          if (v14)
          {
            id v15 = [v5 _placeInference];
            v16 = [v15 placemark];
            v17 = [v16 location];

            v18 = [v5 departureDate];
            objc_super v19 = +[NSDate distantFuture];
            unsigned int v20 = [v18 isEqualToDate:v19];

            if (v20)
            {
              v21 = [FMLocation alloc];
              v22 = [v5 arrivalDate];
              [v17 coordinate];
              double v24 = v23;
              [v17 coordinate];
              double v26 = v25;
              [v17 horizontalAccuracy];
              id v28 = [(FMLocation *)v21 init:v22 latitude:v24 longitude:v26 accuracy:v27];

              [v8 handleVisitStarted:v28];
            }
            else
            {
              v29 = [FMLocation alloc];
              v30 = [v5 departureDate];
              [v17 coordinate];
              double v32 = v31;
              [v17 coordinate];
              double v34 = v33;
              [v17 horizontalAccuracy];
              id v28 = [(FMLocation *)v29 init:v30 latitude:v32 longitude:v34 accuracy:v35];

              [v8 handleVisitEnded:v28];
            }

            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100146134();
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100146100();
  }
LABEL_16:
}

- (void)locationManager:(id)a3 didReportVisit:(id)a4
{
  id v5 = a4;
  id v6 = +[FMConfiguration sharedInstance];
  unsigned int v7 = [v6 disableVisitChecking];

  if (!v7)
  {
    v8 = [(FMCoreLocationController *)self fmModel];
    if (v8)
    {
      if (v5)
      {
        v9 = [v5 _placeInference];
        if (v9)
        {
          double v10 = [v5 _placeInference];
          double v11 = [v10 placemark];
          if (v11)
          {
            double v12 = [v5 _placeInference];
            double v13 = [v12 placemark];
            double v14 = [v13 location];

            if (v14)
            {
              id v15 = [v5 _placeInference];
              v16 = [v15 placemark];
              v17 = [v16 location];

              v18 = [FMLocation alloc];
              objc_super v19 = +[NSDate now];
              [v17 coordinate];
              double v21 = v20;
              [v17 coordinate];
              double v23 = v22;
              [v17 horizontalAccuracy];
              id v25 = [(FMLocation *)v18 init:v19 latitude:v21 longitude:v23 accuracy:v24];

              [v8 handleVisitStarted:v25];
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100146168();
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100146100();
  }
LABEL_14:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v4 localizedDescription];
    sub_10014619C(v6, v7, (uint64_t)[v4 code], v5);
  }
}

+ (double)distanceBetween:(double)a3 srcLongitude:(double)a4 destLatitude:(double)a5 destLongitude:(double)a6
{
  id v8 = [objc_alloc((Class)CLLocation) initWithLatitude:a3 longitude:a4];
  id v9 = [objc_alloc((Class)CLLocation) initWithLatitude:a5 longitude:a6];
  [v8 distanceFromLocation:v9];
  double v11 = v10;

  return v11;
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (CLLocationManager)locationManager
{
  return (CLLocationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)authorizationManager
{
  return (CLLocationManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthorizationManager:(id)a3
{
}

- (FMModel)fmModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fmModel);

  return (FMModel *)WeakRetained;
}

- (void)setFmModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fmModel);
  objc_storeStrong((id *)&self->_authorizationManager, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end