@interface CMStrideCalRecorderCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CMStrideCalRecorderCloudKitDelegate)initWithStrideCalRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CMStrideCalRecorderCloudKitDelegate

- (CMStrideCalRecorderCloudKitDelegate)initWithStrideCalRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMStrideCalRecorderCloudKitDelegate;
  result = [(CMStrideCalRecorderCloudKitDelegate *)&v5 init];
  if (result) {
    result->fStrideCalRecorderDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"StrideCalibrationHistory";
}

- (id)zoneName
{
  return @"StrideCalibrationHistoryZone";
}

- (id)dataFieldKey
{
  return @"trackData";
}

- (id)columns
{
  return @"startTime, pacebin, kvalue, kvalueTrack, score, endTime, distance, steps, session, speed, percentGrade, gpsSource, runningFormStrideLength, runningFormStrideLengthMetrics";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v7 = 0;
  fStrideCalRecorderDb = self->fStrideCalRecorderDb;
  if (fStrideCalRecorderDb && !sub_1012167B4((uint64_t)fStrideCalRecorderDb, (uint64_t *)a3, &v7))
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1023243C8);
    }
    v4 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1023243C8);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalRecorderCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v7;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fStrideCalRecorderDb = self->fStrideCalRecorderDb;
  if (fStrideCalRecorderDb) {
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
    BOOL v7 = sub_101216AE4((uint64_t)fStrideCalRecorderDb, (uint64_t)a3, (uint64_t)v12);
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
      if (sub_100055D58(v8, 1, v13)
        && sub_100055B20(v10, 2, v14)
        && sub_100055D58(v10, 3, v15)
        && sub_100055D58(v10, 4, v16)
        && sub_100055D58(v10, 5, v17)
        && sub_100055D58(v10, 6, v18)
        && sub_100055D58(v10, 7, v19)
        && sub_10014D1A4(v10, 8, v20)
        && sub_10014D1A4(v10, 9, v21)
        && sub_100055D58(v10, 10, v22)
        && sub_100055D58(v10, 11, v23)
        && sub_10014D1A4(v10, 12, v24)
        && sub_100055D58(v10, 13, v25))
      {
        sub_10014D1A4(v10, 14, v26);
      }
    }
  }
  return v7;
}

@end