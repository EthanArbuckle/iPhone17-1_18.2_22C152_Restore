@interface CLSubHarvesterAvengerCrossValidation
- (BOOL)logCoreAnalytics:(id)a3;
- (BOOL)logFinalCoreAnalytics:(id)a3;
- (CLDaemonLocation)findNearestDeviceLocationWithBALocationTime:(SEL)a3;
- (double)calculateDispersion:(id)a3;
- (double)randomDoubleWithMin:(double)a3 max:(double)a4;
- (float64x2_t)rotateWithAxis:(float64x2_t *)a3@<X8> angle:(double)a4@<D0> originVector:;
- (id).cxx_construct;
- (id)collectLocationData:(id)a3 outputLocation:(id)a4 deviceLocation:(CLDaemonLocation *)a5;
- (id)convertLocationResult:(id)a3;
- (id)covertLocationToString:(id)a3 withFirstLocationTimeStamp:(id)a4 withPublicKey:(id)a5;
- (id)getDeviceLocationsWithinBeaconingInterval;
- (id)initInUniverse:(id)a3 withExternal:(shared_ptr<CLAvengerHarvestInterface:(CLSubHarvesterAvengerSettings *)a5 :External>)a4 andSettings:;
- (id)shiftLocation:(id)a3 referenceLocation:(CLDaemonLocation *)a4 latitudeShift:(double)a5 longitudeShift:(double)a6 directionShift:(double)a7;
- (int)binAccuracy:(double)a3;
- (int)binLocationAge:(double)a3;
- (int)binRatio:(double)a3;
- (int)binTimeInterval:(double)a3;
- (int64_t)getTimeOfDayForAnalytics;
- (void)dealloc;
- (void)processAvengerLocations:(id)a3;
- (void)queryForBAResult;
- (void)receiveCLVisit:(id)a3;
- (void)receiveLocation:(CLDaemonLocation *)a3;
- (void)receiveMotionActivity:(CLMotionActivity *)a3;
- (void)receiveSignalEnvironment:(int)a3;
- (void)retrieveOwnerLocationsDuringValidationPeriod:(id)a3 completion:(id)a4;
- (void)setRecentLastPublishDate:(id)a3;
- (void)submitEmptyFinalResult;
- (void)submitEmptyResult;
- (void)terminateActiveLocationRequest;
- (void)terminateBeaconing;
- (void)terminateFinalCrossValidation;
@end

@implementation CLSubHarvesterAvengerCrossValidation

- (void)terminateActiveLocationRequest
{
  if (self->isActivelyRequestingLocation)
  {
    if (qword_1024193D0 != -1) {
      dispatch_once(&qword_1024193D0, &stru_1022E8CA8);
    }
    v3 = qword_1024193D8;
    if (os_log_type_enabled((os_log_t)qword_1024193D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#wigo,off,BlueAvengerCrossValidation", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193D0 != -1) {
        dispatch_once(&qword_1024193D0, &stru_1022E8CA8);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSubHarvesterAvengerCrossValidation terminateActiveLocationRequest]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    AnalyticsSendEventLazy();
    ptr = self->_external.__ptr_;
    *(_DWORD *)buf = 0;
    (*(void (**)(External *, uint8_t *))(*(void *)ptr + 56))(ptr, buf);
    self->isActivelyRequestingLocation = 0;
    [(CLTimer *)self->_activeLocationRequestTimer invalidate];
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022E8CC8);
    }
    v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 2050;
      uint64_t v12 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"cross validation proactive location request terminate\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
    }
  }
}

- (id)initInUniverse:(id)a3 withExternal:(shared_ptr<CLAvengerHarvestInterface:(CLSubHarvesterAvengerSettings *)a5 :External>)a4 andSettings:
{
  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  v26.receiver = self;
  v26.super_class = (Class)CLSubHarvesterAvengerCrossValidation;
  int v8 = [(CLSubHarvesterAvengerCrossValidation *)&v26 init];
  if (v8)
  {
    *((void *)v8 + 1) = a3;
    uint64_t v10 = *(void *)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    *((void *)v8 + 97) = v10;
    __int16 v11 = (std::__shared_weak_count *)*((void *)v8 + 98);
    *((void *)v8 + 98) = v9;
    if (v11) {
      sub_1000DB0A0(v11);
    }
    long long v12 = *(_OWORD *)((char *)cntrl + 8);
    long long v13 = *(_OWORD *)((char *)cntrl + 24);
    long long v14 = *(_OWORD *)((char *)cntrl + 56);
    *(_OWORD *)(v8 + 536) = *(_OWORD *)((char *)cntrl + 40);
    *(_OWORD *)(v8 + 552) = v14;
    *(_OWORD *)(v8 + 504) = v12;
    *(_OWORD *)(v8 + 520) = v13;
    long long v15 = *(_OWORD *)((char *)cntrl + 72);
    long long v16 = *(_OWORD *)((char *)cntrl + 88);
    long long v17 = *(_OWORD *)((char *)cntrl + 120);
    *(_OWORD *)(v8 + 600) = *(_OWORD *)((char *)cntrl + 104);
    *(_OWORD *)(v8 + 616) = v17;
    *(_OWORD *)(v8 + 568) = v15;
    *(_OWORD *)(v8 + 584) = v16;
    long long v18 = *(_OWORD *)((char *)cntrl + 136);
    long long v19 = *(_OWORD *)((char *)cntrl + 152);
    long long v20 = *(_OWORD *)((char *)cntrl + 184);
    *(_OWORD *)(v8 + 664) = *(_OWORD *)((char *)cntrl + 168);
    *(_OWORD *)(v8 + 680) = v20;
    *(_OWORD *)(v8 + 632) = v18;
    *(_OWORD *)(v8 + 648) = v19;
    long long v21 = *(_OWORD *)((char *)cntrl + 200);
    long long v22 = *(_OWORD *)((char *)cntrl + 216);
    long long v23 = *(_OWORD *)((char *)cntrl + 232);
    *((void *)v8 + 93) = *((void *)cntrl + 31);
    *(_OWORD *)(v8 + 712) = v22;
    *(_OWORD *)(v8 + 728) = v23;
    *(_OWORD *)(v8 + 696) = v21;
    *((void *)v8 + 2) = objc_alloc_init((Class)SPOwnerInterface);
    *((void *)v8 + 5) = objc_alloc_init((Class)SPBeaconManager);
    *((void *)v8 + 4) = objc_alloc_init((Class)SPPairingManager);
    *((void *)v8 + 3) = [*((id *)v8 + 2) privateOwnerSession];
    *((void *)v8 + 6) = objc_alloc_init((Class)SPFinderStateManager);
    double v24 = (*(double (**)(char *))(*((void *)v8 + 62) + 96))(v8 + 496);
    arc4random_uniform(v24);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [(CLTimer *)self->_crossValidationDurationTimer invalidate];
  [(CLTimer *)self->_crossValidationFinalQueryTimer invalidate];

  [(CLTimer *)self->_periodicBAQueryTimer invalidate];
  [(CLTimer *)self->_periodicLocationRequestTimer invalidate];

  [(CLTimer *)self->_activeLocationRequestTimer invalidate];
  proactiveRequestMonitor = self->_proactiveRequestMonitor;
  if (proactiveRequestMonitor) {
    (*(void (**)(void *))(*(void *)proactiveRequestMonitor + 8))(proactiveRequestMonitor);
  }
  self->_locationsDuringCrossValidation.__end_ = self->_locationsDuringCrossValidation.__begin_;

  v4.receiver = self;
  v4.super_class = (Class)CLSubHarvesterAvengerCrossValidation;
  [(CLSubHarvesterAvengerCrossValidation *)&v4 dealloc];
}

- (void)receiveLocation:(CLDaemonLocation *)a3
{
  unsigned int lifespan_low = LODWORD(a3->lifespan);
  if (self->isActiveVisit) {
    int v6 = 1;
  }
  else {
    int v6 = (*((uint64_t (**)(void))self->_settings._vptr$Settings + 16))();
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  v7 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    BOOL isRunningCrossValidation = self->isRunningCrossValidation;
    BOOL isRunningFinalCrossValidation = self->isRunningFinalCrossValidation;
    *(_DWORD *)buf = 68290306;
    int v49 = 0;
    __int16 v50 = 2082;
    v51 = "";
    __int16 v52 = 1026;
    *(_DWORD *)v53 = isRunningCrossValidation;
    *(_WORD *)&v53[4] = 1026;
    *(_DWORD *)&v53[6] = isRunningFinalCrossValidation;
    __int16 v54 = 1026;
    unsigned int v55 = (lifespan_low < 0xC) & (0xC02u >> lifespan_low);
    __int16 v56 = 1026;
    int v57 = v6;
    __int16 v58 = 2050;
    uint64_t v59 = 11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"receiveLocation\", \"isRunningCrossValidation\":%{public}hhd, \"isRunningFinalCrossValidation\":%{public}hhd, \"isHighAccuracyProviderFix\":%{public}hhd, \"isActiveVisitIfRequired\":%{public}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x34u);
  }
  if (self->isRunningCrossValidation)
  {
    end = self->_locationsDuringCrossValidation.__end_;
    value = self->_locationsDuringCrossValidation.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->_locationsDuringCrossValidation.__begin_;
      uint64_t v21 = 0x6F96F96F96F96F97 * (((char *)end - (char *)begin) >> 2);
      unint64_t v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) > 0x1A41A41A41A41A4) {
        sub_1001D7FD4();
      }
      unint64_t v23 = 0x6F96F96F96F96F97 * (((char *)value - (char *)begin) >> 2);
      if (2 * v23 > v22) {
        unint64_t v22 = 2 * v23;
      }
      if (v23 >= 0xD20D20D20D20D2) {
        unint64_t v24 = 0x1A41A41A41A41A4;
      }
      else {
        unint64_t v24 = v22;
      }
      if (v24) {
        v25 = (char *)sub_10050FC98((uint64_t)&self->_locationsDuringCrossValidation.__end_cap_, v24);
      }
      else {
        v25 = 0;
      }
      objc_super v26 = &v25[156 * v21];
      v27 = (CLDaemonLocation *)&v25[156 * v24];
      long long v28 = *(_OWORD *)&a3->coordinate.longitude;
      *(_OWORD *)objc_super v26 = *(_OWORD *)&a3->suitability;
      *((_OWORD *)v26 + 1) = v28;
      long long v29 = *(_OWORD *)&a3->altitude;
      long long v30 = *(_OWORD *)&a3->speed;
      long long v31 = *(_OWORD *)&a3->timestamp;
      *((_OWORD *)v26 + 4) = *(_OWORD *)&a3->course;
      *((_OWORD *)v26 + 5) = v31;
      *((_OWORD *)v26 + 2) = v29;
      *((_OWORD *)v26 + 3) = v30;
      long long v32 = *(_OWORD *)&a3->lifespan;
      $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
      long long v34 = *(_OWORD *)&a3->rawCourse;
      *(_OWORD *)(v26 + 140) = *(_OWORD *)&a3->integrity;
      *(($AB5116BA7E623E054F959CECB034F4E7 *)v26 + 7) = rawCoordinate;
      *((_OWORD *)v26 + 8) = v34;
      *((_OWORD *)v26 + 6) = v32;
      long long v19 = (CLDaemonLocation *)(v26 + 156);
      v35 = self->_locationsDuringCrossValidation.__end_;
      v36 = self->_locationsDuringCrossValidation.__begin_;
      if (v35 != v36)
      {
        do
        {
          long long v37 = *(_OWORD *)((char *)&v35[-1].coordinate.longitude + 4);
          *(_OWORD *)(v26 - 140) = *(_OWORD *)((char *)&v35[-1].altitude + 4);
          *(_OWORD *)(v26 - 156) = v37;
          long long v38 = *(_OWORD *)((char *)&v35[-1].speed + 4);
          long long v39 = *(_OWORD *)((char *)&v35[-1].course + 4);
          long long v40 = *(_OWORD *)((char *)&v35[-1].timestamp + 4);
          *(_OWORD *)(v26 - 76) = *(_OWORD *)((char *)&v35[-1].lifespan + 4);
          *(_OWORD *)(v26 - 92) = v40;
          *(_OWORD *)(v26 - 108) = v39;
          *(_OWORD *)(v26 - 124) = v38;
          long long v41 = *(long long *)((char *)&v35[-1].rawCoordinate + 4);
          long long v42 = *(_OWORD *)((char *)&v35[-1].rawCourse + 4);
          long long v43 = *(_OWORD *)&v35[-1].rawReferenceFrame;
          *((_OWORD *)v26 - 1) = *(_OWORD *)&v35[-1].ellipsoidalAltitude;
          *(_OWORD *)(v26 - 28) = v43;
          *(_OWORD *)(v26 - 44) = v42;
          *(_OWORD *)(v26 - 60) = v41;
          v26 -= 156;
          v35 = (CLDaemonLocation *)((char *)v35 - 156);
        }
        while (v35 != v36);
        v35 = self->_locationsDuringCrossValidation.__begin_;
      }
      self->_locationsDuringCrossValidation.__begin_ = (CLDaemonLocation *)v26;
      self->_locationsDuringCrossValidation.__end_ = v19;
      self->_locationsDuringCrossValidation.__end_cap_.__value_ = v27;
      if (v35) {
        operator delete(v35);
      }
    }
    else
    {
      long long v12 = *(_OWORD *)&a3->coordinate.longitude;
      *(_OWORD *)&end->suitability = *(_OWORD *)&a3->suitability;
      *(_OWORD *)&end->coordinate.longitude = v12;
      long long v13 = *(_OWORD *)&a3->altitude;
      long long v14 = *(_OWORD *)&a3->speed;
      long long v15 = *(_OWORD *)&a3->timestamp;
      *(_OWORD *)&end->course = *(_OWORD *)&a3->course;
      *(_OWORD *)&end->timestamp = v15;
      *(_OWORD *)&end->altitude = v13;
      *(_OWORD *)&end->speed = v14;
      long long v16 = *(_OWORD *)&a3->lifespan;
      $AB5116BA7E623E054F959CECB034F4E7 v17 = a3->rawCoordinate;
      long long v18 = *(_OWORD *)&a3->rawCourse;
      *(_OWORD *)&end->integrity = *(_OWORD *)&a3->integrity;
      end->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v17;
      *(_OWORD *)&end->rawCourse = v18;
      *(_OWORD *)&end->lifespan = v16;
      long long v19 = (CLDaemonLocation *)(&end->signalEnvironmentType + 1);
    }
    self->_locationsDuringCrossValidation.__end_ = v19;
  }
  if (!self->isRunningFinalCrossValidation
    && ((lifespan_low < 0xC) & (0xC02u >> lifespan_low)) != 0
    && ((v6 ^ 1) & 1) == 0)
  {
    sub_10131AE3C((uint64_t)self->_proactiveRequestMonitor);
    if (sub_10131AD84((uint64_t)self->_proactiveRequestMonitor))
    {
      if (!objc_opt_class()
        || (id v44 = +[MCProfileConnection sharedConnection],
            [v44 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed] == 1))
      {
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1022E8CC8);
        }
        v45 = qword_102419568;
        if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          int v49 = 0;
          __int16 v50 = 2082;
          v51 = "";
          __int16 v52 = 2050;
          *(void *)v53 = 11;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"cross validation enabled\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
        }
        *(_WORD *)&self->BOOL isRunningCrossValidation = 257;
        pairingManager = self->_pairingManager;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100B8754C;
        v47[3] = &unk_1022B7C20;
        v47[4] = self;
        [(SPPairingManager *)pairingManager setAlwaysBeaconWildState:1 completion:v47];
      }
    }
  }
}

- (BOOL)logCoreAnalytics:(id)a3
{
  return AnalyticsSendEventLazy();
}

- (BOOL)logFinalCoreAnalytics:(id)a3
{
  return AnalyticsSendEventLazy();
}

- (int64_t)getTimeOfDayForAnalytics
{
  v2 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") components:32 fromDate:+[NSDate now]];

  return [(NSDateComponents *)v2 hour];
}

- (void)terminateBeaconing
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289282;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    __int16 v10 = 2050;
    uint64_t v11 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"terminateBeaconing\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
  }
  [(CLTimer *)self->_crossValidationDurationTimer invalidate];
  [(CLTimer *)self->_periodicLocationRequestTimer invalidate];
  [(CLTimer *)self->_activeLocationRequestTimer invalidate];
  [(CLSubHarvesterAvengerCrossValidation *)self terminateActiveLocationRequest];
  self->isRunningInnerLoopOfCrossValidation = 0;
  self->BOOL isRunningCrossValidation = 0;
  self->_analytics.deltaFindMyDistance = 0.0;
  self->_analytics.deviceFound = 0;
  self->_analytics.baDispersion = 0.0;
  self->_analytics.baEstimatedHorizontalAccuracy = 0.0;
  self->_analytics.countBALocations = 0;
  *(double *)((char *)&self->_analytics.findMyEstimatedHorizontalAccuracy + 4) = 0.0;
  *(void *)&self->_analytics.deviceMotionState = 0;
  self->_analytics.truncatedDeviceLocationLatitude = 0.0;
  self->_analytics.truncatedDeviceLocationLongitude = 0.0;
  self->_analytics.timeToFindLatency = 0.0;
  self->_analytics.timeOfDay = 0;
  pairingManager = self->_pairingManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B880F0;
  v5[3] = &unk_1022B7C20;
  v5[4] = self;
  [(SPPairingManager *)pairingManager setAlwaysBeaconWildState:0 completion:v5];
}

- (void)terminateFinalCrossValidation
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    __int16 v8 = 2050;
    uint64_t v9 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"terminateFinalCrossValidation\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v5, 0x1Cu);
  }
  periodicBAQueryTimer = self->_periodicBAQueryTimer;
  if (periodicBAQueryTimer) {
    [(CLTimer *)periodicBAQueryTimer invalidate];
  }
  self->_finalAnalytics.deltaFindMyDistance = 0.0;
  self->_finalAnalytics.deviceFound = 0;
  self->_finalAnalytics.distanceAccuracyRatio = 0.0;
  self->_finalAnalytics.baDispersion = 0.0;
  self->_finalAnalytics.baEstimatedHorizontalAccuracy = 0.0;
  self->_finalAnalytics.countBALocations = 0;
  *(double *)((char *)&self->_finalAnalytics.findMyEstimatedHorizontalAccuracy + 4) = 0.0;
  *(void *)&self->_finalAnalytics.deviceMotionState = 0;
  self->_finalAnalytics.truncatedDeviceLocationLatitude = 0.0;
  self->_finalAnalytics.truncatedDeviceLocationLongitude = 0.0;
  self->_finalAnalytics.timeOfDay = 0;
  [(CLTimer *)self->_crossValidationFinalQueryTimer invalidate];
  self->_locationsDuringCrossValidation.__end_ = self->_locationsDuringCrossValidation.__begin_;
  self->BOOL isRunningFinalCrossValidation = 0;
  self->isLastDownload = 0;
  self->hasBeenFound = 0;
}

- (void)submitEmptyResult
{
  begin = self->_locationsDuringCrossValidation.__begin_;
  end = self->_locationsDuringCrossValidation.__end_;
  double v5 = -1.0;
  if (begin == end)
  {
    double v7 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      if (*(double *)((char *)&begin->courseAccuracy + 4) > 0.0)
      {
        double v6 = *(double *)(&begin->suitability + 1);
        double v7 = *(double *)((char *)&begin->coordinate.latitude + 4);
        double v5 = *(double *)((char *)&begin->coordinate.longitude + 4);
      }
      begin = (CLDaemonLocation *)((char *)begin + 156);
    }
    while (begin != end);
  }
  self->_analytics.deviceFound = 0;
  self->_analytics.deviceMotionState = CLMotionActivity::isMoving(&self->_recentMotionActivity);
  self->_analytics.findMyEstimatedHorizontalAccuracy = v5;
  self->_analytics.sigEnv = self->_recentSignalEnvironment;
  [(NSDate *)self->_startBeaconingDate timeIntervalSinceDate:+[NSDate now]];
  self->_analytics.timeToFindLatency = fabs(v8);
  self->_analytics.truncatedDeviceLocationLatitude = (double)(int)(v6 * 10.0) / 10.0;
  self->_analytics.truncatedDeviceLocationLongitude = (double)(int)(v7 * 10.0) / 10.0;
  self->_analytics.timeOfDay = [(CLSubHarvesterAvengerCrossValidation *)self getTimeOfDayForAnalytics];
  v9[0] = @"deviceFound";
  v10[0] = +[NSNumber numberWithBool:self->_analytics.deviceFound];
  v9[1] = @"deviceMotionState";
  v10[1] = +[NSNumber numberWithUnsignedInt:self->_analytics.deviceMotionState];
  v9[2] = @"findMyEstimatedHorizontalAccuracy";
  v10[2] = +[NSNumber numberWithDouble:self->_analytics.findMyEstimatedHorizontalAccuracy];
  v9[3] = @"sigEnv";
  v10[3] = +[NSNumber numberWithUnsignedInt:self->_analytics.sigEnv];
  v9[4] = @"timeToFindLatency";
  v10[4] = +[NSNumber numberWithDouble:self->_analytics.timeToFindLatency];
  v9[5] = @"truncatedDeviceLocationLatitude";
  v10[5] = +[NSNumber numberWithDouble:self->_analytics.truncatedDeviceLocationLatitude];
  v9[6] = @"truncatedDeviceLocationLongitude";
  v10[6] = +[NSNumber numberWithDouble:self->_analytics.truncatedDeviceLocationLongitude];
  v9[7] = @"isActiveVisit";
  v10[7] = +[NSNumber numberWithBool:self->isActiveVisit];
  v9[8] = @"timeOfDay";
  v10[8] = +[NSNumber numberWithUnsignedInt:self->_analytics.timeOfDay];
  [(CLSubHarvesterAvengerCrossValidation *)self logCoreAnalytics:+[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9]];
  [(CLSubHarvesterAvengerCrossValidation *)self terminateBeaconing];
}

- (void)submitEmptyFinalResult
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    int v4 = -1762037865
       * ((unint64_t)((char *)self->_locationsDuringCrossValidation.__end_
                           - (char *)self->_locationsDuringCrossValidation.__begin_) >> 2);
    uint64_t buf = 68289538;
    __int16 v14 = 2082;
    long long v15 = "";
    __int16 v16 = 1026;
    int v17 = v4;
    __int16 v18 = 2050;
    uint64_t v19 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"submitEmptyFinalResult\", \"device locations:count\":%{public}d, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x22u);
  }
  begin = self->_locationsDuringCrossValidation.__begin_;
  end = self->_locationsDuringCrossValidation.__end_;
  double v7 = -1.0;
  if (begin == end)
  {
    double v9 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      if (*(double *)((char *)&begin->courseAccuracy + 4) > 0.0)
      {
        double v8 = *(double *)(&begin->suitability + 1);
        double v9 = *(double *)((char *)&begin->coordinate.latitude + 4);
        double v7 = *(double *)((char *)&begin->coordinate.longitude + 4);
      }
      begin = (CLDaemonLocation *)((char *)begin + 156);
    }
    while (begin != end);
  }
  [(NSDate *)self->_recentLastPublishDate timeIntervalSinceDate:self->_startBeaconingDate];
  self->selfPublishTime = v10;
  self->_finalAnalytics.deviceFound = 0;
  self->_finalAnalytics.deviceMotionState = CLMotionActivity::isMoving(&self->_recentMotionActivity);
  self->_finalAnalytics.sigEnv = self->_recentSignalEnvironment;
  self->_finalAnalytics.findMyEstimatedHorizontalAccuracy = v7;
  self->_finalAnalytics.truncatedDeviceLocationLatitude = (double)(int)(v8 * 10.0) / 10.0;
  self->_finalAnalytics.truncatedDeviceLocationLongitude = (double)(int)(v9 * 10.0) / 10.0;
  self->_finalAnalytics.timeOfDay = [(CLSubHarvesterAvengerCrossValidation *)self getTimeOfDayForAnalytics];
  v12[0] = +[NSNumber numberWithBool:self->_finalAnalytics.deviceFound, @"deviceFound"];
  v11[1] = @"deviceMotionState";
  v12[1] = +[NSNumber numberWithUnsignedInt:self->_finalAnalytics.deviceMotionState];
  v11[2] = @"findMyEstimatedHorizontalAccuracy";
  v12[2] = +[NSNumber numberWithDouble:self->_finalAnalytics.findMyEstimatedHorizontalAccuracy];
  v11[3] = @"sigEnv";
  v12[3] = +[NSNumber numberWithUnsignedInt:self->_finalAnalytics.sigEnv];
  v11[4] = @"truncatedDeviceLocationLatitude";
  v12[4] = +[NSNumber numberWithDouble:self->_finalAnalytics.truncatedDeviceLocationLatitude];
  v11[5] = @"truncatedDeviceLocationLongitude";
  v12[5] = +[NSNumber numberWithDouble:self->_finalAnalytics.truncatedDeviceLocationLongitude];
  v11[6] = @"isActiveVisit";
  v12[6] = +[NSNumber numberWithBool:self->isActiveVisit];
  v11[7] = @"timeOfDay";
  v12[7] = +[NSNumber numberWithUnsignedInt:self->_finalAnalytics.timeOfDay];
  v11[8] = @"deviceBeenFound";
  v12[8] = +[NSNumber numberWithBool:self->hasBeenFound];
  v11[9] = @"selfPublishTime";
  v12[9] = +[NSNumber numberWithDouble:self->selfPublishTime];
  v11[10] = @"selfPublishTimeBounded";
  v12[10] = +[NSNumber numberWithInt:[(CLSubHarvesterAvengerCrossValidation *)self binTimeInterval:self->selfPublishTime]];
  [(CLSubHarvesterAvengerCrossValidation *)self logFinalCoreAnalytics:+[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:11]];
  [(CLSubHarvesterAvengerCrossValidation *)self terminateFinalCrossValidation];
}

- (void)receiveMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_recentMotionActivity.type = *(_OWORD *)&a3->type;
  long long v12 = *(_OWORD *)&a3->mountedConfidence;
  long long v13 = *(_OWORD *)&a3->isStanding;
  long long v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_recentMotionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_recentMotionActivity.vehicleType = v14;
  *(_OWORD *)&self->_recentMotionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_recentMotionActivity.isStanding = v13;
  long long v15 = *(_OWORD *)&a3[1].type;
  long long v16 = *(_OWORD *)&a3[1].mountedConfidence;
  long long v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_c0[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_c0[16] = v16;
  *(_OWORD *)&self->_anon_c0[32] = v17;
  *(_OWORD *)self->_anon_c0 = v15;
}

- (void)receiveSignalEnvironment:(int)a3
{
  self->_recentSignalEnvironment = a3;
}

- (id)convertLocationResult:(id)a3
{
  double v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  double v6 = [(NSDate *)self->_startBeaconingDate dateByAddingTimeInterval:-600.0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v11 latitude];
        uint64_t v13 = v12;
        [v11 longitude];
        uint64_t v15 = v14;
        [objc_msgSend(v11, "timestamp") timeIntervalSinceReferenceDate];
        uint64_t v17 = v16;
        [v11 horizontalAccuracy];
        uint64_t v19 = v18;
        if (objc_msgSend(objc_msgSend(v11, "timestamp"), "compare:", v6) != (id)-1)
        {
          id v20 = objc_alloc((Class)CLLocation);
          uint64_t v23 = v13;
          uint64_t v24 = v15;
          uint64_t v25 = v19;
          uint64_t v26 = v17;
          -[NSMutableArray addObject:](v5, "addObject:", [v20 initWithClientLocation:v22]);
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  return v5;
}

- (float64x2_t)rotateWithAxis:(float64x2_t *)a3@<X8> angle:(double)a4@<D0> originVector:
{
  float64x2_t v18 = *a1;
  float64x2_t v19 = a1[1];
  float64x2_t v21 = a2[1];
  float64x2_t v20 = *a2;
  __double2 v6 = __sincos_stret(a4 * 3.14159265 / 180.0 * 0.5);
  v5.f64[0] = v6.__sinval;
  float64x2_t v7 = vmulq_n_f64(v18, v6.__sinval);
  *(void *)&v5.f64[0] = *(_OWORD *)&vmulq_f64(v5, v19);
  v8.f64[0] = v5.f64[0];
  v8.f64[1] = v6.__cosval;
  float64x2_t v9 = vmulq_f64(v8, (float64x2_t)xmmword_101D82640);
  int8x16_t v10 = (int8x16_t)vnegq_f64(v7);
  float64x2_t v11 = (float64x2_t)vextq_s8((int8x16_t)v9, (int8x16_t)vnegq_f64(v9), 8uLL);
  float64x2_t v12 = vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v7, v20, 1), (float64x2_t)vextq_s8(v10, (int8x16_t)v7, 8uLL), v20.f64[0]), v11, v21.f64[0]);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v9, v20, 1), v11, v20.f64[0]), (float64x2_t)vextq_s8((int8x16_t)v7, v10, 8uLL), v21.f64[0]);
  float64x2_t v14 = vnegq_f64(v13);
  float64x2_t v15 = (float64x2_t)vextq_s8((int8x16_t)v12, (int8x16_t)vnegq_f64(v12), 8uLL);
  float64x2_t v16 = vmlaq_n_f64(vmulq_n_f64(v12, v6.__cosval), v15, v5.f64[0]);
  float64x2_t result = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v13, v6.__cosval), (float64x2_t)vextq_s8((int8x16_t)v14, (int8x16_t)v13, 8uLL), v5.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v12, v7, 1), v15, v7.f64[0]));
  *a3 = result;
  a3[1] = vaddq_f64(v16, vmlaq_n_f64(vmulq_laneq_f64(v14, v7, 1), (float64x2_t)vextq_s8((int8x16_t)v13, (int8x16_t)v14, 8uLL), v7.f64[0]));
  return result;
}

- (id)shiftLocation:(id)a3 referenceLocation:(CLDaemonLocation *)a4 latitudeShift:(double)a5 longitudeShift:(double)a6 directionShift:(double)a7
{
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  float64_t v49 = 0.0;
  float64_t v50 = 0.0;
  float64_t v47 = 0.0;
  float64_t v48 = 0.0;
  CLLocationDegrees v45 = 0.0;
  double v46 = 0.0;
  uint64_t v44 = 0;
  [a3 coordinate];
  double v14 = v13;
  [a3 coordinate];
  long double v15 = 0.0;
  sub_1005D7C04((double *)&v52, (double *)&v51, &v50, v14, v16, 0.0);
  sub_1005D7C04(&v49, &v48, &v47, *(double *)(&a4->suitability + 1), *(double *)((char *)&a4->coordinate.latitude + 4), 0.0);
  if (self)
  {
    v18.f64[0] = v49;
    v18.f64[1] = v48;
    v17.f64[0] = v47;
    float64x2_t v19 = vmulq_f64(v17, v17);
    v19.f64[0] = 1.0 / sqrt(v19.f64[0] + vaddvq_f64(vmulq_f64(v18, v18)));
    float64x2_t v20 = vmulq_n_f64(v18, v19.f64[0]);
    float64x2_t v21 = vmulq_f64(v17, v19);
    v19.f64[0] = v50;
    *(void *)&long long v22 = v52;
    *((void *)&v22 + 1) = v51;
    v43[0] = v20;
    v43[1] = v21;
    v42[0] = v22;
    v42[1] = v19;
    [(CLSubHarvesterAvengerCrossValidation *)self rotateWithAxis:v43 angle:v42 originVector:a7];
    v38[0] = 0;
    v38[1] = 0;
    __asm { FMOV            V2.2D, #1.0 }
    long long v39 = _Q2;
    v37[0] = v43[2];
    v37[1] = v43[3];
    [(CLSubHarvesterAvengerCrossValidation *)self rotateWithAxis:v38 angle:v37 originVector:a6];
    v35[0] = xmmword_101D82650;
    v35[1] = 0u;
    v34[0] = v40;
    v34[1] = v41;
    [(CLSubHarvesterAvengerCrossValidation *)self rotateWithAxis:v35 angle:v34 originVector:a5];
    int8x16_t v28 = (int8x16_t)v35[2];
    *(void *)&long double v29 = vextq_s8(v28, v28, 8uLL).u64[0];
    long double v15 = v36;
  }
  else
  {
    v28.i64[0] = 0;
    long double v29 = 0.0;
  }
  sub_1005D7CC4(&v46, (long double *)&v45, (double *)&v44, *(long double *)v28.i64, v29, v15);
  CLLocationCoordinate2D v30 = CLLocationCoordinate2DMake(fabs(v46), v45);
  id v31 = objc_alloc((Class)CLLocation);
  [a3 horizontalAccuracy];
  return [v31 initWithCoordinate:objc_msgSend(a3, "timestamp") altitude:v30.latitude horizontalAccuracy:v30.longitude verticalAccuracy:0.0 timestamp:v32];
}

- (id)collectLocationData:(id)a3 outputLocation:(id)a4 deviceLocation:(CLDaemonLocation *)a5
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  float64x2_t v8 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 68289282;
    __int16 v72 = 2082;
    v73 = "";
    __int16 v74 = 2050;
    uint64_t v75 = 11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"collectLocationData\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
  }
  float64x2_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  int8x16_t v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  int v57 = self;
  float64x2_t v11 = [(NSDate *)self->_startBeaconingDate dateByAddingTimeInterval:-600.0];
  id v58 = +[NSMutableDictionary dictionary];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v12 = [a3 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v66;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(a3);
        }
        double v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v16, "timestamp"), "compare:", v11) != (id)-1)
        {
          [(NSMutableArray *)v9 addObject:v16];
          -[NSMutableArray addObject:](v10, "addObject:", [v16 hashedPublicKey]);
        }
      }
      id v13 = [a3 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v13);
  }
  id v17 = [(NSMutableArray *)v10 valueForKeyPath:@"@distinctUnionOfObjects.self"];
  v69 = +[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:1];
  [(NSMutableArray *)v9 sortUsingDescriptors:+[NSArray arrayWithObjects:&v69 count:1]];
  id v18 = [[-[NSMutableArray firstObject](v9, "firstObject") timestamp];
  float64x2_t v19 = v57;
  [(CLSubHarvesterAvengerCrossValidation *)v57 randomDoubleWithMin:-5.0 max:5.0];
  double v21 = v20;
  [(CLSubHarvesterAvengerCrossValidation *)v57 randomDoubleWithMin:-180.0 max:180.0];
  double v23 = v22;
  [(CLSubHarvesterAvengerCrossValidation *)v57 randomDoubleWithMin:-180.0 max:180.0];
  double v25 = v24;
  if ([(NSMutableArray *)v9 count])
  {
    unint64_t v26 = 0;
    do
    {
      unint64_t v27 = v26 + 1;
      int8x16_t v28 = +[NSString stringWithFormat:@"input%ld", v26 + 1];
      id v29 = [(NSMutableArray *)v9 objectAtIndex:v26];
      [v29 latitude];
      CLLocationDegrees v31 = v30;
      [v29 longitude];
      CLLocationCoordinate2D v33 = CLLocationCoordinate2DMake(v31, v32);
      id v34 = objc_alloc((Class)CLLocation);
      [v29 horizontalAccuracy];
      id v36 = [v34 initWithCoordinate:objc_msgSend(v29, "timestamp") altitude:v33.latitude horizontalAccuracy:v33.longitude verticalAccuracy:0.0 timestamp:v35];
      $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a5->rawCoordinate;
      v63[6] = *(_OWORD *)&a5->lifespan;
      v63[7] = rawCoordinate;
      v64[0] = *(_OWORD *)&a5->rawCourse;
      *(_OWORD *)((char *)v64 + 12) = *(_OWORD *)&a5->integrity;
      long long v38 = *(_OWORD *)&a5->speed;
      v63[2] = *(_OWORD *)&a5->altitude;
      v63[3] = v38;
      long long v39 = *(_OWORD *)&a5->timestamp;
      v63[4] = *(_OWORD *)&a5->course;
      v63[5] = v39;
      long long v40 = *(_OWORD *)&a5->coordinate.longitude;
      v63[0] = *(_OWORD *)&a5->suitability;
      v63[1] = v40;
      id v41 = [(CLSubHarvesterAvengerCrossValidation *)v19 shiftLocation:v36 referenceLocation:v63 latitudeShift:v21 longitudeShift:v23 directionShift:v25];
      float64x2_t v19 = v57;
      [v58 setObject:-[CLSubHarvesterAvengerCrossValidation covertLocationToString:withFirstLocationTimeStamp:withPublicKey:](v57, "covertLocationToString:withFirstLocationTimeStamp:withPublicKey:", v41, v18, -[NSNumber stringValue](+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_msgSend(v29, "hashedPublicKey"))), "stringValue"), v28);
      id v42 = [(NSMutableArray *)v9 count];
      if (v26 > 0x12) {
        break;
      }
      ++v26;
    }
    while (v27 < (unint64_t)v42);
  }
  $AB5116BA7E623E054F959CECB034F4E7 v43 = a5->rawCoordinate;
  v61[6] = *(_OWORD *)&a5->lifespan;
  v61[7] = v43;
  v62[0] = *(_OWORD *)&a5->rawCourse;
  *(_OWORD *)((char *)v62 + 12) = *(_OWORD *)&a5->integrity;
  long long v44 = *(_OWORD *)&a5->speed;
  v61[2] = *(_OWORD *)&a5->altitude;
  v61[3] = v44;
  long long v45 = *(_OWORD *)&a5->timestamp;
  v61[4] = *(_OWORD *)&a5->course;
  v61[5] = v45;
  long long v46 = *(_OWORD *)&a5->coordinate.longitude;
  v61[0] = *(_OWORD *)&a5->suitability;
  v61[1] = v46;
  id v47 = [(CLSubHarvesterAvengerCrossValidation *)v19 shiftLocation:a4 referenceLocation:v61 latitudeShift:v21 longitudeShift:v23 directionShift:v25];
  [v47 coordinate];
  if (v48 > 65.0) {
    return +[NSMutableDictionary dictionary];
  }
  [v58 setObject: -[CLSubHarvesterAvengerCrossValidation covertLocationToString:withFirstLocationTimeStamp:withPublicKey:](v19, "covertLocationToString:withFirstLocationTimeStamp:withPublicKey:", v47, v18, 0) forKeyedSubscript:@"output"];
  CLLocationCoordinate2D v49 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(&a5->suitability + 1), *(CLLocationDegrees *)((char *)&a5->coordinate.latitude + 4));
  id v50 = [objc_alloc((Class)CLLocation) initWithCoordinate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&a5->courseAccuracy + 4)), v49.latitude, v49.longitude, 0.0, *(double *)((char *)&a5->coordinate.longitude + 4), -1.0];
  $AB5116BA7E623E054F959CECB034F4E7 v51 = a5->rawCoordinate;
  v59[6] = *(_OWORD *)&a5->lifespan;
  v59[7] = v51;
  v60[0] = *(_OWORD *)&a5->rawCourse;
  *(_OWORD *)((char *)v60 + 12) = *(_OWORD *)&a5->integrity;
  long long v52 = *(_OWORD *)&a5->speed;
  v59[2] = *(_OWORD *)&a5->altitude;
  v59[3] = v52;
  long long v53 = *(_OWORD *)&a5->timestamp;
  v59[4] = *(_OWORD *)&a5->course;
  v59[5] = v53;
  long long v54 = *(_OWORD *)&a5->coordinate.longitude;
  v59[0] = *(_OWORD *)&a5->suitability;
  v59[1] = v54;
  [v58 setObject: -[CLSubHarvesterAvengerCrossValidation covertLocationToString:withFirstLocationTimeStamp:withPublicKey:](v19, "covertLocationToString:withFirstLocationTimeStamp:withPublicKey:", -[CLSubHarvesterAvengerCrossValidation shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:](v19, "shiftLocation:referenceLocation:latitudeShift:longitudeShift:directionShift:", v50, v59, v21, v23, v25), v18, 0) forKeyedSubscript:@"deviceLocation"];
  return v58;
}

- (double)calculateDispersion:(id)a3
{
  uint64_t v7 = 0;
  float64x2_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if ((unint64_t)[a3 count] >= 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B895D0;
    v6[3] = &unk_1022E8B98;
    v6[4] = a3;
    v6[5] = &v7;
    [a3 enumerateObjectsUsingBlock:v6];
  }
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)covertLocationToString:(id)a3 withFirstLocationTimeStamp:(id)a4 withPublicKey:(id)a5
{
  [a3 coordinate];
  uint64_t v9 = v8;
  [a3 coordinate];
  uint64_t v11 = v10;
  [a3 horizontalAccuracy];
  uint64_t v13 = v12;
  [objc_msgSend(a3, "timestamp") timeIntervalSinceDate:a4];
  if (a5) {
    return +[NSString stringWithFormat:@"(%@, <%.6lf, %.6lf> +/- %.2lf) @%.2lf", a5, v9, v11, v13, v14];
  }
  else {
    return +[NSString stringWithFormat:@"(<%.6lf, %.6lf> +/- %.2lf) @%.2lf", v9, v11, v13, v14, v16];
  }
}

- (CLDaemonLocation)findNearestDeviceLocationWithBALocationTime:(SEL)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  retstr->suitability = 0xFFFF;
  *(double *)((char *)&retstr->coordinate.latitude + 4) = 0.0;
  *(void *)(&retstr->suitability + 1) = 0;
  *(_OWORD *)((char *)&retstr->coordinate.longitude + 4) = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)&retstr->altitude + 4) = _Q0;
  *(_OWORD *)((char *)&retstr->speed + 4) = _Q0;
  *(_OWORD *)((char *)&retstr->course + 4) = _Q0;
  HIDWORD(retstr->timestamp) = 0;
  retstr->lifespan = 0.0;
  *(void *)&retstr->type = 0;
  *(void *)&retstr->confidence = 0xBFF0000000000000;
  LODWORD(retstr->rawCoordinate.latitude) = 0;
  *(double *)((char *)&retstr->rawCoordinate.latitude + 4) = -1.0;
  HIDWORD(retstr->rawCoordinate.longitude) = 0x7FFFFFFF;
  *(void *)&retstr->floor = 0;
  *(void *)&retstr->referenceFrame = 0;
  retstr->rawCourse = 0.0;
  LOBYTE(retstr->signalEnvironmentType) = 0;
  begin = self->_locationsDuringCrossValidation.__begin_;
  end = self->_locationsDuringCrossValidation.__end_;
  double v14 = 1.79769313e308;
  while (begin != end)
  {
    double v15 = *(double *)((char *)&begin->courseAccuracy + 4);
    [a4 timeIntervalSinceReferenceDate];
    double v17 = vabdd_f64(v15, v16);
    if (v17 < v14)
    {
      $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = begin->rawCoordinate;
      *(_OWORD *)&retstr->lifespan = *(_OWORD *)&begin->lifespan;
      retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = rawCoordinate;
      *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&begin->rawCourse;
      *(_OWORD *)&retstr->integrity = *(_OWORD *)&begin->integrity;
      long long v19 = *(_OWORD *)&begin->speed;
      *(_OWORD *)&retstr->altitude = *(_OWORD *)&begin->altitude;
      *(_OWORD *)&retstr->speed = v19;
      long long v20 = *(_OWORD *)&begin->timestamp;
      *(_OWORD *)&retstr->course = *(_OWORD *)&begin->course;
      *(_OWORD *)&retstr->timestamp = v20;
      long long v21 = *(_OWORD *)&begin->coordinate.longitude;
      double v14 = v17;
      *(_OWORD *)&retstr->suitability = *(_OWORD *)&begin->suitability;
      *(_OWORD *)&retstr->coordinate.longitude = v21;
    }
    begin = (CLDaemonLocation *)((char *)begin + 156);
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  double v22 = qword_102419568;
  float64x2_t result = (CLDaemonLocation *)os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO);
  if (result)
  {
    int v24 = (int)*(double *)(&retstr->suitability + 1);
    int v25 = (int)*(double *)((char *)&retstr->coordinate.latitude + 4);
    int v26 = (int)*(double *)((char *)&retstr->coordinate.longitude + 4);
    v27[0] = 68290307;
    v27[1] = 0;
    __int16 v28 = 2082;
    id v29 = "";
    __int16 v30 = 1025;
    int v31 = v24;
    __int16 v32 = 1025;
    int v33 = v25;
    __int16 v34 = 1025;
    int v35 = v26;
    __int16 v36 = 1025;
    int v37 = (int)v14;
    __int16 v38 = 2050;
    uint64_t v39 = 11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"find nearest location\", \"lat\":%{private}d, \"lng\":%{private}d, \"ucc\":%{private}d, \"time interval\":%{private}d, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v27, 0x34u);
  }
  return result;
}

- (id)getDeviceLocationsWithinBeaconingInterval
{
  [(CLIntersiloUniverse *)self->_universe silo];
  id v3 = +[NSMutableArray array];
  begin = self->_locationsDuringCrossValidation.__begin_;
  for (i = self->_locationsDuringCrossValidation.__end_; begin != i; begin = (CLDaemonLocation *)((char *)begin + 156))
  {
    [+[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)((char *)&begin->courseAccuracy + 4)] timeIntervalSinceDate:self->_startBeaconingDate];
    if (v6 < (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 13))(&self->_settings))
    {
      CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(&begin->suitability + 1), *(CLLocationDegrees *)((char *)&begin->coordinate.latitude + 4));
      [v3 addObject:[objc_alloc((Class)CLLocation) initWithCoordinate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&begin->courseAccuracy + 4)), v7.latitude, v7.longitude, 0.0, *(double *)((char *)&begin->coordinate.longitude + 4), -1.0]];
    }
  }
  return v3;
}

- (void)processAvengerLocations:(id)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  float64x2_t v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = [a3 count];
    int v7 = -1762037865
       * ((unint64_t)((char *)self->_locationsDuringCrossValidation.__end_
                           - (char *)self->_locationsDuringCrossValidation.__begin_) >> 2);
    BOOL isLastDownload = self->isLastDownload;
    *(_DWORD *)uint64_t buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v28) = 2082;
    *(void *)((char *)&v28 + 2) = "";
    WORD5(v28) = 1026;
    HIDWORD(v28) = v6;
    LOWORD(v29) = 1026;
    *(_DWORD *)((char *)&v29 + 2) = v7;
    HIWORD(v29) = 1026;
    LODWORD(v30) = isLastDownload;
    WORD2(v30) = 2050;
    *(void *)((char *)&v30 + 6) = 11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"completed cross validation cycle\", \"ba raw locations:count\":%{public}d, \"device locations:count\":%{public}d, \"isLastDownload\":%{public}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x2Eu);
  }
  self->isRunningInnerLoopOfCrossValidation = 0;
  if ([a3 count])
  {
    id v9 = [(CLSubHarvesterAvengerCrossValidation *)self convertLocationResult:a3];
    CLLocationCoordinate2D v49 = +[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:1];
    [v9 sortUsingDescriptors:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1)];
    id v10 = +[CLReductiveFilterSuite applyFilterToLocationObservations:options:](CLReductiveFilterSuite, "applyFilterToLocationObservations:options:", v9, [objc_alloc((Class)CLReductiveFilterOptions) initWithBeaconType:2 transmitPower:10.0]);
    id v11 = [v9 firstObject];
    double v12 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 33))(&self->_settings);
    id v13 = objc_alloc((Class)RTEstimatedLocationOptions);
    id v14 = [v13 initWithAverageSpeed:1 enableFallbackModel:kRTEstimatedLocationAverageSpeedUnknown timeInterval:v12];
    *(void *)uint64_t buf = 0;
    *(void *)&long long v28 = buf;
    *((void *)&v28 + 1) = 0xD012000000;
    id v29 = sub_100177D18;
    *(void *)&long long v30 = nullsub_56;
    *((void *)&v30 + 1) = 0;
    uint64_t v33 = 0;
    uint64_t v32 = 0;
    long long v34 = xmmword_101D1C320;
    __asm { FMOV            V0.2D, #-1.0 }
    long long v35 = _Q0;
    long long v36 = _Q0;
    long long v37 = _Q0;
    int v31 = 0xFFFF;
    int v38 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    unint64_t v39 = 0xBFF0000000000000;
    unint64_t v43 = 0xBFF0000000000000;
    int v42 = 0;
    int v44 = 0x7FFFFFFF;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    char v48 = 0;
    uint64_t v47 = 0;
    long long v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    finderManager = self->_finderManager;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100B89F34;
    v26[3] = &unk_1022E8BC0;
    v26[4] = self;
    v26[5] = v20;
    [(SPFinderStateManager *)finderManager stateInfoWithCompletion:v26];
    dispatch_group_enter(v20);
    ptr = self->_external.__ptr_;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100B8A248;
    v25[3] = &unk_1022E8BE8;
    v25[4] = v20;
    v25[5] = buf;
    (*(void (**)(External *, id, id, void *))(*(void *)ptr + 208))(ptr, [v10 timestamp], v14, v25);
    double v23 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B8A3E8;
    block[3] = &unk_1022E8C10;
    block[9] = a3;
    block[10] = buf;
    block[4] = v20;
    block[5] = self;
    block[6] = v10;
    block[7] = v9;
    block[8] = v11;
    dispatch_group_notify(v20, v23, block);
    _Block_object_dispose(buf, 8);
  }
  else if (self->isLastDownload)
  {
    [(CLSubHarvesterAvengerCrossValidation *)self submitEmptyFinalResult];
  }
}

- (void)queryForBAResult
{
  pairingManager = self->_pairingManager;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B8B2BC;
  v3[3] = &unk_1022E8C88;
  v3[4] = self;
  [(SPPairingManager *)pairingManager getLocalPairingDataWithCompletion:v3];
}

- (void)retrieveOwnerLocationsDuringValidationPeriod:(id)a3 completion:(id)a4
{
  int v7 = +[NSDate date];
  if ([(NSDate *)self->_startBeaconingDate compare:v7] == NSOrderedAscending)
  {
    id v8 = [objc_alloc((Class)NSDateInterval) initWithStartDate:self->_startBeaconingDate endDate:v7];
    ownerSession = self->_ownerSession;
    [(SPOwnerSessionPrivateProtocol *)ownerSession rawSearchResultsForBeacon:a3 dateInterval:v8 completion:a4];
  }
}

- (void)receiveCLVisit:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022E8CC8);
  }
  float64x2_t v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 68289539;
    int v8 = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 1025;
    LODWORD(v12[0]) = [a3 hasDepartureDate];
    WORD2(v12[0]) = 2050;
    *(void *)((char *)v12 + 6) = 11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"cross validation got receiveCLVisit\", \"hasDepartureDate\":%{private}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v7, 0x22u);
  }
  if ([a3 hasDepartureDate])
  {
    self->isActiveVisit = 0;
    if (self->isRunningCrossValidation)
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022E8CC8);
      }
      unsigned int v6 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
      {
        int v7 = 68289282;
        int v8 = 0;
        __int16 v9 = 2082;
        id v10 = "";
        __int16 v11 = 2050;
        v12[0] = 11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"terminating cross validation on visit departure\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v7, 0x1Cu);
      }
      [(CLSubHarvesterAvengerCrossValidation *)self terminateBeaconing];
      [(CLSubHarvesterAvengerCrossValidation *)self terminateFinalCrossValidation];
    }
  }
  else
  {
    self->isActiveVisit = 1;
  }
}

- (int)binLocationAge:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  if (a3 <= 60.0) {
    return 60;
  }
  if (a3 <= 120.0) {
    return 120;
  }
  if (a3 <= 300.0) {
    return 300;
  }
  if (a3 <= 480.0) {
    return 480;
  }
  if (a3 <= 600.0) {
    return 600;
  }
  if (a3 <= 900.0) {
    return 900;
  }
  if (a3 <= 1200.0) {
    return 1200;
  }
  if (a3 <= 1500.0) {
    return 1500;
  }
  if (a3 <= 1800.0) {
    return 1800;
  }
  if (a3 <= 2100.0) {
    return 2100;
  }
  if (a3 <= 2400.0) {
    return 2400;
  }
  if (a3 <= 2700.0) {
    return 2700;
  }
  if (a3 <= 3000.0) {
    return 3000;
  }
  if (a3 <= 3300.0) {
    return 3300;
  }
  if (a3 <= 3600.0) {
    return 3600;
  }
  if (a3 <= 3900.0) {
    return 3900;
  }
  if (a3 <= 4200.0) {
    return 4200;
  }
  if (a3 <= 4800.0) {
    return 4800;
  }
  if (a3 <= 5400.0) {
    return 5400;
  }
  return 6000;
}

- (int)binTimeInterval:(double)a3
{
  if (a3 <= -600.0) {
    return -600;
  }
  if (a3 <= -300.0) {
    return -300;
  }
  if (a3 <= -45.0) {
    return -45;
  }
  if (a3 <= 0.0) {
    return 0;
  }
  if (a3 <= 60.0) {
    return 60;
  }
  if (a3 <= 120.0) {
    return 120;
  }
  if (a3 <= 300.0) {
    return 300;
  }
  if (a3 <= 600.0) {
    return 600;
  }
  if (a3 <= 900.0) {
    return 900;
  }
  if (a3 <= 1200.0) {
    return 1200;
  }
  if (a3 <= 1500.0) {
    return 1500;
  }
  if (a3 <= 1800.0) {
    return 1800;
  }
  if (a3 <= 2100.0) {
    return 2100;
  }
  if (a3 <= 2400.0) {
    return 2400;
  }
  if (a3 <= 2700.0) {
    return 2700;
  }
  if (a3 <= 3000.0) {
    return 3000;
  }
  if (a3 <= 3300.0) {
    return 3300;
  }
  if (a3 <= 3600.0) {
    return 3600;
  }
  if (a3 <= 4200.0) {
    return 4200;
  }
  if (a3 <= 4800.0) {
    return 4800;
  }
  return 5000;
}

- (int)binRatio:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  if (a3 <= 25.0) {
    return 25;
  }
  if (a3 <= 50.0) {
    return 50;
  }
  if (a3 <= 75.0) {
    return 75;
  }
  if (a3 <= 100.0) {
    return 100;
  }
  if (a3 <= 125.0) {
    return 125;
  }
  if (a3 <= 150.0) {
    return 150;
  }
  if (a3 <= 175.0) {
    return 175;
  }
  if (a3 <= 200.0) {
    return 200;
  }
  if (a3 <= 300.0) {
    return 300;
  }
  if (a3 <= 400.0) {
    return 400;
  }
  if (a3 <= 500.0) {
    return 500;
  }
  if (a3 <= 600.0) {
    return 600;
  }
  if (a3 <= 700.0) {
    return 700;
  }
  if (a3 <= 800.0) {
    return 800;
  }
  if (a3 <= 900.0) {
    return 900;
  }
  if (a3 <= 1000.0) {
    return 1000;
  }
  return 2000;
}

- (int)binAccuracy:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  if (a3 <= 5.0) {
    return 5;
  }
  if (a3 <= 10.0) {
    return 10;
  }
  if (a3 <= 15.0) {
    return 15;
  }
  if (a3 <= 25.0) {
    return 25;
  }
  if (a3 <= 50.0) {
    return 50;
  }
  if (a3 <= 75.0) {
    return 75;
  }
  if (a3 <= 100.0) {
    return 100;
  }
  if (a3 <= 125.0) {
    return 125;
  }
  if (a3 <= 250.0) {
    return 250;
  }
  if (a3 <= 500.0) {
    return 500;
  }
  if (a3 <= 750.0) {
    return 750;
  }
  if (a3 <= 1000.0) {
    return 1000;
  }
  if (a3 <= 5000.0) {
    return 5000;
  }
  if (a3 <= 10000.0) {
    return 10000;
  }
  return 20000;
}

- (double)randomDoubleWithMin:(double)a3 max:(double)a4
{
  return a3 + (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * (a4 - a3);
}

- (void)setRecentLastPublishDate:(id)a3
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (![(NSDate *)self->_recentLastPublishDate isEqualToDate:a3])
  {
    recentLastPublishDate = self->_recentLastPublishDate;
    self->_recentLastPublishDate = (NSDate *)[a3 copy];
  }
}

- (void).cxx_destruct
{
  cntrl = self->_external.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  begin = self->_locationsDuringCrossValidation.__begin_;
  if (begin)
  {
    self->_locationsDuringCrossValidation.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 43) = 0;
  *((unsigned char *)self + 352) = 0;
  *((void *)self + 40) = 0;
  *((void *)self + 41) = 0;
  *((_DWORD *)self + 84) = 0;
  *(void *)((char *)self + 364) = 0;
  *(void *)((char *)self + 356) = 0;
  *((void *)self + 48) = 0;
  *((void *)self + 49) = 0;
  *((void *)self + 47) = 0;
  *((_DWORD *)self + 100) = 0;
  *((void *)self + 54) = 0;
  *((unsigned char *)self + 440) = 0;
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((_DWORD *)self + 106) = 0;
  *(void *)((char *)self + 452) = 0;
  *(void *)((char *)self + 444) = 0;
  *((void *)self + 58) = 0;
  *((void *)self + 59) = 0;
  *((_DWORD *)self + 120) = 0;
  *((void *)self + 61) = 0;
  *((void *)self + 62) = off_10231B370;
  *((void *)self + 63) = 0x4046800000000000;
  *((_OWORD *)self + 32) = xmmword_101D82660;
  *((void *)self + 66) = 0x400A666666666666;
  *((void *)self + 67) = 0x12000001F4;
  *((_DWORD *)self + 136) = 72;
  *((void *)self + 69) = 0x40CC200000000000;
  *((unsigned char *)self + 560) = 1;
  *((_DWORD *)self + 141) = 1;
  *((void *)self + 71) = 0x40F5180000000000;
  *((_OWORD *)self + 36) = xmmword_101D82670;
  *((_OWORD *)self + 37) = xmmword_101D82680;
  *((unsigned char *)self + 608) = 0;
  *((void *)self + 77) = 0x404E000000000000;
  *((void *)self + 78) = 0x40F5180000000000;
  *((_DWORD *)self + 158) = 1;
  *((_OWORD *)self + 40) = xmmword_101D82690;
  *((_OWORD *)self + 41) = xmmword_101D826A0;
  *((_OWORD *)self + 42) = xmmword_101D826B0;
  *((_OWORD *)self + 43) = xmmword_101D826C0;
  *((_OWORD *)self + 44) = xmmword_101D826D0;
  *((_DWORD *)self + 180) = 4;
  *((void *)self + 91) = 0x3FECCCCCCCCCCCCDLL;
  *((void *)self + 98) = 0;
  *((_OWORD *)self + 47) = 0u;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 46) = xmmword_101D826E0;
  return self;
}

@end