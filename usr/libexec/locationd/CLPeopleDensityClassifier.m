@interface CLPeopleDensityClassifier
- (BOOL)ingestBTLEAdvertisement:(const void *)a3;
- (CLPeopleDensityMediumSignalClassifierConfig)classifierConfig;
- (NSDate)scanSessionStartTimestamp;
- (NSDate)scanSessionStopTimestamp;
- (id).cxx_construct;
- (id)initAndMarkScanningStarted:(id)a3;
- (id)isUserAloneAt:(double)a3 withHints:(id)a4;
- (void)dealloc;
- (void)markScanningStopped;
@end

@implementation CLPeopleDensityClassifier

- (id)initAndMarkScanningStarted:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLPeopleDensityClassifier;
  v4 = [(CLPeopleDensityClassifier *)&v8 init];
  id result = 0;
  if (a3)
  {
    if (v4)
    {
      v4->_classifierConfig = (CLPeopleDensityMediumSignalClassifierConfig *)[a3 copy];
      v4->_scanSessionStartTimestamp = +[NSDate date];
      memset(v6, 0, sizeof(v6));
      int v7 = 1065353216;
      sub_1005C2280((uint64_t)&v4->_advertisementsByAddress, (uint64_t *)v6);
      sub_1005C21B8((uint64_t)v6);
      return v4;
    }
  }
  return result;
}

- (BOOL)ingestBTLEAdvertisement:(const void *)a3
{
  p_advertisementsByAddress = &self->_advertisementsByAddress;
  if (!sub_100103284(&self->_advertisementsByAddress.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)a3))
  {
    memset(v11, 0, sizeof(v11));
    sub_1005C2114((char *)__p, (long long *)a3, (uint64_t)v11);
    sub_1005C237C((uint64_t)p_advertisementsByAddress, (unsigned __int8 *)__p, (uint64_t)__p);
    v15 = (void **)&v14;
    sub_1002E4F50(&v15);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    v15 = v11;
    sub_1002E4F50(&v15);
  }
  v5 = sub_100103284(p_advertisementsByAddress, (unsigned __int8 *)a3);
  if (!v5) {
    sub_10000EDDC("unordered_map::at: key not found");
  }
  v6 = v5;
  int v7 = (uint64_t *)(v5 + 40);
  unint64_t v8 = *((void *)v6 + 6);
  if (v8 >= *((void *)v6 + 7))
  {
    uint64_t v9 = sub_1005C2684(v7, (long long *)a3);
  }
  else
  {
    sub_1002E510C((uint64_t)v7, (long long *)a3);
    uint64_t v9 = v8 + 40;
  }
  *((void *)v6 + 6) = v9;
  return 1;
}

- (id)isUserAloneAt:(double)a3 withHints:(id)a4
{
  scanSessionStopTimestamp = self->_scanSessionStopTimestamp;
  if (!scanSessionStopTimestamp)
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022BD118);
    }
    v18 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Session hasn't stopped yet; failed to infer any people density result from the current session",
        buf,
        2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024195D0 == -1) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  if (-[NSDate compare:](scanSessionStopTimestamp, "compare:", self->_scanSessionStartTimestamp, a3) == NSOrderedAscending)
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022BD118);
    }
    v19 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Session stop time is earlier than the start time; failed to infer any people density result from the current session",
        buf,
        2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024195D0 == -1)
    {
LABEL_35:
      LOWORD(__p[0]) = 0;
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPeopleDensityClassifier isUserAloneAt:withHints:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
      return 0;
    }
LABEL_37:
    dispatch_once(&qword_1024195D0, &stru_1022BD118);
    goto LABEL_35;
  }
  *(_OWORD *)buf = 0u;
  long long v26 = 0u;
  int v27 = 1065353216;
  for (i = self->_advertisementsByAddress.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    int v7 = (long long *)i[5];
    unint64_t v8 = (long long *)i[6];
    while (v7 != v8)
    {
      if (*((char *)v7 + 23) < 0)
      {
        sub_1000DC48C(__p, *(void **)v7, *((void *)v7 + 1));
      }
      else
      {
        long long v9 = *v7;
        uint64_t v23 = *((void *)v7 + 2);
        *(_OWORD *)__p = v9;
      }
      long long v24 = *(long long *)((char *)v7 + 24);
      if ([(CLPeopleDensityMediumSignalClassifierConfig *)self->_classifierConfig isInMidRangeRssi:DWORD1(v24)])
      {
        sub_10029A978((uint64_t)buf, (unsigned __int8 *)__p, (uint64_t)__p);
        if (SHIBYTE(v23) < 0) {
          operator delete(__p[0]);
        }
        break;
      }
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
      int v7 = (long long *)((char *)v7 + 40);
    }
  }
  id v10 = objc_alloc((Class)NSDictionary);
  id v11 = [v10 initWithObjectsAndKeys:+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *((void *)&v26 + 1)), @"NumOfMidRangeRssiDevices", 0];
  id v12 = [objc_alloc((Class)NSDateInterval) initWithStartDate:self->_scanSessionStartTimestamp endDate:self->_scanSessionStopTimestamp];
  uint64_t v13 = *((void *)&v26 + 1);
  uint64_t v14 = [CLPeopleDensityResult alloc];
  if (v13) {
    uint64_t v15 = 100;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = [(CLPeopleDensityResult *)v14 initWithState:v15 confidence:v12 observationInterval:v11 additionalInfo:1.0];

  v17 = v16;
  sub_1002220F0((uint64_t)buf);
  return v16;
}

- (void)markScanningStopped
{
  if (!self->_scanSessionStopTimestamp) {
    self->_scanSessionStopTimestamp = +[NSDate date];
  }
}

- (void)dealloc
{
  if (qword_1024195D0 != -1) {
    dispatch_once(&qword_1024195D0, &stru_1022BD118);
  }
  v3 = qword_1024195D8;
  if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
  {
    scanSessionStartTimestamp = self->_scanSessionStartTimestamp;
    *(_DWORD *)buf = 138477827;
    id v11 = scanSessionStartTimestamp;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Dealloc classification session: start,%{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022BD118);
    }
    v5 = self->_scanSessionStartTimestamp;
    int v8 = 138477827;
    long long v9 = v5;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensityClassifier dealloc]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)CLPeopleDensityClassifier;
  [(CLPeopleDensityClassifier *)&v7 dealloc];
}

- (CLPeopleDensityMediumSignalClassifierConfig)classifierConfig
{
  return self->_classifierConfig;
}

- (NSDate)scanSessionStartTimestamp
{
  return self->_scanSessionStartTimestamp;
}

- (NSDate)scanSessionStopTimestamp
{
  return self->_scanSessionStopTimestamp;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end