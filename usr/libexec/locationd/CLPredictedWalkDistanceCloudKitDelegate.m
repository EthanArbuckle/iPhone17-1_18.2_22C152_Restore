@interface CLPredictedWalkDistanceCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CLPredictedWalkDistanceCloudKitDelegate)initWithPredictedWalkDistanceBoutRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CLPredictedWalkDistanceCloudKitDelegate

- (CLPredictedWalkDistanceCloudKitDelegate)initWithPredictedWalkDistanceBoutRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLPredictedWalkDistanceCloudKitDelegate;
  result = [(CLPredictedWalkDistanceCloudKitDelegate *)&v5 init];
  if (result) {
    result->fPredictedWalkDistanceBoutDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"PredictedWalkingDistanceBout";
}

- (id)zoneName
{
  return @"PredictedWalkingDistanceZone";
}

- (id)dataFieldKey
{
  return @"boutData";
}

- (id)columns
{
  return @"startTime, endTime, stepCount, distance, activeTime, elevationAscended, elevationDescended, stepCountGPS, distanceGPS, boutType";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v7 = 0;
  fPredictedWalkDistanceBoutDb = self->fPredictedWalkDistanceBoutDb;
  if (fPredictedWalkDistanceBoutDb && !sub_101191F24((uint64_t)fPredictedWalkDistanceBoutDb, (uint64_t *)a3, &v7))
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022AD698);
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
        dispatch_once(&qword_102419200, &stru_1022AD698);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v7;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fPredictedWalkDistanceBoutDb = self->fPredictedWalkDistanceBoutDb;
  if (fPredictedWalkDistanceBoutDb) {
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
    int v11 = 0;
    double v12 = 0.0;
    double v13 = 0.0;
    int v14 = 0;
    double v16 = 0.0;
    uint64_t v17 = 0;
    double v15 = 0.0;
    int v18 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v22 = 0;
    BOOL v7 = sub_101192280((uint64_t)fPredictedWalkDistanceBoutDb, (uint64_t)a3, (uint64_t)&v11);
    v8 = (sqlite3_stmt *)sub_10014D19C(*(void *)a4);
    if (v8)
    {
      if (v7)
      {
        v9 = v8;
        LOBYTE(v7) = 1;
        if (sub_100055D58(v8, 1, v12)
          && sub_100055D58(v9, 2, v13)
          && sub_100055B20(v9, 3, v14)
          && sub_100055D58(v9, 4, v15)
          && sub_100055D58(v9, 5, v16)
          && sub_100055B20(v9, 6, v17)
          && sub_100055B20(v9, 7, SHIDWORD(v17))
          && sub_100055B20(v9, 8, v18)
          && sub_100055D58(v9, 9, *(double *)&v19))
        {
          sub_10014D1A4(v9, 10, SDWORD2(v19));
        }
      }
    }
  }
  return v7;
}

@end