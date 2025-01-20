@interface CLWalkingSpeedCalCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CLWalkingSpeedCalCloudKitDelegate)initWithWalkingSpeedCalRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CLWalkingSpeedCalCloudKitDelegate

- (CLWalkingSpeedCalCloudKitDelegate)initWithWalkingSpeedCalRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLWalkingSpeedCalCloudKitDelegate;
  result = [(CLWalkingSpeedCalCloudKitDelegate *)&v5 init];
  if (result) {
    result->fWalkingSpeedCalDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"WalkingSpeedStrideCalibration";
}

- (id)zoneName
{
  return @"WalkingSpeedStrideCalZone";
}

- (id)dataFieldKey
{
  return @"gaitData";
}

- (id)columns
{
  return @"startTime, endTime, cadenceWatch, cadenceGaitCycle, meanWalkingSpeed, gaitCycleYield";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v7 = 0;
  fWalkingSpeedCalDb = self->fWalkingSpeedCalDb;
  if (fWalkingSpeedCalDb && !sub_1009E50D0((uint64_t)fWalkingSpeedCalDb, (uint64_t *)a3, &v7))
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022C6CC8);
    }
    v4 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022C6CC8);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWalkingSpeedCalCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v7;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fWalkingSpeedCalDb = self->fWalkingSpeedCalDb;
  if (fWalkingSpeedCalDb) {
    BOOL v5 = *(void *)a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    BOOL v7 = sub_1009E5404((uint64_t)fWalkingSpeedCalDb, (uint64_t)a3, (uint64_t)&v12);
    v8 = (sqlite3_stmt *)sub_10014D19C(*(void *)a4);
    if (v8) {
      BOOL v9 = !v7;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      v10 = v8;
      LOBYTE(v7) = 1;
      if (sub_100055D58(v8, 1, *(double *)&v12)
        && sub_100055D58(v10, 2, *((double *)&v12 + 1))
        && sub_100055D58(v10, 3, *(double *)&v13)
        && sub_100055D58(v10, 4, *((double *)&v13 + 1))
        && sub_100055D58(v10, 5, *(double *)&v14))
      {
        sub_100055D58(v10, 6, *((double *)&v14 + 1));
      }
    }
  }
  return v7;
}

@end