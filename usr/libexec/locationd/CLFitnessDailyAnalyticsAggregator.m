@interface CLFitnessDailyAnalyticsAggregator
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLFitnessDailyAnalyticsAggregator)init;
- (FitnessDailyMetric)NSDictionaryToMotionFitnessDailyStruct:(SEL)a3;
- (FitnessDailyMetric)getActivityStats;
- (id).cxx_construct;
- (id)CFAbsoluteTimeToNSStringKey:(double)a3;
- (id)MotionFitnessDailyStructToNSDictionary:(FitnessDailyMetric *)a3;
- (id)NSDateToNSStringKey:(id)a3;
- (id)createCache;
- (id)loadCache;
- (id)onDataProtectionNotification:(int)a3 data:(int)a4;
- (id)onFitnessTrackingNotification:(int)a3 data:(uint64_t)a4;
- (unsigned)computeLocalDaytimeDurationForDate:(double)a3 latitude:(float)a4 longitude:(float)a5;
- (void)ageOutCache:(id)a3;
- (void)attemptSendCoreAnalytics;
- (void)beginService;
- (void)endService;
- (void)initDataDictForDay:(id)a3;
- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4;
- (void)onDataCollectionChangedNotification;
- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4;
- (void)onNatalimetryNotification:(int)a3 data:(NotificationData *)a4;
- (void)queryActiveCalories;
- (void)queryBasalCalories;
- (void)queryCalories:(id)a3 endDate:(id)a4 hkIdentifier:(id)a5 sources:(id)a6 caloriesHandler:(id)a7;
- (void)queryCaloriesFromAllWorkouts;
- (void)queryCaloriesFromFirstPartyWorkouts;
- (void)queryCaloriesFromFitnessPlusWorkouts;
- (void)queryCaloriesFromWorkouts:(id)a3 endDate:(id)a4 sources:(id)a5 workoutsHandler:(id)a6;
- (void)queryCompanionActiveCalories;
- (void)queryCompanionBasalCalories;
- (void)queryCompanionFlightsClimbed;
- (void)queryCompanionPedDistance;
- (void)queryCompanionStepCount;
- (void)queryExerciseMinutes;
- (void)queryExerciseMinutes:(id)a3 endDate:(id)a4 sources:(id)a5 exerciseMinutesHandler:(id)a6;
- (void)queryFlightsClimbed;
- (void)queryFlightsClimbed:(id)a3 endDate:(id)a4 sources:(id)a5 flightsClimbedHandler:(id)a6;
- (void)queryPedDistance;
- (void)queryPedDistance:(id)a3 endDate:(id)a4 sources:(id)a5 distanceHandler:(id)a6;
- (void)querySources;
- (void)queryStepCount;
- (void)queryStepCount:(id)a3 endDate:(id)a4 sources:(id)a5 stepCountHandler:(id)a6;
- (void)queryTimeInDaylight;
- (void)queryTimeInDaylight:(id)a3 endDate:(id)a4 sources:(id)a5 timeInDaylightHandler:(id)a6;
- (void)queryTimeInDaylightMetadata;
- (void)queryTimeInDaylightMetadata:(id)a3 endDate:(id)a4 sources:(id)a5 timeInDaylightMetadataHandler:(id)a6;
- (void)queryTimeNonStatic;
- (void)queryTimeNonStatic:(double)a3 endDate:(double)a4 TimeNonStaticHandler:(id)a5;
- (void)resetQueryState;
- (void)runNextPendingQuery;
- (void)runQueries;
- (void)sendFitnessAnalytics:(FitnessDailyMetric *)a3;
- (void)sendTimeInDaylightAnayltics:(FitnessDailyMetric *)a3;
- (void)setupQueryTimer;
- (void)setupStoreCacheTimer;
- (void)storeCache:(id)a3;
@end

@implementation CLFitnessDailyAnalyticsAggregator

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247F608 != -1) {
    dispatch_once(&qword_10247F608, &stru_1022D7B78);
  }
  return (id)qword_10247F600;
}

+ (BOOL)isSupported
{
  return sub_10016CCBC() && sub_1000D2E34(0) && objc_opt_class();
}

- (CLFitnessDailyAnalyticsAggregator)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLFitnessDailyAnalyticsAggregator;
  return [(CLFitnessDailyAnalyticsAggregator *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLFitnessDailyAnalyticsAggregatorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLFitnessDailyAnalyticsAggregatorClientProtocol];
}

- (void)beginService
{
  [self universe].silo
  self->fMotionStateProxy = 0;
  self->fStoreCacheTimer = (CLTimer *)[[-[CLFitnessDailyAnalyticsAggregator universe](self, "universe") silo] newTimer];
  value = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  v4 = self->fCompanionNotifierClient.__ptr_.__value_;
  self->fCompanionNotifierClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
  }
  unint64_t v5 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }
  v6 = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  self->fTimeCompanionConnected = 0.0;
  self->fEncryptedDataAvailable = 0;
  self->fHealthStore = 0;
  self->fQueryState = 0;
  self->fQueryTimer = (CLTimer *)[[-[CLFitnessDailyAnalyticsAggregator universe](self, "universe") silo] newTimer];
  self->fHKQueryStartDate = 0;
  sub_100103240();
  if (sub_10016CCBC())
  {
    v7 = @"Watch";
    v8 = @"iPhone";
  }
  else
  {
    sub_100103240();
    if (!sub_10010145C()) {
      goto LABEL_14;
    }
    v7 = @"iPhone";
    v8 = @"Watch";
  }
  self->kProductTypePrefix = &v8->isa;
  self->kCompanionProductTypePrefix = &v7->isa;
LABEL_14:
  self->fSources = 0;
  self->fFirstPartySources = 0;
  self->fFitnessPlusSources = 0;
  self->fCompanionSources = 0;
  self->fPendingCompanionActiveCaloriesQueries = 0;
  self->fPendingCompanionBasalCaloriesQueries = 0;
  self->fPendingCompanionFlightsClimbedQueries = 0;
  self->fPendingCompanionPedDistanceQueries = 0;
  self->fPendingCompanionStepCountQueries = 0;
  self->fPendingTimeInDaylightQueries = 0;
  self->fPendingTimeInDaylightMetadataQueries = 0;
  self->fPendingStepCountQueries = 0;
  self->fPendingFlightsClimbedQueries = 0;
  self->fPendingTimeNonStaticQueries = 0;
  self->fPendingActiveCaloriesQueries = 0;
  self->fPendingBasalCaloriesQueries = 0;
  self->fPendingPedDistanceQueries = 0;
  self->fPendingCaloriesFromAllWorkoutQueries = 0;
  self->fPendingCaloriesFromFirstPartyWorkoutQueries = 0;
  self->fPendingCaloriesFromFitnessPlusWorkoutQueries = 0;
  self->fPendingExerciseMinutesQueries = 0;
  if (&MCEffectiveSettingsChangedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1009C6C2C, MCEffectiveSettingsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  [(CLFitnessDailyAnalyticsAggregator *)self onDataCollectionChangedNotification];
  if (self->fServiceEnabled)
  {
    if (+[HKHealthStore isHealthDataAvailable])
    {
      if (qword_102419270 != -1) {
        dispatch_once(&qword_102419270, &stru_1022D7E28);
      }
      v10 = qword_102419278;
      if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, data is available", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419270 != -1) {
          dispatch_once(&qword_102419270, &stru_1022D7E28);
        }
        v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator beginService]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      self->fHealthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    }
    else
    {
      if (qword_102419270 != -1) {
        dispatch_once(&qword_102419270, &stru_1022D7E28);
      }
      v12 = qword_102419278;
      if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, data is NOT available", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419270 != -1) {
          dispatch_once(&qword_102419270, &stru_1022D7E28);
        }
        v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator beginService]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
    }
    uint64_t v13 = sub_1000A6958();
    sub_1004CF870(v13);
    self->fDataCache = (NSMutableDictionary *)[(CLFitnessDailyAnalyticsAggregator *)self loadCache];
    [(CLFitnessDailyAnalyticsAggregator *)self ageOutCache:[(CLFitnessDailyAnalyticsAggregator *)self NSDateToNSStringKey:[+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeIntervalSinceNow:-259200.0]]]];
    [(CLFitnessDailyAnalyticsAggregator *)self universe];
    sub_100EB2E6C();
  }
  uint64_t v11 = sub_1000A6958();

  sub_1004CF870(v11);
}

- (void)endService
{
  [self universe].silo
  if (&MCEffectiveSettingsChangedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, MCEffectiveSettingsChangedNotification, 0);
  }

  self->fHKQueryStartDate = 0;
  self->fStoreCacheTimer = 0;

  self->fQueryTimer = 0;
  self->fHealthStore = 0;

  self->fDataCache = 0;
  value = self->fLocationClient.__ptr_.__value_;
  if (value)
  {
    self->fLocationClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  unint64_t v5 = self->fCompanionNotifierClient.__ptr_.__value_;
  if (v5)
  {
    self->fCompanionNotifierClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }
  v6 = self->fNatalimetryClient.__ptr_.__value_;
  if (v6)
  {
    self->fNatalimetryClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  v7 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v7)
  {
    self->fFitnessTrackingClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
  }
  fMotionStateProxy = self->fMotionStateProxy;
  if (fMotionStateProxy)
  {

    self->fMotionStateProxy = 0;
  }
}

- (FitnessDailyMetric)getActivityStats
{
  retstr->var0 = 0;
  retstr->var1 = -1.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(void *)&retstr->var13 = -1;
  retstr->var15 = -1.0;
  *(void *)&retstr->var16 = 0;
  *(void *)((char *)&retstr->var17 + 1) = 0;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(void *)&retstr->var28 = 0;
  retstr->int var30 = -1;
  if (self->fServiceEnabled)
  {
    id v5 = [(CLFitnessDailyAnalyticsAggregator *)self NSDateToNSStringKey:[+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeIntervalSinceNow:-172800.0]]];
    id v6 = [(NSMutableDictionary *)self->fDataCache objectForKey:v5];
    if (v6)
    {
      [(CLFitnessDailyAnalyticsAggregator *)self NSDictionaryToMotionFitnessDailyStruct:v6];
      long long v7 = v32;
      *(_OWORD *)&retstr->var22 = v31;
      *(_OWORD *)&retstr->var26 = v7;
      retstr->int var30 = v33;
      long long v8 = v28;
      *(_OWORD *)&retstr->var6 = *(_OWORD *)&buf[32];
      *(_OWORD *)&retstr->var10 = v8;
      long long v9 = v30;
      *(_OWORD *)&retstr->var14 = v29;
      *(_OWORD *)&retstr->var18 = v9;
      long long v10 = *(_OWORD *)&buf[16];
      *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
      *(_OWORD *)&retstr->var2 = v10;
      BOOL v11 = 0;
      retstr->var20 = [[-[NSMutableDictionary objectForKey:](self->fDataCache, "objectForKey:", @"kPhoneFitnessModeKey") unsignedIntValue];
      unsigned int var17 = retstr->var17;
      retstr->var16 /= 0x3Cu;
      retstr->unsigned int var17 = var17 / 0x3C;
      retstr->var0 = 1;
      if (retstr->var13 == -1 && retstr->var14 == -1) {
        BOOL v11 = retstr->var15 == -1.0;
      }
      int var30 = retstr->var30;
      if (v11 || var30 == -1)
      {
        id v14 = [(CLFitnessDailyAnalyticsAggregator *)self CFAbsoluteTimeToNSStringKey:CFAbsoluteTimeGetCurrent()];
        id v15 = [(NSMutableDictionary *)self->fDataCache objectForKey:v14];
        if (v15)
        {
          [(CLFitnessDailyAnalyticsAggregator *)self NSDictionaryToMotionFitnessDailyStruct:v15];
          if (v11)
          {
            *(void *)&retstr->var13 = v38;
            retstr->var15 = v39;
          }
          if (var30 == -1) {
            retstr->int var30 = v40;
          }
          if (qword_102419270 != -1) {
            dispatch_once(&qword_102419270, &stru_1022D7E28);
          }
          v16 = qword_102419278;
          if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEBUG))
          {
            id v17 = [v5 UTF8String];
            id v18 = [v14 UTF8String];
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = v11;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = var30 == -1;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, some metrics unavailable so overriding with most recent values, keyForDataToSubmit, %s, recentKey, %s, didOverrideBodyMetrics, %d, didOverrideLocalDaytimeDuration, %d", buf, 0x22u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419270 != -1) {
              dispatch_once(&qword_102419270, &stru_1022D7E28);
            }
            [v5 UTF8String];
            [v14 UTF8String];
            v26 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator getActivityStats]", "%s\n", v26);
            if (v26 != buf) {
              free(v26);
            }
          }
        }
      }
      [(CLFitnessDailyAnalyticsAggregator *)self ageOutCache:v5];
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
    }
    if (qword_102419270 != -1) {
      dispatch_once(&qword_102419270, &stru_1022D7E28);
    }
    v22 = qword_102419278;
    if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [v5 UTF8String];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, getting activity stats, keyForDataToSubmit, %s, isValid, %d", buf, 0x12u);
    }
    result = (FitnessDailyMetric *)sub_10013D1A0(115, 2);
    if (result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419270 != -1) {
        dispatch_once(&qword_102419270, &stru_1022D7E28);
      }
      id v24 = [v5 UTF8String];
      int v34 = 136315394;
      id v35 = v24;
      __int16 v36 = 1024;
      int v37 = v19;
      v25 = (char *)_os_log_send_and_compose_impl();
      result = (FitnessDailyMetric *)sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator getActivityStats]", "%s\n", v25);
      if (v25 != buf) {
        free(v25);
      }
    }
  }
  else
  {
    uint64_t v20 = sub_1000A6958();
    return (FitnessDailyMetric *)sub_1004CF870(v20);
  }
  return result;
}

- (void)setupStoreCacheTimer
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009C7640;
  v9[3] = &unk_10229FED8;
  v9[4] = self;
  [(CLTimer *)self->fStoreCacheTimer setHandler:v9];
  uint64_t v8 = 0;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v6);
  int v4 = sub_1000A699C(v6, "FitnessDailyAnalyticsAggregatorCacheStoreInterval", &v8);
  if (v7) {
    sub_1000DB0A0(v7);
  }
  if (v4)
  {
    double v5 = *(double *)&v8;
  }
  else
  {
    uint64_t v8 = 0x40AC200000000000;
    double v5 = 3600.0;
  }
  [(CLTimer *)self->fStoreCacheTimer setNextFireDelay:120.0 interval:v5];
}

- (id)createCache
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0) forKeyedSubscript:@"kPhoneFitnessModeKey"];
  memset(v7, 0, sizeof(v7));
  HIDWORD(v10) = 0;
  v5[0] = 0;
  long long v6 = 0u;
  v5[1] = 0xBFF0000000000000;
  uint64_t v8 = -1;
  int v9 = -1082130432;
  *(void *)&long long v10 = 0;
  *(void *)((char *)&v10 + 5) = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0;
  uint64_t v14 = 0xFFFFFFFFLL;
  [v3 setObject: -[CLFitnessDailyAnalyticsAggregator MotionFitnessDailyStructToNSDictionary:](self, "MotionFitnessDailyStructToNSDictionary:", v5) forKeyedSubscript: -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:", CFAbsoluteTimeGetCurrent())];
  return v3;
}

- (id)loadCache
{
  CFTypeRef v6 = 0;
  uint64_t v3 = sub_1000A6958();
  if (sub_1004D01D8(v3, @"FitnessDailyAnalytics", &v6)) {
    return (id)v6;
  }
  id v4 = [(CLFitnessDailyAnalyticsAggregator *)self createCache];
  [(CLFitnessDailyAnalyticsAggregator *)self storeCache:v4];
  return v4;
}

- (void)storeCache:(id)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0), +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0], 0);
  id v7 = [v6 allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (([(id)qword_10247F5C8 containsObject:v12] & 1) == 0)
        {
          id v13 = [v6 objectForKeyedSubscript:v12];
          [v13 removeObjectsForKeys:qword_10247F5C0];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  uint64_t v14 = sub_1000A6958();
  sub_1004D258C(v14);
  uint64_t v15 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v15 + 944))();
}

- (void)ageOutCache:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->fDataCache allKeys];
  [(NSMutableDictionary *)self->fDataCache removeObjectForKey:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 compare:a3] == (id)-1) {
          [(NSMutableDictionary *)self->fDataCache removeObjectForKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)CFAbsoluteTimeToNSStringKey:(double)a3
{
  uint64_t v3 = +[NSNumber numberWithInt:(int)(a3 / 60.0 / 60.0 / 24.0)];

  return [(NSNumber *)v3 stringValue];
}

- (id)NSDateToNSStringKey:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  return -[CLFitnessDailyAnalyticsAggregator CFAbsoluteTimeToNSStringKey:](self, "CFAbsoluteTimeToNSStringKey:");
}

- (id)MotionFitnessDailyStructToNSDictionary:(FitnessDailyMetric *)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var2) forKeyedSubscript:@"kActiveCaloriesKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var3)] forKeyedSubscript:@"kBasalCaloriesKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4)] forKeyedSubscript:@"kFlightsClimbedKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var5) forKeyedSubscript:@"kPedDistanceKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var6) forKeyedSubscript:@"kStepsKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var7) forKeyedSubscript:@"kExerciseMinutesKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var8) forKeyedSubscript:@"kCaloriesFromAllWorkoutsKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var9) forKeyedSubscript:@"kCaloriesFromFirstPartyWorkoutsKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var10) forKeyedSubscript:@"kCaloriesFromFitnessPlusWorkoutsKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var11) forKeyedSubscript:@"kNonPedWorkoutsKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var12) forKeyedSubscript:@"kNonPedWorkoutMinutesKey"];
  [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var13)] forKeyedSubscript:@"kAgeBinKey"];
  [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var14)] forKeyedSubscript:@"kGenderKey"];
  *(float *)&double v5 = a3->var15;
  [v4 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5)] forKeyedSubscript:@"kWeightKGKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var16) forKeyedSubscript:@"kTimeNonStaticKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var17) forKeyedSubscript:@"kTimeCompanionConnectedKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var18) forKeyedSubscript:@"kHoursActiveKey"];
  [v4 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var19) forKeyedSubscript:@"kWatchPairedKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var21)] forKeyedSubscript:@"kCompanionActiveCaloriesKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var22)] forKeyedSubscript:@"kCompanionBasalCaloriesKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var23)] forKeyedSubscript:@"kCompanionFlightsClimbedKey"];
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var24)] forKeyedSubscript:@"kCompanionPedDistanceKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var25) forKeyedSubscript:@"kCompanionStepsKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var26) forKeyedSubscript:@"kTimeInDaylightKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var27) forKeyedSubscript:@"kAmbientLightIntensityMinKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var28) forKeyedSubscript:@"kAmbientLightIntensityMedianKey"];
  [v4 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var29) forKeyedSubscript:@"kAmbientLightIntensityMaxKey"];
  [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var30)] forKeyedSubscript:@"kLocalDaytimeDurationKey"];
  return v4;
}

- (FitnessDailyMetric)NSDictionaryToMotionFitnessDailyStruct:(SEL)a3
{
  memset(v11, 0, sizeof(v11));
  HIDWORD(v14) = 0;
  v9[0] = 0;
  long long v10 = 0u;
  v9[1] = 0xBFF0000000000000;
  uint64_t v12 = -1;
  int v13 = -1082130432;
  *(void *)&long long v14 = 0;
  *(void *)((char *)&v14 + 5) = 0;
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v18 = 0xFFFFFFFFLL;
  id v6 = [(CLFitnessDailyAnalyticsAggregator *)self MotionFitnessDailyStructToNSDictionary:v9];
  [v6 addEntriesFromDictionary:a4];
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var1 = -1.0;
  *(_OWORD *)&retstr->var9 = 0u;
  *(void *)&retstr->var13 = -1;
  retstr->var15 = -1.0;
  *(void *)&retstr->var16 = 0;
  *(void *)((char *)&retstr->var17 + 1) = 0;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(void *)&retstr->var28 = 0;
  *(void *)&retstr->int var30 = 0;
  retstr->int var30 = -1;
  retstr->var2 = [[[v6 objectForKey:@"kActiveCaloriesKey"] unsignedIntValue];
  retstr->var3 = [[objc_msgSend(v6, "objectForKey:", @"kBasalCaloriesKey") unsignedIntValue];
  retstr->var4 = [[objc_msgSend(v6, "objectForKey:", @"kFlightsClimbedKey") unsignedIntValue];
  retstr->var5 = [[objc_msgSend(v6, "objectForKey:", @"kPedDistanceKey") unsignedIntValue];
  retstr->var6 = [[objc_msgSend(v6, "objectForKey:", @"kStepsKey") unsignedIntValue];
  retstr->var7 = [[objc_msgSend(v6, "objectForKey:", @"kExerciseMinutesKey") unsignedIntValue];
  retstr->var8 = [[[v6 objectForKey:@"kCaloriesFromAllWorkoutsKey"] unsignedIntValue];
  retstr->var9 = [[[objc_msgSend(v6, "objectForKey:", @"kCaloriesFromFirstPartyWorkoutsKey") unsignedIntValue];
  retstr->var10 = [[objc_msgSend(v6, "objectForKey:", @"kCaloriesFromFitnessPlusWorkoutsKey") unsignedIntValue];
  retstr->var11 = [[objc_msgSend(v6, "objectForKey:", @"kNonPedWorkoutsKey") unsignedIntValue];
  retstr->var12 = [[v6 objectForKey:@"kNonPedWorkoutMinutesKey"] unsignedIntValue];
  retstr->var13 = [[objc_msgSend(v6, "objectForKey:", @"kAgeBinKey") intValue];
  retstr->var14 = [[v6 objectForKey:@"kGenderKey"] intValue];
  [objc_msgSend(v6, "objectForKey:", @"kWeightKGKey") floatValue];
  retstr->var15 = v7;
  retstr->var16 = [[objc_msgSend(v6, "objectForKey:", @"kTimeNonStaticKey") unsignedIntValue];
  retstr->unsigned int var17 = [[objc_msgSend(v6, "objectForKey:", @"kTimeCompanionConnectedKey") unsignedIntValue];
  retstr->var18 = [[objc_msgSend(v6, "objectForKey:", @"kHoursActiveKey") unsignedIntValue];
  retstr->var19 = [[objc_msgSend(objc_msgSend(v6, "objectForKey:", @"kWatchPairedKey"), "BOOLValue");
  retstr->var21 = [[objc_msgSend(v6, "objectForKey:", @"kCompanionActiveCaloriesKey") unsignedIntValue];
  retstr->var22 = [[objc_msgSend(v6, "objectForKey:", @"kCompanionBasalCaloriesKey") unsignedIntValue];
  retstr->var23 = [[[v6 objectForKey:@"kCompanionFlightsClimbedKey"] unsignedIntValue];
  retstr->var24 = [[objc_msgSend(v6, "objectForKey:", @"kCompanionPedDistanceKey") unsignedIntValue];
  retstr->var25 = [[objc_msgSend(v6, "objectForKey:", @"kCompanionStepsKey") unsignedIntValue];
  retstr->var26 = [[objc_msgSend(v6, "objectForKey:", @"kTimeInDaylightKey") unsignedIntValue];
  retstr->var27 = [[objc_msgSend(v6, "objectForKey:", @"kAmbientLightIntensityMinKey") unsignedIntValue];
  retstr->var28 = [[objc_msgSend(v6, "objectForKey:", @"kAmbientLightIntensityMedianKey") unsignedIntValue];
  retstr->var29 = [[objc_msgSend(v6, "objectForKey:", @"kAmbientLightIntensityMaxKey") unsignedIntValue];
  result = (FitnessDailyMetric *)[[objc_msgSend(objc_msgSend(v6, "objectForKey:", @"kLocalDaytimeDurationKey"), "intValue");
  retstr->int var30 = (int)result;
  return result;
}

- (void)initDataDictForDay:(id)a3
{
  if (!-[NSMutableDictionary objectForKey:](self->fDataCache, "objectForKey:"))
  {
    fDataCache = self->fDataCache;
    memset(v8, 0, sizeof(v8));
    HIDWORD(v11) = 0;
    v6[0] = 0;
    long long v7 = 0u;
    v6[1] = 0xBFF0000000000000;
    uint64_t v9 = -1;
    int v10 = -1082130432;
    *(void *)&long long v11 = 0;
    *(void *)((char *)&v11 + 5) = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v14 = 0;
    uint64_t v15 = 0xFFFFFFFFLL;
    [(NSMutableDictionary *)fDataCache setObject:[(CLFitnessDailyAnalyticsAggregator *)self MotionFitnessDailyStructToNSDictionary:v6] forKey:a3];
  }
}

- (unsigned)computeLocalDaytimeDurationForDate:(double)a3 latitude:(float)a4 longitude:(float)a5
{
  double v9 = 0.0;
  double v8 = 0.0;
  int v7 = 0;
  sub_100AFFD3C(&v9, &v8, &v7, a3, a4, a5);
  if (v7 == 2)
  {
    LOWORD(v5) = 1440;
  }
  else if (v7 == 1)
  {
    LOWORD(v5) = 0;
  }
  else
  {
    return (int)((v8 - v9) / 60.0);
  }
  return v5;
}

- (void)onDataCollectionChangedNotification
{
  if (objc_opt_class()) {
    self->fServiceEnabled = [[+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection") isHealthDataSubmissionAllowed];
  }
  else {
    self->fServiceEnabled = 0;
  }
}

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe].silo
  if (a3 == 4)
  {
    id v7 = [(CLFitnessDailyAnalyticsAggregator *)self CFAbsoluteTimeToNSStringKey:*(double *)((char *)a4 + 76)];
    [(CLFitnessDailyAnalyticsAggregator *)self initDataDictForDay:v7];
    double v8 = *(double *)((char *)a4 + 4);
    *(float *)&double v8 = v8;
    double v9 = *(double *)((char *)a4 + 12);
    *(float *)&double v9 = v9;
    int v10 = +[NSNumber numberWithUnsignedInt:(int)sub_10126D948(0x1Eu, (double)[(CLFitnessDailyAnalyticsAggregator *)self computeLocalDaytimeDurationForDate:*(double *)((char *)a4 + 76) latitude:v8 longitude:v9])];
    id v11 = [(NSMutableDictionary *)self->fDataCache objectForKeyedSubscript:v7];
    [v11 setObject:v10 forKeyedSubscript:@"kLocalDaytimeDurationKey"];
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe].silo
  if (a3 == 5)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double fTimeCompanionConnected = self->fTimeCompanionConnected;
    if (*(unsigned char *)a4)
    {
      if (fTimeCompanionConnected != 0.0) {
        return;
      }
    }
    else
    {
      if (fTimeCompanionConnected == 0.0) {
        return;
      }
      CFAbsoluteTime v9 = Current - fTimeCompanionConnected;
      id v10 = [(CLFitnessDailyAnalyticsAggregator *)self CFAbsoluteTimeToNSStringKey:CFAbsoluteTimeGetCurrent()];
      [(CLFitnessDailyAnalyticsAggregator *)self initDataDictForDay:v10];
      [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->fDataCache, "objectForKeyedSubscript:", v10), "objectForKeyedSubscript:", @"kTimeCompanionConnectedKey") doubleValue];
      [self->fDataCache objectForKeyedSubscript:@"kTimeCompanionConnectedKey"] = [+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (v9 + v11))];
      CFAbsoluteTime Current = 0.0;
    }
    self->double fTimeCompanionConnected = Current;
  }
}

- (id)onDataProtectionNotification:(int)a3 data:(int)a4
{
  id result = [a1 universe].silo;
  if (!a3)
  {
    a1[80] = a4 == 1;
    return _[a1 runQueries];
  }
  return result;
}

- (void)onNatalimetryNotification:(int)a3 data:(NotificationData *)a4
{
  [self universe].silo
  if (a3 != 2) {
    return;
  }
  id v7 = [(CLFitnessDailyAnalyticsAggregator *)self CFAbsoluteTimeToNSStringKey:CFAbsoluteTimeGetCurrent()];
  [(CLFitnessDailyAnalyticsAggregator *)self initDataDictForDay:v7];
  float v8 = *((float *)a4 + 5);
  long long v16 = 0;
  uint64_t v17 = 0;
  uint64_t v15 = 0;
  sub_10010F834(&v15, (const void *)qword_10247F5E8, qword_10247F5F0, (qword_10247F5F0 - qword_10247F5E8) >> 2);
  uint64_t v10 = (char *)v16 - (char *)v15;
  if (v16 != v15)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v10 >> 2;
    if ((unint64_t)(v10 >> 2) <= 1) {
      uint64_t v12 = 1;
    }
    while (v15[v11] < v8)
    {
      if (v12 == ++v11)
      {
        LODWORD(v11) = v12;
        goto LABEL_9;
      }
    }
    goto LABEL_9;
  }
  LODWORD(v11) = 0;
  if (v16)
  {
LABEL_9:
    long long v16 = v15;
    operator delete(v15);
    LODWORD(v10) = v11;
  }
  if (*((unsigned char *)a4 + 56))
  {
    *(float *)&double v9 = (float)(int)v10;
    long long v13 = +[NSNumber numberWithFloat:v9];
  }
  else
  {
    long long v13 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
  }
  [self->fDataCache objectForKeyedSubscript:@"kAgeBinKey"] = v13;
  [self->fDataCache objectForKeyedSubscript:v7][@"kGenderKey"] = [NSNumber numberWithInt:*(_DWORD *)a4];
  if (*((unsigned char *)a4 + 58)) {
    LODWORD(v14) = *((_DWORD *)a4 + 3);
  }
  else {
    LODWORD(v14) = -1.0;
  }
  [self->fDataCache objectForKeyedSubscript:@"kWeightKGKey"] = [+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14)];
}

- (id)onFitnessTrackingNotification:(int)a3 data:(uint64_t)a4
{
  id result = [a1 universe].silo;
  if (a3 == 5)
  {
    float v8 = +[NSNumber numberWithUnsignedInt:a4];
    double v9 = (void *)a1[3];
    return [v9 setObject:v8 forKeyedSubscript:@"kPhoneFitnessModeKey"];
  }
  return result;
}

- (void)resetQueryState
{
  self->fPendingCompanionActiveCaloriesQueries = 0;
  self->fPendingCompanionBasalCaloriesQueries = 0;
  self->fPendingCompanionFlightsClimbedQueries = 0;
  self->fPendingCompanionPedDistanceQueries = 0;
  self->fPendingCompanionStepCountQueries = 0;
  self->fPendingTimeInDaylightQueries = 0;
  self->fPendingTimeInDaylightMetadataQueries = 0;
  self->fPendingStepCountQueries = 0;
  self->fPendingTimeNonStaticQueries = 0;
  self->fPendingActiveCaloriesQueries = 0;
  self->fPendingBasalCaloriesQueries = 0;
  self->fPendingPedDistanceQueries = 0;
  self->fPendingCaloriesFromAllWorkoutQueries = 0;
  self->fPendingCaloriesFromFirstPartyWorkoutQueries = 0;
  self->fPendingCaloriesFromFitnessPlusWorkoutQueries = 0;

  self->fSources = 0;
  self->fFirstPartySources = 0;

  self->fFitnessPlusSources = 0;
  self->fCompanionSources = 0;
  self->fQueryState = 0;
}

- (void)setupQueryTimer
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_1009C8ABC;
  v9[3] = &unk_10229FED8;
  v9[4] = self;
  [(CLTimer *)self->fQueryTimer setHandler:v9];
  uint64_t v8 = 0;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v6);
  int v4 = sub_1000A699C(v6, "FitnessDailyAnalyticsAggregatorHKQueryInterval", &v8);
  if (v7) {
    sub_1000DB0A0(v7);
  }
  if (v4)
  {
    double v5 = *(double *)&v8;
  }
  else
  {
    double v5 = *(double *)&qword_10247F5D8;
    uint64_t v8 = qword_10247F5D8;
  }
  [(CLTimer *)self->fQueryTimer setNextFireDelay:120.0 interval:v5];
}

- (void)runQueries
{
  if (qword_102419270 != -1) {
    dispatch_once(&qword_102419270, &stru_1022D7E28);
  }
  uint64_t v3 = qword_102419278;
  if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEBUG))
  {
    BOOL fEncryptedDataAvailable = self->fEncryptedDataAvailable;
    int fQueryState = self->fQueryState;
    *(_DWORD *)buf = 67109632;
    BOOL v12 = fEncryptedDataAvailable;
    __int16 v13 = 1024;
    int v14 = fQueryState;
    __int16 v15 = 1024;
    unsigned int v16 = +[HKHealthStore isHealthDataAvailable];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, attempting queries, encrypted, %d, state, %d, health, %d", buf, 0x14u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419270 != -1) {
      dispatch_once(&qword_102419270, &stru_1022D7E28);
    }
    +[HKHealthStore isHealthDataAvailable];
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator runQueries]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  uint64_t v6 = [(objc_class *)off_10241F718() sharedInstance];
  id v7 = [[-[objc_class getAllDevicesWithArchivedDevicesMatching:](v6, "getAllDevicesWithArchivedDevicesMatching:", -[objc_class activeDeviceSelectorBlock](off_10241F718(), "activeDeviceSelectorBlock")) firstObject];
  id v8 = [(CLFitnessDailyAnalyticsAggregator *)self CFAbsoluteTimeToNSStringKey:CFAbsoluteTimeGetCurrent()];
  [(CLFitnessDailyAnalyticsAggregator *)self initDataDictForDay:v8];
  [self->fDataCache objectForKeyedSubscript:@"kWatchPairedKey"] = [NSNumber numberWithBool:v7 != 0];
  if (self->fEncryptedDataAvailable
    && self->fQueryState
    && +[HKHealthStore isHealthDataAvailable]
    && self->fHealthStore)
  {
    [(NSDate *)self->fHKQueryStartDate timeIntervalSinceNow];
    if (v9 <= -43200.0)
    {
      [(CLFitnessDailyAnalyticsAggregator *)self resetQueryState];
      self->int fQueryState = 1;
    }
    else if (self->fQueryState != 1)
    {
      return;
    }
    [(CLFitnessDailyAnalyticsAggregator *)self querySources];
  }
}

- (void)querySources
{
  self->fHKQueryStartDate = +[NSDate date];
  uint64_t v3 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:-172800.0]], self->fHKQueryStartDate, 3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_1009C8F90;
  v5[3] = &unk_1022D7BA0;
  v5[4] = self;
  id v4 = [objc_alloc((Class)HKSourceQuery) initWithSampleType:+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierStepCount) samplePredicate:v3 completionHandler:v5];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v4];
}

- (void)runNextPendingQuery
{
  if (self->fPendingCompanionActiveCaloriesQueries < 1)
  {
    if (self->fPendingCompanionBasalCaloriesQueries < 1)
    {
      if (self->fPendingCompanionFlightsClimbedQueries < 1)
      {
        if (self->fPendingCompanionPedDistanceQueries < 1)
        {
          if (self->fPendingCompanionStepCountQueries < 1)
          {
            if (self->fPendingTimeInDaylightQueries < 1)
            {
              if (self->fPendingTimeInDaylightMetadataQueries < 1)
              {
                if (self->fPendingStepCountQueries < 1)
                {
                  if (self->fPendingFlightsClimbedQueries < 1)
                  {
                    if (self->fPendingActiveCaloriesQueries < 1)
                    {
                      if (self->fPendingBasalCaloriesQueries < 1)
                      {
                        if (self->fPendingPedDistanceQueries < 1)
                        {
                          if (self->fPendingCaloriesFromAllWorkoutQueries < 1)
                          {
                            if (self->fPendingCaloriesFromFirstPartyWorkoutQueries < 1)
                            {
                              if (self->fPendingCaloriesFromFitnessPlusWorkoutQueries < 1)
                              {
                                if (self->fPendingExerciseMinutesQueries < 1)
                                {
                                  if (self->fPendingTimeNonStaticQueries < 1)
                                  {
                                    if (qword_102419270 != -1) {
                                      dispatch_once(&qword_102419270, &stru_1022D7E28);
                                    }
                                    uint64_t v3 = qword_102419278;
                                    if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLFitnessDailyAnalyticsAggregator, all queries finished successfully", buf, 2u);
                                    }
                                    if (sub_10013D1A0(115, 2))
                                    {
                                      bzero(buf, 0x65CuLL);
                                      if (qword_102419270 != -1) {
                                        dispatch_once(&qword_102419270, &stru_1022D7E28);
                                      }
                                      id v4 = (char *)_os_log_send_and_compose_impl();
                                      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator runNextPendingQuery]", "%s\n", v4);
                                      if (v4 != (char *)buf) {
                                        free(v4);
                                      }
                                    }
                                    [(CLFitnessDailyAnalyticsAggregator *)self resetQueryState];
                                    [(CLFitnessDailyAnalyticsAggregator *)self attemptSendCoreAnalytics];
                                  }
                                  else
                                  {
                                    [(CLFitnessDailyAnalyticsAggregator *)self queryTimeNonStatic];
                                  }
                                }
                                else
                                {
                                  [(CLFitnessDailyAnalyticsAggregator *)self queryExerciseMinutes];
                                }
                              }
                              else
                              {
                                [(CLFitnessDailyAnalyticsAggregator *)self queryCaloriesFromFitnessPlusWorkouts];
                              }
                            }
                            else
                            {
                              [(CLFitnessDailyAnalyticsAggregator *)self queryCaloriesFromFirstPartyWorkouts];
                            }
                          }
                          else
                          {
                            [(CLFitnessDailyAnalyticsAggregator *)self queryCaloriesFromAllWorkouts];
                          }
                        }
                        else
                        {
                          [(CLFitnessDailyAnalyticsAggregator *)self queryPedDistance];
                        }
                      }
                      else
                      {
                        [(CLFitnessDailyAnalyticsAggregator *)self queryBasalCalories];
                      }
                    }
                    else
                    {
                      [(CLFitnessDailyAnalyticsAggregator *)self queryActiveCalories];
                    }
                  }
                  else
                  {
                    [(CLFitnessDailyAnalyticsAggregator *)self queryFlightsClimbed];
                  }
                }
                else
                {
                  [(CLFitnessDailyAnalyticsAggregator *)self queryStepCount];
                }
              }
              else
              {
                [(CLFitnessDailyAnalyticsAggregator *)self queryTimeInDaylightMetadata];
              }
            }
            else
            {
              [(CLFitnessDailyAnalyticsAggregator *)self queryTimeInDaylight];
            }
          }
          else
          {
            [(CLFitnessDailyAnalyticsAggregator *)self queryCompanionStepCount];
          }
        }
        else
        {
          [(CLFitnessDailyAnalyticsAggregator *)self queryCompanionPedDistance];
        }
      }
      else
      {
        [(CLFitnessDailyAnalyticsAggregator *)self queryCompanionFlightsClimbed];
      }
    }
    else
    {
      [(CLFitnessDailyAnalyticsAggregator *)self queryCompanionBasalCalories];
    }
  }
  else
  {
    [(CLFitnessDailyAnalyticsAggregator *)self queryCompanionActiveCalories];
  }
}

- (void)queryCompanionStepCount
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCompanionStepCountQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009C9F38;
  v6[3] = &unk_1022D7BC8;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryStepCount:v3 endDate:v4 sources:fCompanionSources stepCountHandler:v6];
}

- (void)queryStepCount
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingStepCountQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CA298;
  v6[3] = &unk_1022D7BC8;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryStepCount:v3 endDate:v4 sources:fSources stepCountHandler:v6];
}

- (void)queryStepCount:(id)a3 endDate:(id)a4 sources:(id)a5 stepCountHandler:(id)a6
{
  uint64_t v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 3), +[HKQuery predicateForObjectsFromSources:a5], 0));
  id v11 = objc_alloc_init((Class)NSDateComponents);
  [v11 setHour:1];
  id v12 = [objc_alloc((Class)HKStatisticsCollectionQuery) initWithQuantityType:+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierStepCount) quantitySamplePredicate:v10 options:16 anchorDate:a3 intervalComponents:v11];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x4812000000;
  v14[3] = sub_100177CC0;
  v14[4] = sub_10017743C;
  v14[5] = "";
  unsigned int v16 = 0;
  uint64_t v17 = 0;
  __p = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009CA790;
  v13[3] = &unk_1022D7C68;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a6;
  v13[8] = v14;
  [v12 setInitialResultsHandler:v13];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v12];

  _Block_object_dispose(v14, 8);
  if (__p)
  {
    unsigned int v16 = __p;
    operator delete(__p);
  }
}

- (void)queryFlightsClimbed
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingFlightsClimbedQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CAE4C;
  v6[3] = &unk_1022D7C90;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryFlightsClimbed:v3 endDate:v4 sources:fSources flightsClimbedHandler:v6];
}

- (void)queryCompanionFlightsClimbed
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCompanionFlightsClimbedQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CB198;
  v6[3] = &unk_1022D7C90;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryFlightsClimbed:v3 endDate:v4 sources:fCompanionSources flightsClimbedHandler:v6];
}

- (void)queryFlightsClimbed:(id)a3 endDate:(id)a4 sources:(id)a5 flightsClimbedHandler:(id)a6
{
  v11[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v11[1] = +[HKQuery predicateForObjectsFromSources:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CB564;
  v10[3] = &unk_1022D7CB8;
  v10[4] = self;
  v10[5] = a6;
  id v9 = [objc_alloc((Class)HKStatisticsQuery) initWithQuantityType:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed] quantitySamplePredicate:[NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:v11, 2]] options:16 completionHandler:v10];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v9];
}

- (void)queryActiveCalories
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingActiveCaloriesQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CBA0C;
  v6[3] = &unk_1022D7CE0;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCalories:v3 endDate:v4 hkIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned sources:fSources caloriesHandler:v6];
}

- (void)queryCompanionActiveCalories
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCompanionActiveCaloriesQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CBD64;
  v6[3] = &unk_1022D7CE0;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCalories:v3 endDate:v4 hkIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned sources:fCompanionSources caloriesHandler:v6];
}

- (void)queryBasalCalories
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingBasalCaloriesQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CC0BC;
  v6[3] = &unk_1022D7CE0;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCalories:v3 endDate:v4 hkIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned sources:fSources caloriesHandler:v6];
}

- (void)queryCompanionBasalCalories
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCompanionBasalCaloriesQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CC414;
  v6[3] = &unk_1022D7CE0;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCalories:v3 endDate:v4 hkIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned sources:fCompanionSources caloriesHandler:v6];
}

- (void)queryCalories:(id)a3 endDate:(id)a4 hkIdentifier:(id)a5 sources:(id)a6 caloriesHandler:(id)a7
{
  v13[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v13[1] = +[HKQuery predicateForObjectsFromSources:a6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009CC7DC;
  v12[3] = &unk_1022D7CB8;
  v12[4] = self;
  v12[5] = a7;
  id v11 = [objc_alloc((Class)HKStatisticsQuery) initWithQuantityType:+[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", a5) quantitySamplePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2)) options:16 completionHandler:v12];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v11];
}

- (void)queryPedDistance
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingPedDistanceQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CCC74;
  v6[3] = &unk_1022D7CE0;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryPedDistance:v3 endDate:v4 sources:fSources distanceHandler:v6];
}

- (void)queryCompanionPedDistance
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCompanionPedDistanceQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fCompanionSources = self->fCompanionSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CCFC0;
  v6[3] = &unk_1022D7CE0;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryPedDistance:v3 endDate:v4 sources:fCompanionSources distanceHandler:v6];
}

- (void)queryPedDistance:(id)a3 endDate:(id)a4 sources:(id)a5 distanceHandler:(id)a6
{
  v11[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v11[1] = +[HKQuery predicateForObjectsFromSources:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CD38C;
  v10[3] = &unk_1022D7CB8;
  v10[4] = self;
  v10[5] = a6;
  id v9 = [objc_alloc((Class)HKStatisticsQuery) initWithQuantityType:+[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierDistanceWalkingRunning) quantitySamplePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)) options:16 completionHandler:v10];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v9];
}

- (void)queryCaloriesFromAllWorkouts
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCaloriesFromAllWorkoutQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CD824;
  v6[3] = &unk_1022D7D08;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCaloriesFromWorkouts:v3 endDate:v4 sources:fSources workoutsHandler:v6];
}

- (void)queryCaloriesFromFirstPartyWorkouts
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCaloriesFromFirstPartyWorkoutQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fFirstPartySources = self->fFirstPartySources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CDBA0;
  v6[3] = &unk_1022D7D08;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCaloriesFromWorkouts:v3 endDate:v4 sources:fFirstPartySources workoutsHandler:v6];
}

- (void)queryCaloriesFromFitnessPlusWorkouts
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingCaloriesFromFitnessPlusWorkoutQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fFitnessPlusSources = self->fFitnessPlusSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CDF88;
  v6[3] = &unk_1022D7D08;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryCaloriesFromWorkouts:v3 endDate:v4 sources:fFitnessPlusSources workoutsHandler:v6];
}

- (void)queryCaloriesFromWorkouts:(id)a3 endDate:(id)a4 sources:(id)a5 workoutsHandler:(id)a6
{
  v11[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v11[1] = +[HKQuery predicateForObjectsFromSources:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CE34C;
  v10[3] = &unk_1022D7D58;
  v10[4] = self;
  v10[5] = a6;
  id v9 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:+[HKSampleType workoutType](HKSampleType, "workoutType") predicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)) limit:0 sortDescriptors:0 resultsHandler:v10];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v9];
}

- (void)queryExerciseMinutes
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingExerciseMinutesQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CE934;
  v6[3] = &unk_1022D7C90;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryExerciseMinutes:v3 endDate:v4 sources:fSources exerciseMinutesHandler:v6];
}

- (void)queryExerciseMinutes:(id)a3 endDate:(id)a4 sources:(id)a5 exerciseMinutesHandler:(id)a6
{
  v11[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v11[1] = +[HKQuery predicateForObjectsFromSources:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CED00;
  v10[3] = &unk_1022D7CB8;
  v10[4] = self;
  v10[5] = a6;
  id v9 = [objc_alloc((Class)HKStatisticsQuery) initWithQuantityType:+[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierAppleExerciseTime) quantitySamplePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)) options:16 completionHandler:v10];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v9];
}

- (void)queryTimeInDaylight
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingTimeInDaylightQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CF19C;
  v6[3] = &unk_1022D7C90;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryTimeInDaylight:v3 endDate:v4 sources:fSources timeInDaylightHandler:v6];
}

- (void)queryTimeInDaylight:(id)a3 endDate:(id)a4 sources:(id)a5 timeInDaylightHandler:(id)a6
{
  v11[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v11[1] = +[HKQuery predicateForObjectsFromSources:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CF574;
  v10[3] = &unk_1022D7CB8;
  v10[4] = self;
  v10[5] = a6;
  id v9 = [objc_alloc((Class)HKStatisticsQuery) initWithQuantityType:+[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierTimeInDaylight) quantitySamplePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)) options:16 completionHandler:v10];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v9];
}

- (void)queryTimeInDaylightMetadata
{
  uint64_t v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeInterval:self->fHKQueryStartDate sinceDate:(double)(-86400 * self->fPendingTimeInDaylightMetadataQueries)]];
  id v4 = [(NSDate *)v3 dateByAddingTimeInterval:86399.0];
  fSources = self->fSources;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1009CFA10;
  v6[3] = &unk_1022D7D80;
  v6[4] = self;
  v6[5] = v3;
  [(CLFitnessDailyAnalyticsAggregator *)self queryTimeInDaylightMetadata:v3 endDate:v4 sources:fSources timeInDaylightMetadataHandler:v6];
}

- (void)queryTimeInDaylightMetadata:(id)a3 endDate:(id)a4 sources:(id)a5 timeInDaylightMetadataHandler:(id)a6
{
  v11[0] = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:3];
  v11[1] = +[HKQuery predicateForObjectsFromSources:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009CFE70;
  v10[3] = &unk_1022D7D58;
  v10[4] = self;
  v10[5] = a6;
  id v9 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierTimeInDaylight) predicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2)) limit:0 sortDescriptors:0 resultsHandler:v10];
  self->int fQueryState = 2;
  [(HKHealthStore *)self->fHealthStore executeQuery:v9];
}

- (void)queryTimeNonStatic
{
  [[+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") startOfDayForDate:+[NSDate dateWithTimeIntervalSinceNow:(double)(-86400 * self->fPendingTimeNonStaticQueries)]] timeIntervalSinceReferenceDate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009D0754;
  v4[3] = &unk_1022D7DE0;
  v4[4] = self;
  v4[5] = v3;
  -[CLFitnessDailyAnalyticsAggregator queryTimeNonStatic:endDate:TimeNonStaticHandler:](self, "queryTimeNonStatic:endDate:TimeNonStaticHandler:", v4);
}

- (void)queryTimeNonStatic:(double)a3 endDate:(double)a4 TimeNonStaticHandler:(id)a5
{
  self->int fQueryState = 2;
  id v9 = [[CLOSTransaction alloc] initWithDescription:"CLFitnessDailyAnalyticsAggregator.MotionActivityQuery"];
  fMotionStateProxy = self->fMotionStateProxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1009D0A88;
  v11[3] = &unk_1022D7E08;
  *(double *)&v11[7] = a3;
  *(double *)&v11[8] = a4;
  v11[5] = v9;
  v11[6] = a5;
  v11[4] = self;
  [(CLMotionStateProtocol *)fMotionStateProxy queryMotionStatesWithStartTime:1 endTime:v11 isFromInternalClient:a3 withReply:a4];
}

- (void)sendFitnessAnalytics:(FitnessDailyMetric *)a3
{
  uint64_t v4 = a3->var3 + a3->var2;
  float var15 = a3->var15;
  BOOL v6 = var15 <= 0.0;
  float v7 = (double)v4 / (var15 * 24.0);
  if (v6) {
    float v8 = -1.0;
  }
  else {
    float v8 = v7;
  }
  v25[0] = @"age";
  v26[0] = +[NSNumber numberWithInt:a3->var13];
  v25[1] = @"calories";
  v26[1] = +[NSNumber numberWithUnsignedInt:v4];
  v25[2] = @"caloriesFromFirstPartyWorkouts";
  v26[2] = +[NSNumber numberWithUnsignedInt:a3->var9];
  v25[3] = @"caloriesFromFitnessPlusWorkouts";
  v26[3] = +[NSNumber numberWithUnsignedInt:a3->var10];
  v25[4] = @"caloriesFromThirdPartyWorkouts";
  v26[4] = +[NSNumber numberWithUnsignedInt:a3->var8 - a3->var9];
  v25[5] = @"distance";
  v26[5] = +[NSNumber numberWithUnsignedInt:a3->var5];
  v25[6] = @"exerciseMinutes";
  v26[6] = +[NSNumber numberWithUnsignedInt:a3->var7];
  v25[7] = @"flights";
  v26[7] = +[NSNumber numberWithUnsignedInt:a3->var4];
  v25[8] = @"gender";
  v26[8] = +[NSNumber numberWithInt:a3->var14];
  v25[9] = @"mets";
  *(float *)&double v9 = v8;
  v26[9] = +[NSNumber numberWithFloat:v9];
  v25[10] = @"nonPedWorkouts";
  v26[10] = +[NSNumber numberWithUnsignedInt:a3->var11];
  v25[11] = @"phoneFitnessMode";
  v26[11] = +[NSNumber numberWithUnsignedInt:a3->var20];
  v25[12] = @"steps";
  v26[12] = +[NSNumber numberWithDouble:(double)(a3->var6 / 0x64) * 100.0];
  v25[13] = @"timeNonPedWorkouts";
  v26[13] = +[NSNumber numberWithUnsignedInt:a3->var12];
  v25[14] = @"timeNonStatic";
  v26[14] = +[NSNumber numberWithUnsignedInt:a3->var16];
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:15];
  id v11 = +[NSMutableDictionary dictionary];
  [v11 addEntriesFromDictionary:v10];
  sub_100103240();
  if (sub_10016CCBC())
  {
    v23[0] = @"timeWatchConnected";
    v24[0] = +[NSNumber numberWithUnsignedInt:a3->var17];
    v23[1] = @"watchPaired";
    v24[1] = +[NSNumber numberWithBool:a3->var19];
    id v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    CFStringRef v13 = @"com.apple.CoreMotion.FitnessDailyPhone";
LABEL_8:
    [v11 addEntriesFromDictionary:v12];
    goto LABEL_10;
  }
  sub_100103240();
  if (sub_10010145C())
  {
    uint64_t v14 = a3->var22 + a3->var21;
    v21[0] = @"timePhoneConnected";
    v22[0] = +[NSNumber numberWithUnsignedInt:a3->var17];
    v21[1] = @"caloriesPhone";
    v22[1] = +[NSNumber numberWithUnsignedInt:v14];
    v21[2] = @"distancePhone";
    v22[2] = +[NSNumber numberWithUnsignedInt:a3->var24];
    v21[3] = @"flightsPhone";
    v22[3] = +[NSNumber numberWithUnsignedInt:a3->var23];
    v21[4] = @"stepsPhone";
    v22[4] = +[NSNumber numberWithUnsignedInt:a3->var25];
    id v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
    CFStringRef v13 = @"com.apple.CoreMotion.FitnessDailyWatch";
    goto LABEL_8;
  }
  CFStringRef v13 = &stru_10234F018;
LABEL_10:
  AnalyticsSendEventLazy();
  if (qword_102419270 != -1) {
    dispatch_once(&qword_102419270, &stru_1022D7E28);
  }
  __int16 v15 = qword_102419278;
  if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    CFStringRef v18 = v13;
    __int16 v19 = 2113;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CLFitnessDailyAnalyticsAggregator, sending %@, %{private}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419270 != -1) {
      dispatch_once(&qword_102419270, &stru_1022D7E28);
    }
    unsigned int v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator sendFitnessAnalytics:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
}

- (void)sendTimeInDaylightAnayltics:(FitnessDailyMetric *)a3
{
  sub_100103240();
  if (sub_10010145C())
  {
    v11[0] = @"timeInDaylight";
    v12[0] = +[NSNumber numberWithUnsignedInt:a3->var26];
    v11[1] = @"localDaytimeDuration";
    v12[1] = +[NSNumber numberWithInt:a3->var30];
    void v11[2] = @"ambientLightIntensityMin";
    v12[2] = +[NSNumber numberWithUnsignedInt:a3->var27];
    v11[3] = @"ambientLightIntensityMedian";
    v12[3] = +[NSNumber numberWithUnsignedInt:a3->var28];
    v11[4] = @"ambientLightIntensityMax";
    v12[4] = +[NSNumber numberWithUnsignedInt:a3->var29];
    v11[5] = @"ageBin";
    v12[5] = +[NSNumber numberWithInt:a3->var13];
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
    AnalyticsSendEventLazy();
    if (qword_102419270 != -1) {
      dispatch_once(&qword_102419270, &stru_1022D7E28);
    }
    double v5 = qword_102419278;
    if (os_log_type_enabled((os_log_t)qword_102419278, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412547;
      CFStringRef v8 = @"com.apple.CoreMotion.TimeInDaylight.Daily";
      __int16 v9 = 2113;
      uint64_t v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLFitnessDailyAnalyticsAggregator, sending %@, %{private}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419270 != -1) {
        dispatch_once(&qword_102419270, &stru_1022D7E28);
      }
      BOOL v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFitnessDailyAnalyticsAggregator sendTimeInDaylightAnayltics:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)attemptSendCoreAnalytics
{
  if (self)
  {
    [(CLFitnessDailyAnalyticsAggregator *)self getActivityStats];
    if (v3[0])
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      [(CLFitnessDailyAnalyticsAggregator *)self sendFitnessAnalytics:v3];
      [(CLFitnessDailyAnalyticsAggregator *)self sendTimeInDaylightAnayltics:v3];
      [(CLFitnessDailyAnalyticsAggregator *)self storeCache:self->fDataCache];
    }
  }
}

- (void).cxx_destruct
{
  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  uint64_t v4 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  double v5 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  BOOL v6 = self->fCompanionNotifierClient.__ptr_.__value_;
  self->fCompanionNotifierClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  float v7 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (v7)
  {
    CFStringRef v8 = *(void (**)(void))(*(void *)v7 + 8);
    v8();
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end