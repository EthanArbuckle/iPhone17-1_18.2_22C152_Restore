@interface CLMobilityBoutMetricsRecorderCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CLMobilityBoutMetricsRecorderCloudKitDelegate)initWithBoutMetricsRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CLMobilityBoutMetricsRecorderCloudKitDelegate

- (CLMobilityBoutMetricsRecorderCloudKitDelegate)initWithBoutMetricsRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMobilityBoutMetricsRecorderCloudKitDelegate;
  result = [(CLMobilityBoutMetricsRecorderCloudKitDelegate *)&v5 init];
  if (result) {
    result->fBoutMetricsDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"MobilityBout";
}

- (id)zoneName
{
  return @"MobilityMetricsZone";
}

- (id)dataFieldKey
{
  return @"boutData";
}

- (id)columns
{
  return @"startTime, endTime, stepCount, workoutType, terminationReason, numGaitMetrics, invalidGradePercentage, deviceSide, walkingSpeed, doubleSupportPercentage, stepLength, asymmetryPercentage, segmentsRejectedByIsSwingStanceCycle, segmentsRejectedByIsNotRunning, segmentsRejectedByIsFeasibleWalkingSpeed, segmentsRejectedByIsPendular, segmentsRejectedByIsSufficientVerticalTwist, segmentsRejectedByIsCadenceConcordant, walkingSpeedRejectionStatus, doubleSupportPercentageRejectionStatus, stepLengthRejectionStatus, asymmetryPercentageRejectionStatus, userHeight, isHeightSet, userWeight, isWeightSet, boundaryType, cycleTimeMean, stepLengthEntropy, stepLengthPoincareSD1, stepLengthPoincareSD2, cycleTimeEntropy, cycleTimePoincareSD1, cycleTimePoincareSD2, stepIndexOfHarmonicityAP, stepIndexOfHarmonicityML, stepIndexOfHarmonicityVT, swingIndexOfHarmonicityAP, swingIndexOfHarmonicityML, swingIndexOfHarmonicityVT";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v7 = 0;
  fBoutMetricsDb = self->fBoutMetricsDb;
  if (fBoutMetricsDb && !sub_1014C28B0((uint64_t)fBoutMetricsDb, (uint64_t *)a3, &v7))
  {
    if (qword_1024191F0 != -1) {
      dispatch_once(&qword_1024191F0, &stru_1022E7A18);
    }
    v4 = qword_1024191F8;
    if (os_log_type_enabled((os_log_t)qword_1024191F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191F0 != -1) {
        dispatch_once(&qword_1024191F0, &stru_1022E7A18);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobilityBoutMetricsRecorderCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v7;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fBoutMetricsDb = self->fBoutMetricsDb;
  if (fBoutMetricsDb) {
    BOOL v5 = *(void *)a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    int v11 = 0;
    int v14 = 0;
    long long v12 = 0u;
    memset(v13, 0, sizeof(v13));
    long long v15 = xmmword_101D813B0;
    int64x2_t v16 = vdupq_n_s64(0xFFF0000000000000);
    int64x2_t v17 = v16;
    double v18 = -INFINITY;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    float v25 = 1.7;
    unsigned __int8 v26 = 0;
    float v27 = 68.03;
    unsigned __int8 v28 = 0;
    BOOL v8 = sub_1014C2BBC((uint64_t)fBoutMetricsDb, (uint64_t)a3, (uint64_t)&v11);
    v9 = (sqlite3_stmt *)sub_10014D19C(*(void *)a4);
    if (v9)
    {
      if (v8)
      {
        v10 = v9;
        LOBYTE(v8) = 1;
        if (sub_100055D58(v9, 1, *(double *)&v12)
          && sub_100055D58(v10, 2, *((double *)&v12 + 1))
          && sub_100055B20(v10, 3, *(int *)v13)
          && sub_10014D1A4(v10, 4, *(int *)&v13[4])
          && sub_10014D1A4(v10, 5, *(int *)&v13[8])
          && sub_100055B20(v10, 6, *(int *)&v13[12])
          && sub_100055D58(v10, 7, *(double *)&v13[16])
          && sub_10014D1A4(v10, 8, v13[24])
          && sub_100055D58(v10, 9, *(double *)&v19)
          && sub_100055D58(v10, 10, *((double *)&v19 + 1))
          && sub_100055D58(v10, 11, *(double *)&v20)
          && sub_100055D58(v10, 12, *((double *)&v20 + 1))
          && sub_100055B20(v10, 13, SDWORD2(v22))
          && sub_100055B20(v10, 14, SHIDWORD(v22))
          && sub_100055B20(v10, 15, v23)
          && sub_100055B20(v10, 16, SDWORD1(v23))
          && sub_100055B20(v10, 17, SDWORD2(v23))
          && sub_100055B20(v10, 18, SHIDWORD(v23))
          && sub_100055B20(v10, 19, v24)
          && sub_100055B20(v10, 20, SDWORD1(v24))
          && sub_100055B20(v10, 21, SDWORD2(v24))
          && sub_100055B20(v10, 22, SHIDWORD(v24))
          && sub_100055D58(v10, 23, v25)
          && sub_10014D1A4(v10, 24, v26)
          && sub_100055D58(v10, 25, v27)
          && sub_10014D1A4(v10, 26, v28)
          && sub_10014D1A4(v10, 27, v14)
          && sub_100055D58(v10, 28, *(double *)&v15)
          && sub_100055D58(v10, 29, *((double *)&v15 + 1))
          && sub_100055D58(v10, 30, *(double *)v16.i64)
          && sub_100055D58(v10, 31, *(double *)&v16.i64[1])
          && sub_100055D58(v10, 32, *(double *)v17.i64)
          && sub_100055D58(v10, 33, *(double *)&v17.i64[1])
          && sub_100055D58(v10, 34, v18)
          && sub_100055D58(v10, 35, *(float *)&v21)
          && sub_100055D58(v10, 36, *((float *)&v21 + 1))
          && sub_100055D58(v10, 37, *((float *)&v21 + 2))
          && sub_100055D58(v10, 38, *((float *)&v21 + 3))
          && sub_100055D58(v10, 39, *(float *)&v22))
        {
          sub_100055D58(v10, 40, *((float *)&v22 + 1));
        }
      }
    }
  }
  return v8;
}

@end