@interface CLLocationDerivedSpeedEstimator
+ (BOOL)isSupported;
+ (BOOL)isSupportedForAnalytics;
+ (BOOL)isSupportedForDerivedSpeedEstimate;
- ($1AB5FA073B851C12C2339EC22442E995)currentEstimate;
- (BOOL)_feedLocation:(id)a3;
- (BOOL)feedLocation:(const CLDaemonLocation *)a3;
- (BOOL)valid;
- (CLLocation)prevLoc;
- (CLLocationDerivedSpeedEstimator)init;
- (CLTimer)scanTimer;
- (id).cxx_construct;
- (id)initInUniverse:(id)a3;
- (void)_invalidateSpeedEstimate;
- (void)_onScanTimer;
- (void)clearStatusBarColorAndText;
- (void)dealloc;
- (void)handleMotionStateNotification:(NotificationData *)a3;
- (void)handleVehicularStateChanged;
- (void)invalidate;
- (void)logLatencyMetricsInternal;
- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4;
- (void)onWifiServiceNotification:(int)a3 data:(NotificationData *)a4;
- (void)registerForNotifications;
- (void)setCurrentEstimate:(id)a3;
- (void)setPrevLoc:(id)a3;
- (void)setScanTimer:(id)a3;
- (void)setStatusBarWithLabel:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)startWsbClient;
- (void)stopWsbClient;
- (void)submitFalseDetectionMetricsWithType:(unint64_t)a3;
- (void)submitLatencyMetrics;
- (void)unregisterForNotifications;
- (void)updateStatusBarLabel;
- (void)updateWsbClient:(BOOL)a3;
@end

@implementation CLLocationDerivedSpeedEstimator

- (BOOL)feedLocation:(const CLDaemonLocation *)a3
{
  id v5 = objc_alloc((Class)CLLocation);
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  v12[6] = *(_OWORD *)&a3->lifespan;
  v12[7] = rawCoordinate;
  v13[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)&a3->integrity;
  long long v7 = *(_OWORD *)&a3->speed;
  v12[2] = *(_OWORD *)&a3->altitude;
  v12[3] = v7;
  long long v8 = *(_OWORD *)&a3->timestamp;
  v12[4] = *(_OWORD *)&a3->course;
  v12[5] = v8;
  long long v9 = *(_OWORD *)&a3->coordinate.longitude;
  v12[0] = *(_OWORD *)&a3->suitability;
  v12[1] = v9;
  id v10 = [v5 initWithClientLocation:v12];
  LOBYTE(self) = [(CLLocationDerivedSpeedEstimator *)self _feedLocation:v10];

  return (char)self;
}

- (BOOL)_feedLocation:(id)a3
{
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  id v5 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v63 = [objc_msgSend(a3, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VEHICULAR: leeched location, %s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    [objc_msgSend(a3, "description") UTF8String];
    v53 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v53);
    if (v53 != (char *)buf) {
      free(v53);
    }
  }
  if ([a3 type] == 1) {
    self->_hintsAvailable |= 2uLL;
  }
  if ([a3 type] == 4) {
    self->_hintsAvailable |= 8uLL;
  }
  if ([a3 type] == 4)
  {
    if ([(CLLocationDerivedSpeedEstimator *)self prevLoc]
      && objc_msgSend(objc_msgSend(objc_msgSend(a3, "timestamp"), "earlierDate:", -[CLLocation timestamp](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "timestamp")), "isEqualToDate:", objc_msgSend(a3, "timestamp")))
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v6 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "VEHICULAR: location timestamp out of order", buf, 2u);
      }
      BOOL v7 = sub_10013D1A0(115, 2);
      if (v7)
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
LABEL_28:
        id v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
        goto LABEL_71;
      }
      return v7;
    }
    [a3 horizontalAccuracy];
    if (v11 > 150.0)
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v12 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        [a3 horizontalAccuracy];
        *(_DWORD *)buf = 134217984;
        *(void *)v63 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "VEHICULAR: disqualified leeched location, horizontal accuracy, %f", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_70;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      [a3 horizontalAccuracy];
LABEL_39:
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v14);
      if (v14 == (char *)buf) {
        goto LABEL_70;
      }
      goto LABEL_49;
    }
    [objc_msgSend(a3, "timestamp") timeIntervalSinceNow];
    *(float *)&double v15 = v15;
    float v16 = fabsf(*(float *)&v15);
    if (v16 > 180.0)
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      double v17 = v16;
      v18 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v63 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "VEHICULAR: disqualified leeched location, age, %f", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_70;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 == -1)
      {
LABEL_48:
        v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v14);
        if (v14 == (char *)buf)
        {
LABEL_70:
          [(CLLocationDerivedSpeedEstimator *)self _invalidateSpeedEstimate];
LABEL_71:
          LOBYTE(v7) = 0;
          return v7;
        }
LABEL_49:
        free(v14);
        goto LABEL_70;
      }
LABEL_163:
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
      goto LABEL_48;
    }
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    v19 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [a3 type];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v63 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "VEHICULAR: qualified leeched location, type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      [a3 type];
      v54 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v54);
      if (v54 != (char *)buf) {
        free(v54);
      }
    }
    if (![(CLLocationDerivedSpeedEstimator *)self prevLoc])
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v23 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "VEHICULAR: first qualifying location", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_69;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 == -1) {
        goto LABEL_141;
      }
      goto LABEL_164;
    }
    [objc_msgSend(a3, "timestamp") timeIntervalSinceDate:-[CLLocation timestamp](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "timestamp")];
    if (v21 > 240.0)
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v22 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v63 = 0x406E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "VEHICULAR: renew previous location older than age of %f seconds", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_69;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 == -1)
      {
LABEL_141:
        v55 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v55);
        if (v55 != (char *)buf) {
          free(v55);
        }
LABEL_69:
        [(CLLocationDerivedSpeedEstimator *)self setPrevLoc:a3];
        goto LABEL_70;
      }
LABEL_164:
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
      goto LABEL_141;
    }
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    v24 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v25 = [[(CLLocationDerivedSpeedEstimator *)self prevLoc] type];
      id v26 = [[-[CLLocation description](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "description") UTF8String];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v63 = v25;
      *(_WORD *)&v63[4] = 2080;
      *(void *)&v63[6] = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "VEHICULAR: previous location, type, %d, %s", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      [[(CLLocationDerivedSpeedEstimator *)self prevLoc] type];
      [[-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc") description] UTF8String];
      v56 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v56);
      if (v56 != (char *)buf) {
        free(v56);
      }
    }
    [[(CLLocationDerivedSpeedEstimator *)self prevLoc] distanceFromLocation:a3];
    double v28 = v27;
    -[NSDate timeIntervalSinceDate:](-[CLLocation timestamp](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "timestamp"), "timeIntervalSinceDate:", [a3 timestamp]);
    double v30 = v29;
    [[(CLLocationDerivedSpeedEstimator *)self prevLoc] horizontalAccuracy];
    double v32 = v31 * v31;
    [a3 horizontalAccuracy];
    double v34 = sqrt(v32 + v33 * v33);
    if (v28 <= v34) {
      double v35 = 0.0;
    }
    else {
      double v35 = v28 - v34;
    }
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    double v36 = fabs(v30);
    v37 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)v63 = v28;
      *(_WORD *)&v63[8] = 2048;
      *(double *)&v63[10] = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "VEHICULAR: distanceMoved, %f, elapsedTime, %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v57 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v57);
      if (v57 != (char *)buf) {
        free(v57);
      }
    }
    if (v36 <= 60.0)
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v43 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v63 = 0x404E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "VEHICULAR: drop leeched location within %f sec", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_70;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 == -1) {
        goto LABEL_48;
      }
      goto LABEL_163;
    }
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    v38 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v39 = [a3 type];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v63 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "VEHICULAR: accept qualified leeched location, type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      [a3 type];
      v58 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v58);
      if (v58 != (char *)buf) {
        free(v58);
      }
    }
    if (v30 == 0.0)
    {
      [(CLLocationDerivedSpeedEstimator *)self _invalidateSpeedEstimate];
      [(CLLocationDerivedSpeedEstimator *)self setPrevLoc:a3];
      goto LABEL_71;
    }
    double v40 = v35 / v36;
    if (v40 > 45.0)
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v41 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v42 = [a3 type];
        *(_DWORD *)buf = 134219264;
        *(double *)v63 = v40;
        *(_WORD *)&v63[8] = 2048;
        *(double *)&v63[10] = v28 / v36;
        *(_WORD *)&v63[18] = 2048;
        *(double *)&v63[20] = v34 / v36;
        *(_WORD *)&v63[28] = 2048;
        *(double *)&v63[30] = v28;
        __int16 v64 = 2048;
        double v65 = v36;
        __int16 v66 = 1024;
        unsigned int v67 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "VEHICULAR: outlier, conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", buf, 0x3Au);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_70;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      [a3 type];
      goto LABEL_39;
    }
    [objc_msgSend(a3, "timestamp") timeIntervalSinceReferenceDate];
    -[CLLocationDerivedSpeedEstimator setCurrentEstimate:](self, "setCurrentEstimate:", v28 / v36, v44, v34 / v36);
    if (v40 <= 6.7)
    {
      self->_int numConsecutiveVehicularSpeedObservations = 0;
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v51 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v52 = [a3 type];
        *(_DWORD *)buf = 134219264;
        *(double *)v63 = v40;
        *(_WORD *)&v63[8] = 2048;
        *(double *)&v63[10] = v28 / v36;
        *(_WORD *)&v63[18] = 2048;
        *(double *)&v63[20] = v34 / v36;
        *(_WORD *)&v63[28] = 2048;
        *(double *)&v63[30] = v28;
        __int16 v64 = 2048;
        double v65 = v36;
        __int16 v66 = 1024;
        unsigned int v67 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "VEHICULAR: conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", buf, 0x3Au);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_130;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 == -1) {
        goto LABEL_160;
      }
    }
    else
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v45 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        int numConsecutiveVehicularSpeedObservations = self->_numConsecutiveVehicularSpeedObservations;
        double lastElapsedTime = self->_lastElapsedTime;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v63 = numConsecutiveVehicularSpeedObservations;
        *(_WORD *)&v63[4] = 2048;
        *(double *)&v63[6] = v36;
        *(_WORD *)&v63[14] = 2048;
        *(double *)&v63[16] = lastElapsedTime;
        *(_WORD *)&v63[24] = 2048;
        *(double *)&v63[26] = v36 - lastElapsedTime;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "VEHICULAR: vehicular speed detected, consecutive observations, %d, elapsedTime, %f, lastElapsedTime, %f, delta, %f", buf, 0x26u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
        v59 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v59);
        if (v59 != (char *)buf) {
          free(v59);
        }
      }
      int v48 = self->_numConsecutiveVehicularSpeedObservations;
      if (v48 <= 0)
      {
        self->_int numConsecutiveVehicularSpeedObservations = v48 + 1;
        self->_double lastElapsedTime = v36;
        self->_lastDistanceMoved = v28;
        [(CLLocationDerivedSpeedEstimator *)self _invalidateSpeedEstimate];
        [(CLTimer *)[(CLLocationDerivedSpeedEstimator *)self scanTimer] setNextFireDelay:15.0];
        goto LABEL_71;
      }
      if (v36 - self->_lastElapsedTime < 15.0) {
        goto LABEL_70;
      }
      [(CLTimer *)[(CLLocationDerivedSpeedEstimator *)self scanTimer] setNextFireDelay:1.79769313e308];
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v49 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v50 = [a3 type];
        *(_DWORD *)buf = 134219264;
        *(double *)v63 = v40;
        *(_WORD *)&v63[8] = 2048;
        *(double *)&v63[10] = v28 / v36;
        *(_WORD *)&v63[18] = 2048;
        *(double *)&v63[20] = v34 / v36;
        *(_WORD *)&v63[28] = 2048;
        *(double *)&v63[30] = v28;
        __int16 v64 = 2048;
        double v65 = v36;
        __int16 v66 = 1024;
        unsigned int v67 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "VEHICULAR: conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", buf, 0x3Au);
      }
      if (!sub_10013D1A0(115, 2))
      {
LABEL_130:
        [(CLLocationDerivedSpeedEstimator *)self setPrevLoc:a3];
        LOBYTE(v7) = 1;
        return v7;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419010 == -1)
      {
LABEL_160:
        [a3 type];
        v60 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v60);
        if (v60 != (char *)buf) {
          free(v60);
        }
        goto LABEL_130;
      }
    }
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
    goto LABEL_160;
  }
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  long long v8 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = [a3 type];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v63 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "VEHICULAR: disqualified leeched location, type, %d", buf, 8u);
  }
  BOOL v7 = sub_10013D1A0(115, 2);
  if (v7)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    [a3 type];
    goto LABEL_28;
  }
  return v7;
}

+ (BOOL)isSupported
{
  if ([(id)objc_opt_class() isSupportedForDerivedSpeedEstimate]) {
    return 1;
  }
  v3 = objc_opt_class();

  return _[v3 isSupportedForAnalytics];
}

+ (BOOL)isSupportedForAnalytics
{
  if ([(id)objc_opt_class() isSupportedForDerivedSpeedEstimate]) {
    return 1;
  }
  sub_100103240();

  return sub_10010145C();
}

+ (BOOL)isSupportedForDerivedSpeedEstimate
{
  sub_100103240();
  LODWORD(v2) = sub_10016CCBC();
  if (v2) {
    return ((unint64_t)sub_1000A16E8() >> 35) & 1;
  }
  return v2;
}

- (CLLocationDerivedSpeedEstimator)init
{
  return 0;
}

- (id)initInUniverse:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLLocationDerivedSpeedEstimator.mm", 155, @"Invalid parameter not satisfying: %@", @"universe" object file lineNumber description];
  }
  if ([(id)objc_opt_class() isSupported])
  {
    v24.receiver = self;
    v24.super_class = (Class)CLLocationDerivedSpeedEstimator;
    id v5 = [(CLLocationDerivedSpeedEstimator *)&v24 init];
    v6 = v5;
    if (v5)
    {
      v5->_valid = 1;
      v5->_universe = (CLIntersiloUniverse *)a3;
      BOOL v7 = (CLSilo *)[a3 silo];
      *(_WORD *)&v6->_showActivityVehicular = 0;
      p_showActivityVehicular = &v6->_showActivityVehicular;
      v6->_vehicleStateProxy = 0;
      v6->_silo = v7;
      sub_100103240();
      p_showActivityVehicularMounted = &v6->_showActivityVehicularMounted;
      if (sub_10073E30C())
      {
        sub_1000C7F88(buf);
        sub_1000D2988(*(uint64_t *)buf, "ShowActivityVehicular", &v6->_showActivityVehicular);
        if (*(void *)&buf[8]) {
          sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
        }
        sub_1000C7F88(buf);
        sub_1000D2988(*(uint64_t *)buf, "ShowActivityVehicularMounted", &v6->_showActivityVehicularMounted);
        if (*(void *)&buf[8]) {
          sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
        }
      }
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      id v10 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
      {
        BOOL v11 = *p_showActivityVehicular;
        BOOL v12 = *p_showActivityVehicularMounted;
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "ShowActivityVehicular";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v11;
        __int16 v34 = 2080;
        double v35 = "ShowActivityVehicularMounted";
        __int16 v36 = 1024;
        BOOL v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s, %d, %s, %d", buf, 0x22u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
        BOOL v20 = *p_showActivityVehicular;
        BOOL v21 = *p_showActivityVehicularMounted;
        int v25 = 136315906;
        id v26 = "ShowActivityVehicular";
        __int16 v27 = 1024;
        BOOL v28 = v20;
        __int16 v29 = 2080;
        double v30 = "ShowActivityVehicularMounted";
        __int16 v31 = 1024;
        BOOL v32 = v21;
        v22 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator initInUniverse:]", "%s\n", v22);
        if (v22 != buf) {
          free(v22);
        }
      }
      v6->_statusBarAssertion = 0;
      v6->_vehicularHints = 0;
      *(_WORD *)&v6->_visualIndicatorActive = 0;
      v6->_motionVehicular = 0;
      v6->_prevLoc = 0;
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)&v6->_currentEstimate.speed = _Q0;
      v6->_currentEstimate.uncertainty = -1.0;
      v6->_prevVehicularHints = 0;
      v6->_hintsAvailable = 21;
      *(_OWORD *)&v6->_vehicularStartTime = 0u;
      *(_OWORD *)&v6->_vehicularLastBTHintTime = 0u;
      *(_OWORD *)&v6->_accelDetectionLatency = _Q0;
      *(_OWORD *)&v6->_basebandDetectionLatency = _Q0;
      *(_OWORD *)&v6->_btDetectionLatency = _Q0;
      *(_OWORD *)&v6->_vehicularDurationExitFromNoHints = _Q0;
      v6->_vehicularDurationLastBTHintFromLastMotionHint = -1.0;
      v6->_sequentialVehicularIndex = 0;
      *(void *)&v6->_numMotionExitsWithBT = 0;
      v6->_int numConsecutiveVehicularSpeedObservations = 0;
      v6->_wsbClientStartTime = 0;
      v6->_double lastElapsedTime = 0.0;
      v6->_lastDistanceMoved = 0.0;
      [(CLLocationDerivedSpeedEstimator *)v6 registerForNotifications];
      v18 = (CLTimer *)[(CLSilo *)v6->_silo newTimer];
      v6->_scanTimer = v18;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1005DC570;
      v23[3] = &unk_10229FED8;
      v23[4] = v6;
      [(CLTimer *)v18 setHandler:v23];
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)registerForNotifications
{
}

- (void)startWsbClient
{
  if (!self->_wsbClientStartTime)
  {
    int v2 = 3600;
    __int16 v3 = 257;
    v4 = "dndwd";
    sub_1005E05AC();
  }
}

- (void)stopWsbClient
{
  if (self->_wsbClientStartTime)
  {
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];

    self->_wsbClientStartTime = 0;
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    __int16 v3 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopWsbClient", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator stopWsbClient]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)updateWsbClient:(BOOL)a3
{
  if (a3) {
    [(CLLocationDerivedSpeedEstimator *)self stopWsbClient];
  }
  else {
    [(CLLocationDerivedSpeedEstimator *)self startWsbClient];
  }
}

- (void)unregisterForNotifications
{
  value = self->_wifiServiceClient.__ptr_.__value_;
  if (value)
  {
    self->_wifiServiceClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
    v4 = self->_wifiServiceClient.__ptr_.__value_;
    self->_wifiServiceClient.__ptr_.__value_ = 0;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
    }
  }
  id v5 = self->_motionStateClient.__ptr_.__value_;
  if (v5)
  {
    self->_motionStateClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
    v6 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
    }
  }
  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
}

- (void)invalidate
{
  [(CLLocationDerivedSpeedEstimator *)self unregisterForNotifications];

  [(CLLocationDerivedSpeedEstimator *)self _invalidateSpeedEstimate];
}

- (void)dealloc
{
  [(CLLocationDerivedSpeedEstimator *)self clearStatusBarColorAndText];
  [(CLLocationDerivedSpeedEstimator *)self invalidate];
  [(CLTimer *)self->_scanTimer invalidate];

  self->_scanTimer = 0;
  self->_prevLoc = 0;

  self->_silo = 0;
  self->_universe = 0;

  self->_vehicleStateProxy = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLocationDerivedSpeedEstimator;
  [(CLLocationDerivedSpeedEstimator *)&v3 dealloc];
}

- (void)_onScanTimer
{
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  objc_super v3 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VEHICULAR: start extra scan", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    __int16 v19 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _onScanTimer]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  sub_100134750(__p, "speedestimator");
  sub_1006D30DC(buf, 4, 1, __p, Current);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  id v5 = [[-[CLIntersiloUniverse vendor](self->_universe, "vendor") proxyForService:@"CLWifiLocationProvider"];
  uint64_t v7 = *(void *)buf;
  char v8 = v21;
  if (SHIBYTE(v23) < 0)
  {
    sub_1000DC48C(&v9, (void *)v22, *((unint64_t *)&v22 + 1));
  }
  else
  {
    long long v9 = v22;
    uint64_t v10 = v23;
  }
  long long v12 = v25;
  long long v13 = v26;
  v14[0] = v27[0];
  *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)((char *)v27 + 12);
  long long v11 = v24;
  if (SHIBYTE(v29) < 0)
  {
    sub_1000DC48C(&v15, (void *)v28, *((unint64_t *)&v28 + 1));
  }
  else
  {
    long long v15 = v28;
    uint64_t v16 = v29;
  }
  [v5 requestLocationUpdateWithParameters:sub_1005DD244((uint64_t)&v7)];
  if (SHIBYTE(v16) < 0) {
    operator delete((void *)v15);
  }
  if (SHIBYTE(v10) < 0) {
    operator delete((void *)v9);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete((void *)v28);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete((void *)v22);
  }
}

- (void)_invalidateSpeedEstimate
{
}

- (void)handleVehicularStateChanged
{
  if (!self->_showActivityVehicularMounted)
  {
    vehicleStateProxy = self->_vehicleStateProxy;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1005DD434;
    v3[3] = &unk_1022BDC10;
    v3[4] = self;
    [(CLVehicleStateNotifierProtocol *)vehicleStateProxy fetchVehicularDndStateAndHintsWithReply:v3];
  }
}

- (void)handleMotionStateNotification:(NotificationData *)a3
{
  long long v7 = *((_OWORD *)a3 + 7);
  long long v76 = *((_OWORD *)a3 + 6);
  long long v77 = v7;
  uint64_t v78 = *((void *)a3 + 16);
  long long v8 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&v74.isStanding = *((_OWORD *)a3 + 2);
  *(_OWORD *)&v74.isVehicleConnected = v8;
  long long v9 = *((_OWORD *)a3 + 5);
  *(_OWORD *)&v74.vehicleType = *((_OWORD *)a3 + 4);
  long long v75 = v9;
  long long v10 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&v74.int type = *(_OWORD *)a3;
  *(_OWORD *)&v74.mountedConfidence = v10;
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  long long v11 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
  {
    int type = v74.type;
    uint64_t v13 = CLMotionActivity::activityTypeToString();
    int confidence = v74.confidence;
    int isMounted = CLMotionActivity::isMounted(&v74);
    *(_DWORD *)buf = 136316162;
    double v90 = *(double *)&v13;
    __int16 v91 = 1024;
    int v92 = type;
    __int16 v93 = 1024;
    int v94 = confidence;
    __int16 v95 = 1024;
    int v96 = isMounted;
    __int16 v97 = 2048;
    uint64_t v98 = v75;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MotionState, %s, type, %d, conf, %d, mounted, %d, startTime, %f", buf, 0x28u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    uint64_t v55 = CLMotionActivity::activityTypeToString();
    int v56 = v74.type;
    int v57 = v74.confidence;
    int v58 = CLMotionActivity::isMounted(&v74);
    int v79 = 136316162;
    double v80 = *(double *)&v55;
    __int16 v81 = 1024;
    int v82 = v56;
    __int16 v83 = 1024;
    int v84 = v57;
    __int16 v85 = 1024;
    int v86 = v58;
    __int16 v87 = 2048;
    uint64_t v88 = v75;
    v59 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v59);
    if (v59 != (char *)buf) {
      free(v59);
    }
  }
  int v16 = CLMotionActivity::isInVehicle(&v74);
  double vehicularStartTime = self->_vehicularStartTime;
  if (v16)
  {
    if (vehicularStartTime == 0.0)
    {
      double v18 = *(double *)&v75;
      *(void *)&self->_double vehicularStartTime = v75;
      if (vabdd_f64(v18, (double)self->_lastSeenVehicularTime) >= 180.0) {
        int v19 = 0;
      }
      else {
        int v19 = self->_sequentialVehicularIndex + 1;
      }
      self->_int sequentialVehicularIndex = v19;
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      __int16 v31 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        double v32 = self->_vehicularStartTime;
        int sequentialVehicularIndex = self->_sequentialVehicularIndex;
        *(_DWORD *)buf = 134218240;
        double v90 = v32;
        __int16 v91 = 1024;
        int v92 = sequentialVehicularIndex;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "VEHICULAR: vehicularStartTime, %f, seq, %d", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
        double v61 = self->_vehicularStartTime;
        int v62 = self->_sequentialVehicularIndex;
        int v79 = 134218240;
        double v80 = v61;
        __int16 v81 = 1024;
        int v82 = v62;
        v63 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v63);
        if (v63 != (char *)buf) {
          free(v63);
        }
      }
      vehicleStateProxy = self->_vehicleStateProxy;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      long long v70 = v75;
      long long v71 = v76;
      long long v72 = v77;
      CLMotionActivity v69 = v74;
      v68[2] = sub_1005DDF2C;
      v68[3] = &unk_1022BDC38;
      uint64_t v73 = v78;
      v68[4] = self;
      [(CLVehicleStateNotifierProtocol *)vehicleStateProxy fetchVehicularFalsePositiveSuppressionStatusWithReply:v68];
      double vehicularStartTime = self->_vehicularStartTime;
    }
    double v35 = *(double *)&v75;
    double v36 = *(double *)&v75 - vehicularStartTime;
    char v37 = v76;
    if (v76)
    {
      unint64_t vehicularHints = self->_vehicularHints;
      if ((vehicularHints & 1) == 0) {
        self->_accelDetectionLatency = v36;
      }
      self->_unint64_t vehicularHints = vehicularHints | 1;
      unint64_t v38 = 1;
      if ((v37 & 2) == 0)
      {
LABEL_42:
        if ((v37 & 4) != 0)
        {
          unint64_t v43 = self->_vehicularHints;
          if ((v43 & 4) == 0) {
            self->_basebandDetectionLatency = v36;
          }
          self->_unint64_t vehicularHints = v43 | 4;
          v38 |= 4uLL;
          if ((v37 & 8) == 0)
          {
LABEL_44:
            if ((v37 & 0x10) == 0) {
              goto LABEL_45;
            }
            goto LABEL_61;
          }
        }
        else if ((v37 & 8) == 0)
        {
          goto LABEL_44;
        }
        unint64_t v44 = self->_vehicularHints;
        if ((v44 & 8) == 0) {
          self->_wifiDetectionLatency = v36;
        }
        self->_unint64_t vehicularHints = v44 | 8;
        v38 |= 8uLL;
        if ((v37 & 0x10) == 0)
        {
LABEL_45:
          if ((self->_prevVehicularHints & 0x10) != 0) {
            self->_double vehicularLastBTHintTime = v35;
          }
          if (!v38)
          {
            if (self->_vehicularLastNoHintsTime == 0.0)
            {
              self->_double vehicularLastNoHintsTime = v35;
              if (qword_102419010 != -1) {
                dispatch_once(&qword_102419010, &stru_1022BDCA8);
              }
              v41 = qword_102419018;
              if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
              {
                double vehicularLastNoHintsTime = self->_vehicularLastNoHintsTime;
                *(_DWORD *)buf = 134217984;
                double v90 = vehicularLastNoHintsTime;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "VEHICULAR: vehicularLastNoHintsTime, %f", buf, 0xCu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419010 != -1) {
                  dispatch_once(&qword_102419010, &stru_1022BDCA8);
                }
                double v66 = self->_vehicularLastNoHintsTime;
                int v79 = 134217984;
                double v80 = v66;
                unsigned int v67 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v67);
                if (v67 != (char *)buf) {
                  free(v67);
                }
              }
            }
            unint64_t v38 = 0;
            goto LABEL_65;
          }
LABEL_64:
          self->_double vehicularLastNoHintsTime = 0.0;
LABEL_65:
          self->_prevVehicularHints = v38;
          goto LABEL_77;
        }
LABEL_61:
        unint64_t v45 = self->_vehicularHints;
        if ((v45 & 0x10) == 0) {
          self->_btDetectionLatency = v36;
        }
        self->_unint64_t vehicularHints = v45 | 0x10;
        v38 |= 0x10uLL;
        goto LABEL_64;
      }
    }
    else if ((self->_prevVehicularHints & 1) != 0 {
           && (*(void *)&self->_double vehicularLastMotionHintTime = v75, (v37 & 0x10) != 0))
    }
    {
      unint64_t v38 = 0;
      ++self->_numMotionExitsWithBT;
      if ((v37 & 2) == 0) {
        goto LABEL_42;
      }
    }
    else
    {
      unint64_t v38 = 0;
      if ((v37 & 2) == 0) {
        goto LABEL_42;
      }
    }
    unint64_t v40 = self->_vehicularHints;
    if ((v40 & 2) == 0) {
      self->_gpsDetectionLatency = v36;
    }
    self->_unint64_t vehicularHints = v40 | 2;
    v38 |= 2uLL;
    goto LABEL_42;
  }
  if (vehicularStartTime > 0.0)
  {
    double v20 = *(double *)&v75;
    double v21 = *(double *)&v75 - vehicularStartTime;
    int v22 = (int)*(double *)&v75;
    double v24 = self->_vehicularLastNoHintsTime;
    double vehicularLastBTHintTime = self->_vehicularLastBTHintTime;
    double v25 = *(double *)&v75 - v24;
    _ZF = v24 == 0.0;
    double v26 = -1.0;
    if (_ZF) {
      double v25 = -1.0;
    }
    self->_vehicularDuration = v21;
    self->_vehicularDurationExitFromNoHints = v25;
    self->_lastSeenVehicularTime = v22;
    double v27 = v20 - vehicularLastBTHintTime;
    if (vehicularLastBTHintTime == 0.0) {
      double v27 = -1.0;
    }
    self->_vehicularDurationExitFromLastBTHint = v27;
    if (vehicularLastBTHintTime != 0.0)
    {
      double vehicularLastMotionHintTime = self->_vehicularLastMotionHintTime;
      _ZF = vehicularLastBTHintTime <= vehicularLastMotionHintTime || vehicularLastMotionHintTime == 0.0;
      double v30 = vehicularLastBTHintTime - vehicularLastMotionHintTime;
      double v26 = -1.0;
      if (!_ZF) {
        double v26 = v30;
      }
    }
    self->_vehicularDurationLastBTHintFromLastMotionHint = v26;
    if (self->_seenNonVehicularState)
    {
      [(CLLocationDerivedSpeedEstimator *)self logLatencyMetricsInternal];
      [(CLLocationDerivedSpeedEstimator *)self submitLatencyMetrics];
    }
    else
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v46 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        BOOL seenNonVehicularState = self->_seenNonVehicularState;
        *(_DWORD *)buf = 67109120;
        LODWORD(v90) = seenNonVehicularState;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "VEHICULAR: skipping LatencyMetrics, seenNonVehicularState, %d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
        BOOL v64 = self->_seenNonVehicularState;
        int v79 = 67109120;
        LODWORD(v80) = v64;
        double v65 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v65);
        if (v65 != (char *)buf) {
          free(v65);
        }
      }
    }
    self->_unint64_t vehicularHints = 0;
    self->_prevVehicularHints = 0;
    *(_OWORD *)&self->_double vehicularStartTime = 0u;
    *(_OWORD *)&self->_double vehicularLastBTHintTime = 0u;
    self->_numMotionExitsWithBT = 0;
    self->_hintsAvailable = 21;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&self->_accelDetectionLatency = _Q0;
    *(_OWORD *)&self->_basebandDetectionLatency = _Q0;
    *(_OWORD *)&self->_btDetectionLatency = _Q0;
    *(_OWORD *)&self->_vehicularDurationExitFromNoHints = _Q0;
    self->_vehicularDurationLastBTHintFromLastMotionHint = -1.0;
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    unsigned int v52 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "VEHICULAR: reset vehicular latency measures", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      LOWORD(v79) = 0;
      v60 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v60);
      if (v60 != (char *)buf) {
        free(v60);
      }
    }
  }
  self->_BOOL seenNonVehicularState = 1;
LABEL_77:
  if (self->_showActivityVehicularMounted)
  {
    int v53 = CLMotionActivity::isInVehicle(&v74);
    if (v53) {
      LOBYTE(v53) = CLMotionActivity::isMounted(&v74);
    }
    self->_motionVehicular = v53;
    [(CLLocationDerivedSpeedEstimator *)self updateStatusBarLabel];
  }
  else if (self->_showActivityVehicular && self->_visualIndicatorActive)
  {
    unsigned int v54 = self->_vehicularHints;
    [(SBSStatusBarStyleOverridesAssertion *)self->_statusBarAssertion setStatusString:+[NSString stringWithFormat:@"In-Vehicle(Motion:%d,GPS:%d,BB:%d,WiFi:%d,BT:%d,M:%d)", v54 & 1, (v54 >> 1) & 1, (v54 >> 2) & 1, (v54 >> 3) & 1, (v54 >> 4) & 1, CLMotionActivity::isMounted(&v74)]];
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 6)
  {
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    long long v9 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)a4 + 96);
      if (*((unsigned char *)a4 + 96)) {
        int v10 = *((_DWORD *)a4 + 12) > 0;
      }
      *(_DWORD *)buf = 67109120;
      int v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "VEHICULAR: wifi associated state, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    if (*((unsigned char *)a4 + 96)) {
      BOOL v11 = *((_DWORD *)a4 + 12) > 0;
    }
    else {
      BOOL v11 = 0;
    }
    [(CLLocationDerivedSpeedEstimator *)self updateWsbClient:v11];
  }
  else if (a3 == 12)
  {
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    id v5 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = 12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VEHICULAR: notification ScanCache received %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v6 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]", "%s\n");
LABEL_28:
      if (v6 != buf) {
        free(v6);
      }
    }
  }
  else
  {
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    long long v12 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "VEHICULAR: received unhandled WifiService notification %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      v6 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]", "%s\n");
      goto LABEL_28;
    }
  }
}

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 4)
  {
    [(CLLocationDerivedSpeedEstimator *)self handleMotionStateNotification:a4];
  }
  else
  {
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    long long v8 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "VEHICULAR: received unhandled notification %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLLocationDerivedSpeedEstimator onMotionStateNotification:data:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)updateStatusBarLabel
{
  if (self->_motionVehicular)
  {
    if (self->_visualIndicatorActive)
    {
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      objc_super v3 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v6 = [@"Apple Internal: In-Vehicle" UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "update status bar label, %s", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
        [@"Apple Internal: In-Vehicle" UTF8String];
        v4 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator updateStatusBarLabel]", "%s\n", v4);
        if (v4 != (char *)buf) {
          free(v4);
        }
      }
      [(SBSStatusBarStyleOverridesAssertion *)self->_statusBarAssertion setStatusString:@"Apple Internal: In-Vehicle"];
    }
    else
    {
      [(CLLocationDerivedSpeedEstimator *)self setStatusBarWithLabel:@"Apple Internal: In-Vehicle"];
    }
  }
  else if (self->_visualIndicatorActive)
  {
    [(CLLocationDerivedSpeedEstimator *)self clearStatusBarColorAndText];
  }
}

- (void)setStatusBarWithLabel:(id)a3
{
  if (!self->_visualIndicatorActive)
  {
    if (self->_showActivityVehicularMounted) {
      uint64_t v5 = 0x8000;
    }
    else {
      uint64_t v5 = 4;
    }
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    id v6 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = [a3 UTF8String];
      __int16 v18 = 2048;
      uint64_t v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "set status bar label, %s, style, %llu", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      int v12 = 136315394;
      id v13 = [a3 UTF8String];
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator setStatusBarWithLabel:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    self->_visualIndicatorActive = 1;
    long long v7 = +[SBSStatusBarStyleOverridesAssertion assertionWithStatusBarStyleOverrides:v5 forPID:getpid() exclusive:1 showsWhenForeground:1];
    self->_statusBarAssertion = v7;
    [(SBSStatusBarStyleOverridesAssertion *)v7 setStatusString:a3];
    statusBarAssertion = self->_statusBarAssertion;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005DEBB8;
    v11[3] = &unk_1022B7C20;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1005DEDF4;
    v10[3] = &unk_10229FED8;
    v10[4] = self;
    [(SBSStatusBarStyleOverridesAssertion *)statusBarAssertion acquireWithHandler:v11 invalidationHandler:v10];
  }
}

- (void)clearStatusBarColorAndText
{
  self->_visualIndicatorActive = 0;
  [(SBSStatusBarStyleOverridesAssertion *)self->_statusBarAssertion invalidate];

  self->_statusBarAssertion = 0;
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  objc_super v3 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "clear status bar label", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator clearStatusBarColorAndText]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)logLatencyMetricsInternal
{
  sub_100103240();
  if (sub_10073E30C())
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1005DF4D8;
    v28[3] = &unk_1022BDC88;
    v28[4] = self;
    int v3 = off_10241CC28(@"212", @"VehicleConnection_NOT_A_CRASH", 0, 0, (uint64_t)v28);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    v4 = qword_102419018;
    if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
    {
      double accelDetectionLatency = self->_accelDetectionLatency;
      double gpsDetectionLatency = self->_gpsDetectionLatency;
      double basebandDetectionLatency = self->_basebandDetectionLatency;
      double wifiDetectionLatency = self->_wifiDetectionLatency;
      double vehicularDurationExitFromNoHints = self->_vehicularDurationExitFromNoHints;
      double vehicularDurationExitFromLastBTHint = self->_vehicularDurationExitFromLastBTHint;
      double vehicularDurationLastBTHintFromLastMotionHint = self->_vehicularDurationLastBTHintFromLastMotionHint;
      int numMotionExitsWithBT = self->_numMotionExitsWithBT;
      int sequentialVehicularIndex = self->_sequentialVehicularIndex;
      double btDetectionLatency = self->_btDetectionLatency;
      double vehicularDuration = self->_vehicularDuration;
      *(_DWORD *)buf = 134220800;
      double v54 = accelDetectionLatency;
      __int16 v55 = 2048;
      double v56 = gpsDetectionLatency;
      __int16 v57 = 2048;
      double v58 = basebandDetectionLatency;
      __int16 v59 = 2048;
      double v60 = wifiDetectionLatency;
      __int16 v61 = 2048;
      double v62 = btDetectionLatency;
      __int16 v63 = 2048;
      double v64 = vehicularDurationExitFromNoHints;
      __int16 v65 = 2048;
      double v66 = vehicularDurationExitFromLastBTHint;
      __int16 v67 = 2048;
      double v68 = vehicularDurationLastBTHintFromLastMotionHint;
      __int16 v69 = 1024;
      int v70 = numMotionExitsWithBT;
      __int16 v71 = 1024;
      int v72 = sequentialVehicularIndex;
      __int16 v73 = 2048;
      double v74 = vehicularDuration;
      __int16 v75 = 1024;
      int v76 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VEHICULAR: logLatencyMetricsInternal, accel, %f, gps, %f, bb, %f, wifi, %f, bt, %f, exitFromNoHints, %f, exitFromLastBTHint, %f, BTHintFromLastMotionHintDuration, %f, motionExitsWithBTCount, %d, sequentialVehicularIndex, %d, duration, %f, success, %d", buf, 0x6Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      double v16 = self->_accelDetectionLatency;
      double v17 = self->_gpsDetectionLatency;
      double v18 = self->_basebandDetectionLatency;
      double v19 = self->_wifiDetectionLatency;
      double v20 = self->_vehicularDurationExitFromNoHints;
      double v21 = self->_vehicularDurationExitFromLastBTHint;
      double v22 = self->_vehicularDurationLastBTHintFromLastMotionHint;
      int v23 = self->_numMotionExitsWithBT;
      int v24 = self->_sequentialVehicularIndex;
      double v26 = self->_btDetectionLatency;
      double v25 = self->_vehicularDuration;
      int v29 = 134220800;
      double v30 = v16;
      __int16 v31 = 2048;
      double v32 = v17;
      __int16 v33 = 2048;
      double v34 = v18;
      __int16 v35 = 2048;
      double v36 = v19;
      __int16 v37 = 2048;
      double v38 = v26;
      __int16 v39 = 2048;
      double v40 = v20;
      __int16 v41 = 2048;
      double v42 = v21;
      __int16 v43 = 2048;
      double v44 = v22;
      __int16 v45 = 1024;
      int v46 = v23;
      __int16 v47 = 1024;
      int v48 = v24;
      __int16 v49 = 2048;
      double v50 = v25;
      __int16 v51 = 1024;
      int v52 = v3;
      double v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator logLatencyMetricsInternal]", "%s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
    }
  }
}

- (void)submitFalseDetectionMetricsWithType:(unint64_t)a3
{
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  v4 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VEHICULAR: false positive detected, hint, %lu", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator submitFalseDetectionMetricsWithType:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  AnalyticsSendEvent();
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 8uLL:
      goto LABEL_15;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      if (qword_102419010 != -1) {
        dispatch_once(&qword_102419010, &stru_1022BDCA8);
      }
      uint64_t v5 = qword_102419018;
      if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v9) = 6488064;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VEHICULAR: submit baseband false detection metric, id, %u", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419010 != -1) {
          dispatch_once(&qword_102419010, &stru_1022BDCA8);
        }
        long long v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator submitFalseDetectionMetricsWithType:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
      AWDPostSimpleMetric();
      goto LABEL_15;
    default:
      if (a3 == 16) {
LABEL_15:
      }
        AnalyticsSendEvent();
      return;
  }
}

- (void)submitLatencyMetrics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_vehicularDuration)] forKeyedSubscript:@"duration"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_hintsAvailable)] forKeyedSubscript:@"hintsAvailable"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_vehicularHints)] forKeyedSubscript:@"hintsDetected"];
  [v3 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sequentialVehicularIndex) forKeyedSubscript:@"sequentialVehicularIndex"];
  if (self->_vehicularDurationExitFromNoHints >= 0.0) {
    [v3 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"durationExitFromNoHints"];
  }
  unint64_t vehicularHints = self->_vehicularHints;
  if (vehicularHints)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_accelDetectionLatency)] forKeyedSubscript:@"accel"];
    double accelDetectionLatency = self->_accelDetectionLatency;
    unint64_t vehicularHints = self->_vehicularHints;
  }
  else
  {
    double accelDetectionLatency = 1.79769313e308;
  }
  double wifiDetectionLatency = accelDetectionLatency;
  if ((vehicularHints & 8) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_wifiDetectionLatency)] forKeyedSubscript:@"wifi"];
    if (self->_wifiDetectionLatency >= accelDetectionLatency) {
      double wifiDetectionLatency = accelDetectionLatency;
    }
    else {
      double wifiDetectionLatency = self->_wifiDetectionLatency;
    }
    unint64_t vehicularHints = self->_vehicularHints;
  }
  if ((vehicularHints & 4) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_basebandDetectionLatency)] forKeyedSubscript:@"baseband"];
    double basebandDetectionLatency = self->_basebandDetectionLatency;
    if (basebandDetectionLatency < accelDetectionLatency) {
      double accelDetectionLatency = self->_basebandDetectionLatency;
    }
    if (basebandDetectionLatency >= wifiDetectionLatency) {
      double v7 = wifiDetectionLatency;
    }
    else {
      double v7 = self->_basebandDetectionLatency;
    }
    unint64_t vehicularHints = self->_vehicularHints;
  }
  else
  {
    double v7 = wifiDetectionLatency;
  }
  double gpsDetectionLatency = v7;
  if ((vehicularHints & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithDouble:self->_gpsDetectionLatency] forKeyedSubscript:@"gps"];
    if (self->_gpsDetectionLatency >= v7) {
      double gpsDetectionLatency = v7;
    }
    else {
      double gpsDetectionLatency = self->_gpsDetectionLatency;
    }
    unint64_t vehicularHints = self->_vehicularHints;
  }
  if ((vehicularHints & 0x10) != 0)
  {
    [v3 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_btDetectionLatency) forKeyedSubscript:@"bt"];
    [v3 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numMotionExitsWithBT) forKeyedSubscript:@"countMotionExitsWithBT"];
    if (self->_vehicularDurationExitFromLastBTHint >= 0.0) {
      [v3 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"durationExitFromLastBTHint"];
    }
    if (self->_vehicularDurationLastBTHintFromLastMotionHint >= 0.0) {
      [v3 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"durationBTHintFromLastMotionHint"];
    }
  }
  if (wifiDetectionLatency < 1.79769313e308)
  {
    [v3 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", wifiDetectionLatency) forKeyedSubscript:@"accelWifi"];
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", accelDetectionLatency)] forKeyedSubscript:@"accelBaseband"];
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7)] forKeyedSubscript:@"accelWifiBaseband"];
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", gpsDetectionLatency)] forKeyedSubscript:@"accelWifiBasebandGPS"];
  }
  AnalyticsSendEvent();
  if (qword_102419010 != -1) {
    dispatch_once(&qword_102419010, &stru_1022BDCA8);
  }
  int v10 = qword_102419018;
  if (os_log_type_enabled((os_log_t)qword_102419018, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138416386;
    id v13 = [v3 objectForKeyedSubscript:@"accel"];
    __int16 v14 = 2112;
    id v15 = [v3 objectForKeyedSubscript:@"gps"];
    __int16 v16 = 2112;
    id v17 = [v3 objectForKeyedSubscript:@"baseband"];
    __int16 v18 = 2112;
    id v19 = [v3 objectForKeyedSubscript:@"wifi"];
    __int16 v20 = 2112;
    id v21 = [v3 objectForKeyedSubscript:@"bt"];
    __int16 v22 = 2112;
    id v23 = [v3 objectForKeyedSubscript:@"accelWifi"];
    __int16 v24 = 2112;
    id v25 = [v3 objectForKeyedSubscript:@"accelBaseband"];
    __int16 v26 = 2112;
    id v27 = [v3 objectForKeyedSubscript:@"accelWifiBaseband"];
    __int16 v28 = 2112;
    id v29 = [v3 objectForKeyedSubscript:@"accelWifiBasebandGPS"];
    __int16 v30 = 2112;
    id v31 = [v3 objectForKeyedSubscript:@"durationExitFromNoHints"];
    __int16 v32 = 2112;
    id v33 = [v3 objectForKeyedSubscript:@"durationExitFromLastBTHint"];
    __int16 v34 = 2112;
    id v35 = [v3 objectForKeyedSubscript:@"durationBTHintFromLastMotionHint"];
    __int16 v36 = 2112;
    id v37 = [v3 objectForKeyedSubscript:@"countMotionExitsWithBT"];
    __int16 v38 = 2112;
    id v39 = [v3 objectForKeyedSubscript:@"sequentialVehicularIndex"];
    __int16 v40 = 2112;
    id v41 = [v3 objectForKeyedSubscript:@"duration"];
    __int16 v42 = 2112;
    id v43 = [v3 objectForKeyedSubscript:@"hintsAvailable"];
    __int16 v44 = 2112;
    id v45 = [v3 objectForKeyedSubscript:@"hintsDetected"];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "VEHICULAR: submitLatencyMetrics, accel, %@, gps, %@, baseband, %@, wifi, %@, bt, %@, accelWifi, %@, accelBaseband, %@, accelWifiBaseband, %@, accelWifiBasebandGPS, %@, exitFromNoHints, %@, durationExitFromLastBTHint, %@, durationBTHintFromLastMotionHint, %@, countMotionExitsWithBT, %@, sequentialVehicularIndex, %@, duration, %@, hintsAvailable, %@, hintsDetected, %@", buf, 0xACu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419010 != -1) {
      dispatch_once(&qword_102419010, &stru_1022BDCA8);
    }
    [v3 objectForKeyedSubscript:@"accel"];
    [v3 objectForKeyedSubscript:@"gps"];
    [v3 objectForKeyedSubscript:@"baseband"];
    [v3 objectForKeyedSubscript:@"wifi"];
    [v3 objectForKeyedSubscript:@"bt"];
    [v3 objectForKeyedSubscript:@"accelWifi"];
    [v3 objectForKeyedSubscript:@"accelBaseband"];
    [v3 objectForKeyedSubscript:@"accelWifiBaseband"];
    [v3 objectForKeyedSubscript:@"accelWifiBasebandGPS"];
    [v3 objectForKeyedSubscript:@"durationExitFromNoHints"];
    [v3 objectForKeyedSubscript:@"durationExitFromLastBTHint"];
    [v3 objectForKeyedSubscript:@"durationBTHintFromLastMotionHint"];
    [v3 objectForKeyedSubscript:@"countMotionExitsWithBT"];
    [v3 objectForKeyedSubscript:@"sequentialVehicularIndex"];
    [v3 objectForKeyedSubscript:@"duration"];
    [v3 objectForKeyedSubscript:@"hintsAvailable"];
    [v3 objectForKeyedSubscript:@"hintsDetected"];
    int v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator submitLatencyMetrics]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)currentEstimate
{
  double speed = self->_currentEstimate.speed;
  double timestamp = self->_currentEstimate.timestamp;
  double uncertainty = self->_currentEstimate.uncertainty;
  result.var2 = uncertainty;
  result.var1 = timestamp;
  result.var0 = speed;
  return result;
}

- (void)setCurrentEstimate:(id)a3
{
  self->_currentEstimate = ($9E02BBE4D008A67F6CE59182E6F5D717)a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLLocation)prevLoc
{
  return self->_prevLoc;
}

- (void)setPrevLoc:(id)a3
{
}

- (CLTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  v4 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end