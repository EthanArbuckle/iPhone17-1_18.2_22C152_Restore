@interface CLLocationCorrectiveCompensator
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLLocationCorrectiveCompensator)init;
- (void)beginService;
- (void)endService;
- (void)snapLocation:(id)a3 withReply:(id)a4;
@end

@implementation CLLocationCorrectiveCompensator

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
  if (qword_10247E6B0 != -1) {
    dispatch_once(&qword_10247E6B0, &stru_1022CE1E8);
  }
  return (id)qword_10247E6A8;
}

- (CLLocationCorrectiveCompensator)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationCorrectiveCompensator;
  return [(CLLocationCorrectiveCompensator *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLocationCorrectiveCompensatorProtocol outboundProtocol:&OBJC_PROTOCOL___CLLocationCorrectiveCompensatorClientProtocol];
}

- (void)beginService
{
  self->_coarseLocationProvider = (GEOCoarseLocationProvider *)objc_alloc_init((Class)GEOCoarseLocationProvider);
}

- (void)endService
{
  self->_coarseLocationProvider = 0;
}

- (void)snapLocation:(id)a3 withReply:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v34 = 0u;
    memset(v35, 0, 28);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  long long v26 = v33;
  long long v27 = v34;
  *(_OWORD *)v28 = v35[0];
  *(_OWORD *)&v28[12] = *(_OWORD *)((char *)v35 + 12);
  v25[2] = *(_OWORD *)&buf[32];
  v25[3] = v30;
  v25[4] = v31;
  v25[5] = v32;
  v25[0] = *(_OWORD *)buf;
  v25[1] = *(_OWORD *)&buf[16];
  id v6 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:COERCE_DOUBLE(*(_OWORD *)buf >> 32), *(double *)((char *)v25 + 12)];
  v7 = v6;
  if (v6)
  {
    [v6 setTimestamp:*(double *)((char *)&v25[4] + 12)];
    [v7 setAltitude:(int)*(double *)((char *)&v25[1] + 12)];
    [v7 setHorizontalAccuracy:*(double *)((char *)&v25[1] + 4)];
    [v7 setVerticalAccuracy:*(double *)((char *)&v25[2] + 4)];
    if (*(_DWORD *)&v28[4] == 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (*(_DWORD *)&v28[4] == 2);
    }
    [v7 setReferenceFrame:v8];
    if (*(double *)((char *)&v25[2] + 12) > -1.0) {
      [v7 setSpeed:*(double *)((char *)&v25[2] + 12)];
    }
    if (*(double *)((char *)&v25[3] + 12) < 360.0 && *(double *)((char *)&v25[3] + 12) >= 0.0) {
      [v7 setCourse:];
    }
  }
  id v9 = v7;
  if (v9)
  {
    id v10 = v9;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CE230);
    }
    v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)buf = 68289539;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(void *)&buf[26] = v25;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location #compensation gonna be Snapping\", \"Input\":%{private, location:CLClientLocation}.*P}", buf, 0x22u);
    }
    coarseLocationProvider = self->_coarseLocationProvider;
    id v13 = [[-[CLLocationCorrectiveCompensator universe](self, "universe") silo] queue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    long long v21 = v26;
    long long v22 = v27;
    v23[0] = *(_OWORD *)v28;
    *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)&v28[12];
    long long v17 = v25[2];
    long long v18 = v25[3];
    long long v19 = v25[4];
    long long v20 = v25[5];
    long long v15 = v25[0];
    long long v16 = v25[1];
    v14[2] = sub_10087FAA0;
    v14[3] = &unk_1022CE210;
    v14[4] = a4;
    [(GEOCoarseLocationProvider *)coarseLocationProvider fetchCoarseEquivalentForLocation:v10 callbackQueue:v13 callback:v14];
  }
  else
  {
    v24[6] = xmmword_101D82F18;
    v24[7] = xmmword_101D82F28;
    memset(&v24[8], 0, 28);
    v24[2] = xmmword_101D82ED8;
    v24[3] = xmmword_101D82EE8;
    v24[4] = xmmword_101D82EF8;
    v24[5] = xmmword_101D82F08;
    v24[0] = xmmword_101D82EB8;
    v24[1] = xmmword_101D82EC8;
    (*((void (**)(id, id, uint64_t, void))a4 + 2))(a4, [objc_alloc((Class)CLLocation) initWithClientLocation:v24], 1, 0);
  }
}

@end