@interface SingleLocationUpdate
- (BOOL)_isLocationGoodEnough:(id)a3;
- (double)_timeSinceStart;
- (double)acceptableAccuracy;
- (double)desiredAccuracy;
- (void)_cleanup;
- (void)_completeWithLocation:(id)a3 error:(id)a4;
- (void)_finalTimeout;
- (void)_firstTimeout;
- (void)_timeoutWithForcedCompletion:(BOOL)a3 rescheduleInterval:(double)a4 selector:(SEL)a5;
- (void)cancel;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)requestSingleLocationUpdateWithCompletionHandler:(id)a3;
- (void)setAcceptableAccuracy:(double)a3;
- (void)setDesiredAccuracy:(double)a3;
@end

@implementation SingleLocationUpdate

- (void)dealloc
{
  [(SingleLocationUpdate *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)SingleLocationUpdate;
  [(SingleLocationUpdate *)&v3 dealloc];
}

- (void)requestSingleLocationUpdateWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100541050;
  v4[3] = &unk_1012E76E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)cancel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100541338;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)desiredAccuracy
{
  double result = self->_desiredAccuracy;
  if (result <= 0.0) {
    return 35.0;
  }
  return result;
}

- (void)setDesiredAccuracy:(double)a3
{
  if (!self->_active) {
    self->_desiredAccuracy = a3;
  }
}

- (double)acceptableAccuracy
{
  double result = self->_acceptableAccuracy;
  if (result <= 0.0) {
    return 65.0;
  }
  return result;
}

- (void)setAcceptableAccuracy:(double)a3
{
  if (!self->_active) {
    self->_acceptableAccuracy = a3;
  }
}

- (double)_timeSinceStart
{
  [(NSDate *)self->_startDate timeIntervalSinceNow];
  return fabs(v2);
}

- (void)_firstTimeout
{
  [(SingleLocationUpdate *)self _timeSinceStart];
  double v4 = 10.0 - v3;

  [(SingleLocationUpdate *)self _timeoutWithForcedCompletion:0 rescheduleInterval:"_finalTimeout" selector:v4];
}

- (void)_finalTimeout
{
}

- (void)_timeoutWithForcedCompletion:(BOOL)a3 rescheduleInterval:(double)a4 selector:(SEL)a5
{
  BOOL v7 = a3;
  [(NSTimer *)self->_timeout invalidate];
  if ([(SingleLocationUpdate *)self _isLocationGoodEnough:self->_lastLocation]) {
    lastLocation = self->_lastLocation;
  }
  else {
    lastLocation = 0;
  }
  v10 = lastLocation;
  v11 = v10;
  if (v10 || v7)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1005415E8;
    v14[3] = &unk_1012E5D58;
    v14[4] = self;
    v15 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    timeout = v15;
    goto LABEL_10;
  }
  if (a4 >= 0.0 && a5)
  {
    v12 = +[NSTimer scheduledTimerWithTimeInterval:self target:a5 selector:0 userInfo:0 repeats:a4];
    timeout = self->_timeout;
    self->_timeout = v12;
LABEL_10:
  }
}

- (void)_cleanup
{
  self->_active = 0;
  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  [(NSTimer *)self->_timeout invalidate];
  timeout = self->_timeout;
  self->_timeout = 0;

  v6 = self->_locationManager;
  BOOL v7 = self->_assertion;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005416FC;
  v11[3] = &unk_1012E5D58;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = objc_retainBlock(v11);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v6 = a3;
  unsigned int v4 = [v6 authorizationStatus];
  if (self->_active && v4 - 3 <= 1) {
    [v6 startUpdatingLocation];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  [a4 lastObject];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lastLocation, v5);
  if ([(SingleLocationUpdate *)self _isLocationGoodEnough:v5]) {
    [(SingleLocationUpdate *)self _completeWithLocation:v5 error:0];
  }
}

- (BOOL)_isLocationGoodEnough:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  [v4 horizontalAccuracy];
  double v7 = v6;
  [(SingleLocationUpdate *)self desiredAccuracy];
  if (v7 <= v8)
  {
    BOOL v12 = 1;
    goto LABEL_9;
  }
  [(SingleLocationUpdate *)self _timeSinceStart];
  double v10 = v9;
  if (v9 > 5.0)
  {
    [(SingleLocationUpdate *)self acceptableAccuracy];
    BOOL v12 = v7 <= v11 || v10 >= 10.0;
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
  }
LABEL_9:

  return v12;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  if ([v7 code]
    || ([v7 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isEqualToString:kCLErrorDomain],
        v5,
        (v6 & 1) == 0))
  {
    [(SingleLocationUpdate *)self _completeWithLocation:0 error:v7];
  }
}

- (void)_completeWithLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSTimer *)self->_timeout invalidate];
  if (v6)
  {
    double v8 = sub_100541270();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      [(SingleLocationUpdate *)self _timeSinceStart];
      uint64_t v10 = v9;
      [v6 horizontalAccuracy];
      BOOL v12 = v11;
      [(SingleLocationUpdate *)self desiredAccuracy];
      uint64_t v14 = v13;
      [(SingleLocationUpdate *)self acceptableAccuracy];
      int v30 = 134219008;
      v31 = self;
      __int16 v32 = 2048;
      uint64_t v33 = v10;
      __int16 v34 = 2048;
      id v35 = v12;
      __int16 v36 = 2048;
      uint64_t v37 = v14;
      __int16 v38 = 2048;
      uint64_t v39 = v15;
      v16 = "Single location update %p got a good-enough location after %#.3lfs (accuracy: ±%#.2lfm, desired: ±%#.2lfm, a"
            "cceptable: ±%#.2lfm)";
      v17 = v8;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      uint32_t v19 = 52;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v30, v19);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  double v8 = sub_100541270();
  BOOL v20 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v20)
    {
      [(SingleLocationUpdate *)self _timeSinceStart];
      int v30 = 134218498;
      v31 = self;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      id v35 = v7;
      v16 = "Single location update %p failed after %#.3lfs with error: %@";
      v17 = v8;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 32;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v20)
  {
    [(SingleLocationUpdate *)self _timeSinceStart];
    uint64_t v24 = v23;
    [(CLLocation *)self->_lastLocation horizontalAccuracy];
    v26 = v25;
    [(SingleLocationUpdate *)self desiredAccuracy];
    uint64_t v28 = v27;
    [(SingleLocationUpdate *)self acceptableAccuracy];
    int v30 = 134219008;
    v31 = self;
    __int16 v32 = 2048;
    uint64_t v33 = v24;
    __int16 v34 = 2048;
    id v35 = v26;
    __int16 v36 = 2048;
    uint64_t v37 = v28;
    __int16 v38 = 2048;
    uint64_t v39 = v29;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Single location update %p never got a good-enough location after %#.3lfs (best received: ±%#.2lfm, desired: ±%#.2lfm, acceptable: ±%#.2lfm)", (uint8_t *)&v30, 0x34u);
  }

  id v7 = +[NSError errorWithDomain:kCLErrorDomain code:0 userInfo:0];
LABEL_9:
  v22 = (void (**)(id, id, id))objc_retainBlock(self->_completionHandler);
  [(SingleLocationUpdate *)self _cleanup];
  if (v22) {
    v22[2](v22, v6, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

@end