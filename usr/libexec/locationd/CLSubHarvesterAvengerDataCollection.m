@interface CLSubHarvesterAvengerDataCollection
- (BOOL)isEqualToTargetAdv:(id)a3;
- (id).cxx_construct;
- (id)buildEvent;
- (id)buildEventWithAdvWithFirstTimeStamp:(id)a3;
- (id)buildEventWithLocationWithFirstTimeStamp:(id)a3;
- (id)buildEventWithMotionWithFirstTimeStamp:(id)a3;
- (id)getAdvType:(id)a3;
- (id)initInUniverse:(id)a3 withSettings:(CLSubHarvesterAvengerSettings *)a4;
- (int64_t)getTimeOfDayForAnalytics;
- (void)dealloc;
- (void)identifyTargetAdv:(id)a3;
- (void)pruneLocationCacheAfterAdv;
- (void)pruneLocationCacheBeforeAdv;
- (void)pruneMotionCacheAfterAdv;
- (void)pruneMotionCacheBeforeAdv;
- (void)receiveAdvertisement:(id)a3;
- (void)receiveBeaconPayload:(id)a3;
- (void)receiveLocation:(CLDaemonLocation *)a3;
- (void)receiveMotionActivity:(CLMotionActivity *)a3;
- (void)receiveSignalEnvironment:(int)a3;
- (void)startDataCollection;
- (void)stopDataCollection;
- (void)submitData;
@end

@implementation CLSubHarvesterAvengerDataCollection

- (id)initInUniverse:(id)a3 withSettings:(CLSubHarvesterAvengerSettings *)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CLSubHarvesterAvengerDataCollection;
  v6 = [(CLSubHarvesterAvengerDataCollection *)&v21 init];
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    long long v7 = *(_OWORD *)&a4->fMaximumWaitTimeForActiveBestLocationRequest;
    long long v8 = *(_OWORD *)&a4->fAnalyticsHoldoffInterval;
    long long v9 = *(_OWORD *)&a4->fMaximumTimeOffsetThreshold;
    *(_OWORD *)&v6->_settings.fMaximumNumberOfAdvertisementsInCache = *(_OWORD *)&a4->fMaximumNumberOfAdvertisementsInCache;
    *(_OWORD *)&v6->_settings.fAnalyticsHoldoffInterval = v8;
    *(_OWORD *)&v6->_settings.fMaximumTimeOffsetThreshold = v9;
    *(_OWORD *)&v6->_settings.fMaximumWaitTimeForActiveBestLocationRequest = v7;
    long long v10 = *(_OWORD *)&a4->fCrossValidationDurationInterval;
    long long v11 = *(_OWORD *)&a4->fCrossValidationRequestInterval;
    long long v12 = *(_OWORD *)&a4->fCrossValidationRequestLimitShortResetInterval;
    *(_OWORD *)&v6->_settings.fCrossValidationFinalQueryInterval = *(_OWORD *)&a4->fCrossValidationFinalQueryInterval;
    *(_OWORD *)&v6->_settings.fCrossValidationRequestInterval = v11;
    *(_OWORD *)&v6->_settings.fCrossValidationRequestLimitShortResetInterval = v12;
    *(_OWORD *)&v6->_settings.fCrossValidationDurationInterval = v10;
    long long v13 = *(_OWORD *)&a4->fDataCollectionRequestInterval;
    long long v14 = *(_OWORD *)&a4->fActivityBasedSpeedRunning;
    long long v15 = *(_OWORD *)&a4->fMaximumDataCollectionRequests;
    *(_OWORD *)&v6->_settings.fActivityBasedSpeedDriving = *(_OWORD *)&a4->fActivityBasedSpeedDriving;
    *(_OWORD *)&v6->_settings.fActivityBasedSpeedRunning = v14;
    *(_OWORD *)&v6->_settings.fMaximumDataCollectionRequests = v15;
    *(_OWORD *)&v6->_settings.fDataCollectionRequestInterval = v13;
    long long v16 = *(_OWORD *)&a4->fTimeShiftForRegeotag;
    long long v17 = *(_OWORD *)&a4->fMinimumOverlappingPercentage;
    long long v18 = *(_OWORD *)&a4->fSaveBeaconPayloadCacheInterval;
    v6->_settings.fActivityBasedRegeotaggingFetchDuration = a4->fActivityBasedRegeotaggingFetchDuration;
    *(_OWORD *)&v6->_settings.fTimeShiftForRegeotag = v16;
    *(_OWORD *)&v6->_settings.fMinimumOverlappingPercentage = v17;
    *(_OWORD *)&v6->_settings.fSaveBeaconPayloadCacheInterval = v18;
    double v19 = (*((double (**)(CLSubHarvesterAvengerSettings *))v6->_settings._vptr$Settings + 20))(&v6->_settings);
    arc4random_uniform(v19);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  sub_1003B2350(&self->locationCache.__end_.__prev_);

  [(CLTimer *)self->_cacheAdvTimer invalidate];
  [(CLTimer *)self->_stopDataCollectionTimer invalidate];

  [(CLTimer *)self->_cancelDataCollectionTimer invalidate];
  self->targetAdv = 0;

  proactiveRequestMonitor = self->_proactiveRequestMonitor;
  if (proactiveRequestMonitor) {
    (*(void (**)(void *))(*(void *)proactiveRequestMonitor + 8))(proactiveRequestMonitor);
  }

  v4.receiver = self;
  v4.super_class = (Class)CLSubHarvesterAvengerDataCollection;
  [(CLSubHarvesterAvengerDataCollection *)&v4 dealloc];
}

- (void)receiveLocation:(CLDaemonLocation *)a3
{
  if (self->_state)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022F0B90);
    }
    v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      v12[0] = 68289282;
      v12[1] = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v15 = 2050;
      uint64_t v16 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"collecting location information\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v12, 0x1Cu);
    }
    v6 = operator new(0xB0uLL);
    $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
    v6[7] = *(_OWORD *)&a3->lifespan;
    v6[8] = rawCoordinate;
    v6[9] = *(_OWORD *)&a3->rawCourse;
    *(_OWORD *)((char *)v6 + 156) = *(_OWORD *)&a3->integrity;
    long long v8 = *(_OWORD *)&a3->speed;
    v6[3] = *(_OWORD *)&a3->altitude;
    v6[4] = v8;
    long long v9 = *(_OWORD *)&a3->timestamp;
    v6[5] = *(_OWORD *)&a3->course;
    v6[6] = v9;
    long long v10 = *(_OWORD *)&a3->coordinate.longitude;
    v6[1] = *(_OWORD *)&a3->suitability;
    v6[2] = v10;
    prev = self->locationCache.__end_.__prev_;
    *(void *)v6 = prev;
    *((void *)v6 + 1) = &self->locationCache;
    prev[1] = v6;
    self->locationCache.__end_.__prev_ = v6;
    ++self->locationCache.__size_alloc_.__value_;
    if (self->targetAdv) {
      [(CLSubHarvesterAvengerDataCollection *)self pruneLocationCacheAfterAdv];
    }
    else {
      [(CLSubHarvesterAvengerDataCollection *)self pruneLocationCacheBeforeAdv];
    }
  }
}

- (void)receiveMotionActivity:(CLMotionActivity *)a3
{
  if (self->_state)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022F0B90);
    }
    long long v14 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      uint64_t buf = 68289282;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2050;
      uint64_t v24 = 11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"collecting motion information\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
    }
    __int16 v15 = [CLSubHarvesterAvengerMotion alloc];
    -[NSDate timeIntervalSinceReferenceDate](+[NSDate now](NSDate, "now", *(void *)&a3->type, *(void *)&a3->source, *(void *)&a3->mountedConfidence, *(void *)&a3->conservativeMountedProbability, *(void *)&a3->isStanding, *(void *)&a3->timestamp, *(void *)&a3->isVehicleConnected, *(void *)&a3->estExitTime, *(void *)&a3->vehicleType, *(void *)&a3->fsmTransitionData.fConsecStatic, *(void *)&a3[1].type, *(void *)&a3[1].source, *(void *)&a3[1].mountedConfidence, *(void *)&a3[1].conservativeMountedProbability, *(void *)&a3[1].isStanding, *(void *)&a3[1].timestamp,
        *(void *)&a3[1].isVehicleConnected),
      "timeIntervalSinceReferenceDate");
    uint64_t v16 = -[CLSubHarvesterAvengerMotion initWithMotion:timestamp:](v15, "initWithMotion:timestamp:", &v19);
    [(NSMutableArray *)self->motionCache addObject:v16];

    if (self->targetAdv)
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022F0B90);
      }
      long long v17 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
      {
        uint64_t buf = 68289282;
        __int16 v21 = 2082;
        v22 = "";
        __int16 v23 = 2050;
        uint64_t v24 = 11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"prune motion after adv\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
      }
      [(CLSubHarvesterAvengerDataCollection *)self pruneMotionCacheAfterAdv];
    }
    else
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1022F0B90);
      }
      long long v18 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
      {
        uint64_t buf = 68289282;
        __int16 v21 = 2082;
        v22 = "";
        __int16 v23 = 2050;
        uint64_t v24 = 11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"prune motion before adv\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
      }
      [(CLSubHarvesterAvengerDataCollection *)self pruneMotionCacheBeforeAdv];
    }
  }
}

- (void)receiveAdvertisement:(id)a3
{
  int64_t state = self->_state;
  if (state == 2)
  {
    [(CLSubHarvesterAvengerDataCollection *)self identifyTargetAdv:a3];
  }
  else if (!state && sub_10131AD84((uint64_t)self->_proactiveRequestMonitor))
  {
    [(CLSubHarvesterAvengerDataCollection *)self startDataCollection];
  }
}

- (void)receiveBeaconPayload:(id)a3
{
  if (-[CLSubHarvesterAvengerDataCollection isEqualToTargetAdv:](self, "isEqualToTargetAdv:", [a3 advertisement])&& objc_msgSend(a3, "location"))
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022F0B90);
    }
    uint64_t v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      __int16 v7 = 2082;
      long long v8 = "";
      __int16 v9 = 2050;
      uint64_t v10 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"found corresponding payload for target advertisement\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v6, 0x1Cu);
    }
    self->targetPayload = (SPBeaconPayload *)[objc_alloc((Class)SPBeaconPayload) initWithAdvertisement:[a3 advertisement] location:[a3 location]];
  }
}

- (void)receiveSignalEnvironment:(int)a3
{
  self->recentSignalEnvironment = a3;
}

- (void)startDataCollection
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022F0B90);
  }
  v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2050;
    uint64_t v17 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"data collection is triggered\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
  }
  self->_int64_t state = 1;
  cacheAdvTimer = self->_cacheAdvTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C9EA68;
  v11[3] = &unk_10229FED8;
  v11[4] = self;
  [(CLTimer *)cacheAdvTimer setHandler:v11];
  uint64_t v5 = self->_cacheAdvTimer;
  p_settings = &self->_settings;
  (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 21))(&self->_settings);
  -[CLTimer setNextFireDelay:](v5, "setNextFireDelay:");
  cancelDataCollectionTimer = self->_cancelDataCollectionTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C9EB60;
  v10[3] = &unk_10229FED8;
  v10[4] = self;
  [(CLTimer *)cancelDataCollectionTimer setHandler:v10];
  long long v8 = self->_cancelDataCollectionTimer;
  double v9 = (*((double (**)(CLSubHarvesterAvengerSettings *))p_settings->_vptr$Settings + 21))(p_settings);
  [(CLTimer *)v8 setNextFireDelay:v9 + (*((double (**)(CLSubHarvesterAvengerSettings *))p_settings->_vptr$Settings + 22))(p_settings)];
}

- (void)identifyTargetAdv:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022F0B90);
  }
  uint64_t v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    [objc_msgSend(a3, "scanDate") timeIntervalSinceReferenceDate];
    *(_DWORD *)uint64_t buf = 68289538;
    int v25 = 0;
    __int16 v26 = 2082;
    v27 = "";
    __int16 v28 = 2050;
    uint64_t v29 = v6;
    __int16 v30 = 2050;
    uint64_t v31 = 11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"collected target advertisement\", \"adv timestamp: \":\"%{public}f\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x26u);
  }
  targetAdv = self->targetAdv;
  if (targetAdv)
  {

    self->targetAdv = 0;
  }
  if (+[SPAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:")])
  {
    SEL v8 = NSSelectorFromString(@"isPosh");
    double v9 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", [(id)objc_opt_class() instanceMethodSignatureForSelector:v8]);
    [(NSInvocation *)v9 setSelector:v8];
    [(NSInvocation *)v9 setTarget:a3];
    [(NSInvocation *)v9 invoke];
    buf[0] = 0;
    [(NSInvocation *)v9 getReturnValue:buf];
    id v10 = objc_alloc((Class)SPAdvertisement);
    id v11 = [a3 address];
    id v12 = [a3 advertisementData];
    id v13 = [a3 status];
    id v14 = [a3 reserved];
    id v15 = [a3 rssi];
    id v16 = [a3 scanDate];
    LOBYTE(v22) = buf[0];
    uint64_t v17 = (SPAdvertisement *)[v10 initWithAddress:v11 advertisementData:v12 status:v13 reserved:v14 rssi:v15 scanDate:v16 isPosh:v22];
  }
  else
  {
    uint64_t v17 = (SPAdvertisement *)[objc_alloc((Class)SPAdvertisement) initWithAddress:[a3 address] advertisementData:[a3 advertisementData] status:[a3 status] reserved:[a3 reserved] rssi:[a3 rssi] scanDate:[a3 scanDate]];
  }
  self->targetAdv = v17;
  stopDataCollectionTimer = self->_stopDataCollectionTimer;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100C9EF94;
  v23[3] = &unk_10229FED8;
  v23[4] = self;
  [(CLTimer *)stopDataCollectionTimer setHandler:v23];
  long long v19 = self->_stopDataCollectionTimer;
  __int16 v21 = self->_settings._vptr$Settings;
  p_settings = &self->_settings;
  ((void (*)(CLSubHarvesterAvengerSettings *))v21[21])(p_settings);
  -[CLTimer setNextFireDelay:](v19, "setNextFireDelay:");
  *(void *)&p_settings[1].fMaximumFineRequestsPerDay = 3;
}

- (void)stopDataCollection
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022F0B90);
  }
  v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    __int16 v8 = 2050;
    uint64_t v9 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"stop data collection\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v5, 0x1Cu);
  }
  self->_int64_t state = 0;
  [(CLTimer *)self->_cacheAdvTimer invalidate];
  [(CLTimer *)self->_stopDataCollectionTimer invalidate];
  cancelDataCollectionTimer = self->_cancelDataCollectionTimer;
  if (cancelDataCollectionTimer) {
    [(CLTimer *)cancelDataCollectionTimer invalidate];
  }
  sub_1003B2350(&self->locationCache.__end_.__prev_);
  [(NSMutableArray *)self->motionCache removeAllObjects];

  self->targetAdv = 0;
  self->targetPayload = 0;
}

- (void)submitData
{
  [(CLSubHarvesterAvengerDataCollection *)self buildEvent];
  AnalyticsSendEvent();
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022F0B90);
  }
  v2 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 68289282;
    v3[1] = 0;
    __int16 v4 = 2082;
    uint64_t v5 = "";
    __int16 v6 = 2050;
    uint64_t v7 = 11;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"submit data\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)v3, 0x1Cu);
  }
}

- (id)buildEvent
{
  if (self->locationCache.__size_alloc_.__value_ && [(NSMutableArray *)self->motionCache count])
  {
    id v3 = +[NSMutableDictionary dictionary];
    double v4 = *(double *)((char *)self->locationCache.__end_.__next_ + 92);
    [(-[NSMutableArray firstObject](self->motionCache, "firstObject")) timestamp];
    if (v4 >= v5) {
      [self->motionCache firstObject].timestamp
    }
    else {
      double v6 = *(double *)((char *)self->locationCache.__end_.__next_ + 92);
    }
    __int16 v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v6];
    [v3 addEntriesFromDictionary:-[CLSubHarvesterAvengerDataCollection buildEventWithLocationWithFirstTimeStamp:](self, "buildEventWithLocationWithFirstTimeStamp:", v8)];
    [v3 addEntriesFromDictionary:-[CLSubHarvesterAvengerDataCollection buildEventWithMotionWithFirstTimeStamp:](self, "buildEventWithMotionWithFirstTimeStamp:", v8)];
    [v3 addEntriesFromDictionary:-[CLSubHarvesterAvengerDataCollection buildEventWithAdvWithFirstTimeStamp:](self, "buildEventWithAdvWithFirstTimeStamp:", v8)];
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->recentSignalEnvironment)] forKeyedSubscript:@"sigEnv"];
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[CLSubHarvesterAvengerDataCollection getTimeOfDayForAnalytics](self, "getTimeOfDayForAnalytics"))] forKeyedSubscript:@"timeOfDay"];
    return v3;
  }
  else
  {
    return +[NSMutableDictionary dictionary];
  }
}

- (id)buildEventWithLocationWithFirstTimeStamp:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  next = self->locationCache.__end_.__next_;
  if (next != (void *)&self->locationCache)
  {
    uint64_t v7 = 1;
    do
    {
      __int16 v8 = +[NSString stringWithFormat:@"location%ld", v7];
      if (next == self->locationCache.__end_.__next_)
      {
        double v10 = 0.0;
      }
      else
      {
        double v9 = *(double *)((char *)next + 92) - *(double *)(*next + 92);
        double v10 = sub_1000A3D9C(*(double *)((char *)next + 20), *(double *)((char *)next + 28), *(double *)(*next + 20), *(double *)(*next + 28))/ v9;
      }
      [+[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)((char *)next + 92)] timeIntervalSinceDate:a3];
      [v5 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"@%.2lf, %.2lf, %.2lf, %.2lf", v11, *(void *)((char *)next + 36), *(void *)((char *)next + 60), *(void *)&v10), v8 forKeyedSubscript];
      ++v7;
      next = (void *)next[1];
    }
    while (next != (void *)&self->locationCache);
  }
  return v5;
}

- (id)buildEventWithMotionWithFirstTimeStamp:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  uint64_t v6 = (uint64_t)[(NSMutableArray *)self->motionCache count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v8 + 1;
      double v10 = +[NSString stringWithFormat:@"motion%ld", v8 + 1];
      [[-[NSMutableArray objectAtIndex:](self->motionCache, "objectAtIndex:", v8) timestamp];
      [+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:") timeIntervalSinceDate:a3];
      uint64_t v12 = v11;
      id v13 = [(NSMutableArray *)self->motionCache objectAtIndex:v8];
      if (v13)
      {
        [v13 motionActivity];
        uint64_t v14 = v19;
      }
      else
      {
        uint64_t v14 = 0;
        unsigned int v19 = 0;
      }
      id v15 = [(NSMutableArray *)self->motionCache objectAtIndex:v8];
      if (v15)
      {
        [v15 motionActivity];
        uint64_t v16 = v18;
      }
      else
      {
        uint64_t v16 = 0;
        unsigned int v18 = 0;
      }
      [v5 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"@%.2lf, %u, %u", v12, v14, v16), v10 forKeyedSubscript];
      ++v8;
    }
    while (v7 != v9);
  }
  return v5;
}

- (id)buildEventWithAdvWithFirstTimeStamp:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  [(-[SPAdvertisement scanDate](self->targetAdv, "scanDate")) timeIntervalSinceDate:a3];
  [v5 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"@%.2lf, %ld, %@", v6, -[SPAdvertisement rssi](self->targetAdv, "rssi"), -[CLSubHarvesterAvengerDataCollection getAdvType:](self, "getAdvType:", self->targetAdv)), @"advertisement" forKeyedSubscript];
  targetPayload = self->targetPayload;
  if (targetPayload)
  {
    [objc_msgSend(-[SPBeaconPayload location](targetPayload, "location"), "timestamp") timeIntervalSinceDate:a3];
    uint64_t v9 = v8;
    [self->targetPayload location].horizontalAccuracy;
    uint64_t v11 = v10;
    [self->targetPayload location].speed
    [v5 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"@%.2lf, %.2lf, %.2lf", v9, v11, v12), @"result" forKeyedSubscript];
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022F0B90);
    }
    id v13 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      unsigned int v18 = "";
      __int16 v19 = 2050;
      uint64_t v20 = 11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"there is location tagged\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x1Cu);
    }
  }
  return v5;
}

- (void)pruneLocationCacheBeforeAdv
{
  if (self->locationCache.__size_alloc_.__value_ >= 2)
  {
    double v3 = *(double *)((char *)self->locationCache.__end_.__prev_ + 92)
       - *(double *)((char *)self->locationCache.__end_.__next_ + 92);
    if (v3 > (*((double (**)(void))self->_settings._vptr$Settings + 21))())
    {
      next = (uint64_t *)self->locationCache.__end_.__next_;
      unint64_t value = self->locationCache.__size_alloc_.__value_;
      uint64_t v6 = *next;
      *(void *)(v6 + 8) = next[1];
      *(void *)next[1] = v6;
      self->locationCache.__size_alloc_.__value_ = value - 1;
      operator delete(next);
    }
    unint64_t v7 = self->locationCache.__size_alloc_.__value_;
    if (v7 >= 0xB)
    {
      uint64_t v8 = (uint64_t *)self->locationCache.__end_.__next_;
      uint64_t v9 = *v8;
      *(void *)(v9 + 8) = v8[1];
      *(void *)v8[1] = v9;
      self->locationCache.__size_alloc_.__value_ = v7 - 1;
      operator delete(v8);
    }
  }
}

- (void)pruneLocationCacheAfterAdv
{
  unint64_t value = self->locationCache.__size_alloc_.__value_;
  if (value >= 0x15)
  {
    prev = (uint64_t *)self->locationCache.__end_.__prev_;
    uint64_t v4 = *prev;
    *(void *)(v4 + 8) = prev[1];
    *(void *)prev[1] = v4;
    self->locationCache.__size_alloc_.__value_ = value - 1;
    operator delete(prev);
  }
}

- (void)pruneMotionCacheBeforeAdv
{
  if ((unint64_t)[(NSMutableArray *)self->motionCache count] >= 2)
  {
    [self->motionCache lastObject].timestamp
    double v4 = v3;
    [(-[NSMutableArray firstObject](self->motionCache, "firstObject")) timestamp];
    if (v4 - v5 > (*((double (**)(void))self->_settings._vptr$Settings + 21))()) {
      [(NSMutableArray *)self->motionCache removeObjectAtIndex:0];
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->motionCache count] >= 0xB)
  {
    motionCache = self->motionCache;
    [(NSMutableArray *)motionCache removeObjectAtIndex:0];
  }
}

- (void)pruneMotionCacheAfterAdv
{
  if ((unint64_t)[(NSMutableArray *)self->motionCache count] >= 0x15)
  {
    motionCache = self->motionCache;
    [(NSMutableArray *)motionCache removeLastObject];
  }
}

- (int64_t)getTimeOfDayForAnalytics
{
  v2 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") components:32 fromDate:+[NSDate now]];

  return [(NSDateComponents *)v2 hour];
}

- (id)getAdvType:(id)a3
{
  if (([a3 status] & 0x10) == 0) {
    return @"unknown";
  }
  if (objc_msgSend(objc_msgSend(a3, "advertisementData"), "length")) {
    return @"wild";
  }
  return @"nearOwner";
}

- (BOOL)isEqualToTargetAdv:(id)a3
{
  if (!self->targetAdv) {
    return 0;
  }
  if (![objc_msgSend(objc_msgSend(a3, "scanDate"), "isEqualToDate:", -[SPAdvertisement scanDate](self->targetAdv, "scanDate"))])return 0; {
  id v5 = [a3 rssi];
  }
  if (v5 != [(SPAdvertisement *)self->targetAdv rssi]
    || !objc_msgSend(objc_msgSend(a3, "address"), "isEqualToData:", -[SPAdvertisement address](self->targetAdv, "address")))
  {
    return 0;
  }
  id v6 = [a3 advertisementData];
  id v7 = [(SPAdvertisement *)self->targetAdv advertisementData];

  return [v6 isEqualToData:v7];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 7) = off_10231B370;
  *((_OWORD *)self + 4) = xmmword_101D8ACB0;
  *((_OWORD *)self + 5) = xmmword_101D8ACC0;
  *((void *)self + 12) = 0x12000001F4;
  *((_DWORD *)self + 26) = 72;
  *((void *)self + 14) = 0x40CC200000000000;
  *((unsigned char *)self + 120) = 1;
  *((_DWORD *)self + 31) = 1;
  *((_OWORD *)self + 8) = xmmword_101D8ACD0;
  *((_OWORD *)self + 9) = xmmword_101D8ACE0;
  *((void *)self + 20) = 0x40B2C00000000000;
  *((unsigned char *)self + 168) = 0;
  *((_OWORD *)self + 11) = xmmword_101D8ACF0;
  *((_DWORD *)self + 48) = 1;
  *(_OWORD *)((char *)self + 200) = xmmword_101D82690;
  *(_OWORD *)((char *)self + 216) = xmmword_101D826A0;
  *(_OWORD *)((char *)self + 232) = xmmword_101D826B0;
  *(_OWORD *)((char *)self + 248) = xmmword_101D826C0;
  *((void *)self + 33) = 0x4072C00000000000;
  *((void *)self + 34) = 0x3F847AE147AE147BLL;
  *((_DWORD *)self + 70) = 4;
  *((_OWORD *)self + 18) = xmmword_101D8AD00;
  *((void *)self + 38) = 0x405E000000000000;
  *((void *)self + 41) = (char *)self + 328;
  *((void *)self + 42) = (char *)self + 328;
  *((void *)self + 43) = 0;
  return self;
}

@end