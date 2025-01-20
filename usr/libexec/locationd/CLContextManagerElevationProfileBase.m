@interface CLContextManagerElevationProfileBase
+ (BOOL)isQueryValidWithStartTime:(double)a3 andEndTime:(double)a4;
- (BOOL)isElevationDbInMemory;
- (BOOL)isLocationUsefulForCalibration:(int)a3;
- (BOOL)registeredXPCTaskElevationProfile;
- (BOOL)registeredXPCTaskMSLP;
- (CLContextManagerElevationProfileBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLElevationProfileEstimator)elevationProfileEstimator;
- (void)dealloc;
- (void)elevationDb;
- (void)fetchElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(id)a5 andElevationArray:(id)a6;
- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8;
- (void)getHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5;
- (void)initElevationProfileEstimator:(id)a3 withElevationDbInMemory:(BOOL)a4;
- (void)pushElevationsFromTime:(double)a3 toTime:(double)a4;
- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7;
- (void)setElevationDb:(void *)a3;
- (void)setElevationProfileEstimator:(id)a3;
- (void)setIsElevationDbInMemory:(BOOL)a3;
- (void)setRegisteredXPCTaskElevationProfile:(BOOL)a3;
- (void)setRegisteredXPCTaskMSLP:(BOOL)a3;
@end

@implementation CLContextManagerElevationProfileBase

- (CLContextManagerElevationProfileBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CLContextManagerElevationProfileBase;
  v6 = [(CLBarometerCalibrationContextManager *)&v10 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  if (v6)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10231E7F8);
    }
    v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Elevation Profile Context created", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231E7F8);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfileBase initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_elevationProfileEstimator = 0;
  elevationDb = self->_elevationDb;
  if (elevationDb) {
    (*(void (**)(void *))(*(void *)elevationDb + 24))(elevationDb);
  }
  self->_elevationDb = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLContextManagerElevationProfileBase;
  [(CLBarometerCalibrationContextManager *)&v4 dealloc];
}

- (void)initElevationProfileEstimator:(id)a3 withElevationDbInMemory:(BOOL)a4
{
  self->_elevationProfileEstimator = [[CLElevationProfileEstimator alloc] initWithContextManager:a3];
  self->_isElevationDbInMemory = a4;
  operator new();
}

- (void)getHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5
{
  elevationProfileEstimator = self->_elevationProfileEstimator;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1012CF7A4;
  v6[3] = &unk_10231E7D8;
  v6[4] = a5;
  [(CLElevationProfileEstimator *)elevationProfileEstimator computeHistoricalMeanSeaLevelPressureWithStartTime:v6 andEndTime:a3 andCompletionBlock:a4];
}

- (void)pushElevationsFromTime:(double)a3 toTime:(double)a4
{
}

- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7
{
}

- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8
{
  id v9 = [objc_alloc((Class)NSError) initWithDomain:CMErrorDomain code:103 userInfo:&off_1023977C0];
  (*((void (**)(id, id))a8 + 2))(a8, v9);
}

- (void)fetchElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(id)a5 andElevationArray:(id)a6
{
  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:](CLContextManagerElevationProfileBase, "isQueryValidWithStartTime:andEndTime:"))
  {
    memset(__p, 0, 24);
    elevationDb = self->_elevationDb;
    if (elevationDb)
    {
      sub_101130EBC((uint64_t)elevationDb, 0, (int)[a5 intValue], __p, a3, a4);
      v12 = (double *)__p[0];
      for (i = (double *)__p[1]; v12 != i; v12 += 8)
      {
        double v14 = v12[4];
        double v15 = v12[6];
        v16 = objc_alloc_init(CLElevationDBEntry);
        [(CLElevationDBEntry *)v16 setTimestamp:v14];
        [(CLElevationDBEntry *)v16 setPressure:v15];
        [a6 addObject:v16];
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231E7F8);
      }
      v17 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        *(void *)&double v24 = ((char *)__p[1] - (char *)__p[0]) >> 6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "received stored elevations,count,%{public}lu", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231E7F8);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]", "%s\n", v18);
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231E7F8);
      }
      v21 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "invalid elevationDb", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231E7F8);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]", "%s\n", v18);
    }
    if (v18 != (char *)buf) {
      free(v18);
    }
LABEL_27:
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    return;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10231E7F8);
  }
  v19 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    double v24 = a3;
    __int16 v25 = 2048;
    double v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "query stored elevations with false startTime,%f,endTime,%f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10231E7F8);
    }
    LODWORD(__p[0]) = 134218240;
    *(void **)((char *)__p + 4) = *(void **)&a3;
    WORD2(__p[1]) = 2048;
    *(void **)((char *)&__p[1] + 6) = *(void **)&a4;
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]", "%s\n", v20);
    if (v20 != (char *)buf) {
      free(v20);
    }
  }
}

- (BOOL)isLocationUsefulForCalibration:(int)a3
{
  return (a3 < 0xC) & (0xC12u >> a3);
}

+ (BOOL)isQueryValidWithStartTime:(double)a3 andEndTime:(double)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL result = 0;
  BOOL v9 = a3 >= a4 || a4 == 1.79769313e308 || a3 == 1.79769313e308;
  if (!v9 && a3 > 0.0 && a4 > 0.0 && Current >= a3) {
    return Current + 29.72 >= a4;
  }
  return result;
}

- (BOOL)registeredXPCTaskMSLP
{
  return self->_registeredXPCTaskMSLP;
}

- (void)setRegisteredXPCTaskMSLP:(BOOL)a3
{
  self->_registeredXPCTaskMSLP = a3;
}

- (BOOL)registeredXPCTaskElevationProfile
{
  return self->_registeredXPCTaskElevationProfile;
}

- (void)setRegisteredXPCTaskElevationProfile:(BOOL)a3
{
  self->_registeredXPCTaskElevationProfile = a3;
}

- (CLElevationProfileEstimator)elevationProfileEstimator
{
  return self->_elevationProfileEstimator;
}

- (void)setElevationProfileEstimator:(id)a3
{
  self->_elevationProfileEstimator = (CLElevationProfileEstimator *)a3;
}

- (void)elevationDb
{
  return self->_elevationDb;
}

- (void)setElevationDb:(void *)a3
{
  self->_elevationDb = a3;
}

- (BOOL)isElevationDbInMemory
{
  return self->_isElevationDbInMemory;
}

- (void)setIsElevationDbInMemory:(BOOL)a3
{
  self->_isElevationDbInMemory = a3;
}

@end