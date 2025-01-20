@interface CMStrideCalibrationDatabase
- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3;
- (BOOL)isCalibrationConvergedStdForBinWithSpeed:(double)a3;
- (BOOL)queryStrideLengthTracks:(void *)a3;
- (CMStrideCalibrationDatabase)initWithSilo:(id)a3;
- (CMStrideCalibrationDatabaseDelegate)delegate;
- (id).cxx_construct;
- (id)copyHistory;
- (void)addEntry:(CLStrideCalEntry *)a3;
- (void)registerStrideCalDbForColdStorage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CMStrideCalibrationDatabase

- (CMStrideCalibrationDatabase)initWithSilo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMStrideCalibrationDatabase;
  if ([(CMStrideCalibrationDatabase *)&v6 init])
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F49D0);
    }
    v3 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "StrideCalDb init", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022F49D0);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase initWithSilo:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    operator new();
  }
  return 0;
}

- (void)addEntry:(CLStrideCalEntry *)a3
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022F49D0);
  }
  v5 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    double startTime = a3->startTime;
    *(_DWORD *)buf = 134217984;
    double v9 = startTime;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "insertion startTime %f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F49D0);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase addEntry:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  sub_100D57284((uint64_t)self->fStrideCalDb.__ptr_.__value_, (uint64_t)a3);
}

- (BOOL)isCalibrationConvergedStdForBinWithSpeed:(double)a3
{
  v4 = sub_101218444((uint64_t)self->fStrideCalDb.__ptr_.__value_, a3);
  if ([(NSArray *)v4 count] < 0xA) {
    return 0;
  }
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    [v4 objectAtIndex:v5].getBytes:v15, 120);
    double v6 = v6 + v16;
    ++v5;
  }
  while (v5 != 10);
  uint64_t v7 = 0;
  double v8 = 0.0;
  double v9 = v6 / 10.0;
  do
  {
    [v4 objectAtIndex:v7].getBytes:v15, 120);
    double v8 = v8 + (v16 - v9) * (v16 - v9);
    ++v7;
  }
  while (v7 != 10);
  double v10 = v8 / 10.0;
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022F49D0);
  }
  v11 = qword_102419038;
  double v12 = sqrt(v10);
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v22 = a3;
    __int16 v23 = 2048;
    double v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Speed,%f,KFactorStd,%0.4f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F49D0);
    }
    int v17 = 134218240;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = v12;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase isCalibrationConvergedStdForBinWithSpeed:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  return v12 < 0.025;
}

- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3
{
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  v4 = sub_101218444((uint64_t)self->fStrideCalDb.__ptr_.__value_, a3);
  double v12 = off_1022B2000;
  int v13 = 5;
  memset(v14, 0, sizeof(v14));
  v16[0] = 0;
  v16[1] = 0;
  v15 = v16;
  sub_10041F400(&v12);
  if ([(NSArray *)v4 count] < 5) {
    goto LABEL_11;
  }
  for (uint64_t i = 0; i != 5; ++i)
  {
    [v4 objectAtIndexedSubscript:i].getBytes:v17 length:120];
    sub_10007EEB4((uint64_t)&v12, (double *)&v17[1] + 1);
  }
  double v11 = 0.0;
  if (sub_10007EDE0(&v12, 2, &v11))
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F49D0);
    }
    double v6 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v24 = a3;
      __int16 v25 = 2048;
      double v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Median kValue pacebin with rawSpeed %f: %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022F49D0);
      }
      int v19 = 134218240;
      double v20 = a3;
      __int16 v21 = 2048;
      double v22 = v11;
      double v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase isCalibrationConvergedMedianForSpeed:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [+[CMPedometerTableRawSpeedToKValue sharedInstance] kValueForRawSpeed:a3];
    BOOL v8 = fabs((v7 - v11) / v11) < 0.05;
  }
  else
  {
LABEL_11:
    BOOL v8 = 0;
  }
  double v12 = off_1022B2000;
  sub_1000F5BB0((uint64_t)&v15, v16[0]);
  sub_10041F48C(v14);
  return v8;
}

- (id)copyHistory
{
  int v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  (*(void (**)(CMStrideCalRecorderDb *, unsigned char **))(*(void *)self->fStrideCalDb.__ptr_.__value_ + 40))(self->fStrideCalDb.__ptr_.__value_, &v17);
  v2 = +[NSMutableArray arrayWithCapacity:0xEEEEEEEEEEEEEEEFLL * ((v18 - v17) >> 3)];
  v3 = v17;
  v4 = v18;
  if (v17 != v18)
  {
    do
    {
      id v5 = objc_alloc((Class)CMStrideCalibrationEntryInternal);
      long long v6 = *v3;
      long long v7 = v3[1];
      long long v8 = v3[3];
      v15[2] = v3[2];
      v15[3] = v8;
      v15[0] = v6;
      v15[1] = v7;
      long long v9 = v3[4];
      long long v10 = v3[5];
      long long v11 = v3[6];
      uint64_t v16 = *((void *)v3 + 14);
      v15[5] = v10;
      v15[6] = v11;
      v15[4] = v9;
      id v12 = [v5 initWithCLStrideCalEntry:v15];
      [(NSMutableArray *)v2 addObject:v12];

      v3 = (_OWORD *)((char *)v3 + 120);
    }
    while (v3 != v4);
  }
  id v13 = [objc_alloc((Class)NSArray) initWithArray:v2];
  if (v17)
  {
    uint64_t v18 = v17;
    operator delete(v17);
  }
  return v13;
}

- (BOOL)queryStrideLengthTracks:(void *)a3
{
  return sub_101218878((uint64_t)self->fStrideCalDb.__ptr_.__value_);
}

- (void)registerStrideCalDbForColdStorage:(id)a3
{
  if (a3)
  {
    value = self->fStrideCalDb.__ptr_.__value_;
    if (value)
    {
      id v5 = +[CLActivityRecorderUtils getDbDetails:(char *)value + 72];
      id v6 = [v5 objectForKeyedSubscript:@"url"];
      id v7 = [v5 objectForKeyedSubscript:@"name"];
      [a3 registerDatabaseAtURL:v6 tableName:v7 isClassB:0 sourceDevice:0 cloudKitDelegate:0];
    }
  }
}

- (CMStrideCalibrationDatabaseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMStrideCalibrationDatabaseDelegate *)a3;
}

- (void).cxx_destruct
{
  value = self->fStrideCalDb.__ptr_.__value_;
  self->fStrideCalDb.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 24))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end