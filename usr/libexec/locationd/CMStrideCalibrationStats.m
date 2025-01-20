@interface CMStrideCalibrationStats
- (CMStrideCalibrationStats)init;
- (id).cxx_construct;
- (void)activityLoggerLogStrideCalEntry:(const CLStrideCalEntry *)a3;
- (void)awdLogDistance:(double)a3 status:(int)a4 description:(id)a5;
- (void)awdMotionFitnessStrideCalibration:(const CLStrideCalEntry *)a3;
- (void)endSessionMetrics:(double)a3;
- (void)loadLastAWDTimestamps;
- (void)setReadyForSubmission;
- (void)startSessionMetricsWithTime:(double)a3 session:(int)a4;
- (void)storeLastAWDTimestamps;
- (void)updateUserHeight:(int64_t)a3;
@end

@implementation CMStrideCalibrationStats

- (CMStrideCalibrationStats)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMStrideCalibrationStats;
  v2 = [(CMStrideCalibrationStats *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CMStrideCalibrationStats *)v2 startSessionMetricsWithTime:0 session:0.0];
    [(CMStrideCalibrationStats *)v3 loadLastAWDTimestamps];
  }
  return v3;
}

- (void)startSessionMetricsWithTime:(double)a3 session:(int)a4
{
  sub_10098C454((uint64_t)v8, a4, a3);
  long long v5 = v8[3];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceFailOther = v8[2];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceFailPedometer = v5;
  long long v6 = v8[5];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceInvalidGain = v8[4];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceInvalidLength = v6;
  long long v7 = v8[1];
  *(_OWORD *)&self->fSessionMetrics.session = v8[0];
  *(_OWORD *)&self->fSessionMetrics.endTime = v7;
}

- (void)endSessionMetrics:(double)a3
{
  p_fSessionMetrics = &self->fSessionMetrics;
  int session = self->fSessionMetrics.session;
  self->fSessionMetrics.double endTime = a3;
  if (session)
  {
    sub_1015775C8(buf, 0);
    memset(v47, 0, 56);
    sub_1015797B4((uint64_t)buf, 0, (uint64_t)v47, self->fSessionMetrics.startTime, self->fSessionMetrics.endTime);
    double v6 = *(double *)&v47[8];
    self->fSessionMetrics.totalDistance = *(double *)&v47[8];
    double sumCalibrationDistanceFailGps = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    double v8 = self->fSessionMetrics.sumCalibrationDistanceFailPedometer
       + self->fSessionMetrics.sumCalibrationDistanceInvalidLength
       + self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    self->fSessionMetrics.double sumCalibrationDistanceFailPedometer = v8;
    double sumCalibrationDistanceSuccess = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    double sumCalibrationDistanceFailGradient = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    double v11 = v6 - sumCalibrationDistanceSuccess - sumCalibrationDistanceFailGps - v8 - sumCalibrationDistanceFailGradient;
    self->fSessionMetrics.double sumCalibrationDistanceFailOther = v11;
    v12 = (double *)operator new(0x28uLL);
    v13 = v12;
    double *v12 = sumCalibrationDistanceSuccess;
    v12[1] = v11;
    v12[2] = sumCalibrationDistanceFailGps;
    v12[3] = v8;
    uint64_t v14 = 1;
    v15 = v12;
    v12[4] = sumCalibrationDistanceFailGradient;
    do
    {
      if (sumCalibrationDistanceSuccess < v12[v14])
      {
        double sumCalibrationDistanceSuccess = v12[v14];
        v15 = &v12[v14];
      }
      ++v14;
    }
    while (v14 != 5);
    unint64_t v16 = (char *)v15 - (char *)v12;
    int v17 = p_fSessionMetrics->session;
    if (p_fSessionMetrics->session == 15) {
      goto LABEL_9;
    }
    if (v17 == 17)
    {
      uint64_t v19 = sub_1001A58C0();
      sub_1014313B0(v19, v16 >> 3);
      goto LABEL_11;
    }
    if (v17 == 24)
    {
LABEL_9:
      uint64_t v18 = sub_1001A58C0();
      sub_101431314(v18, v16 >> 3);
    }
LABEL_11:
    uint64_t v20 = sub_1001A58C0();
    long long v21 = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceFailPedometer;
    v46[2] = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceFailOther;
    v46[3] = v21;
    long long v22 = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceInvalidLength;
    v46[4] = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceInvalidGain;
    v46[5] = v22;
    long long v23 = *(_OWORD *)&p_fSessionMetrics->endTime;
    v46[0] = *(_OWORD *)&p_fSessionMetrics->session;
    v46[1] = v23;
    sub_101431E74(v20, v46);
    operator delete(v13);
    sub_1015776E4(buf);
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022D62E8);
  }
  v24 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    double v25 = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    double sumCalibrationDistanceFailOther = self->fSessionMetrics.sumCalibrationDistanceFailOther;
    double v27 = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    double sumCalibrationDistanceFailPedometer = self->fSessionMetrics.sumCalibrationDistanceFailPedometer;
    double v29 = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    double sumCalibrationDistanceInvalidGain = self->fSessionMetrics.sumCalibrationDistanceInvalidGain;
    double sumCalibrationDistanceInvalidSpeed = self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    double sumCalibrationDistanceInvalidLength = self->fSessionMetrics.sumCalibrationDistanceInvalidLength;
    double startTime = self->fSessionMetrics.startTime;
    double endTime = self->fSessionMetrics.endTime;
    *(_DWORD *)buf = 134220288;
    double v57 = v25;
    __int16 v58 = 2048;
    double v59 = sumCalibrationDistanceFailOther;
    __int16 v60 = 2048;
    double v61 = v27;
    __int16 v62 = 2048;
    double v63 = sumCalibrationDistanceFailPedometer;
    __int16 v64 = 2048;
    double v65 = v29;
    __int16 v66 = 2048;
    double v67 = sumCalibrationDistanceInvalidGain;
    __int16 v68 = 2048;
    double v69 = sumCalibrationDistanceInvalidSpeed;
    __int16 v70 = 2048;
    double v71 = sumCalibrationDistanceInvalidLength;
    __int16 v72 = 2048;
    double v73 = startTime;
    __int16 v74 = 2048;
    double v75 = endTime;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "SessionMetrics,End,Summary,DistanceFusionSuccess,%0.6f,DistanceFusionOther,%0.6f,DistanceFusionGPS,%0.6f,DistanceFusionPedometer,%0.6f,DistanceFusionGradient,%0.6f,DistanceFusionGain,%0.6f,DistanceFusionSpeed,%0.6f,DistanceFusionLength,%0.6f,startTime,%0.6f,endTime,%0.6f", buf, 0x66u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022D62E8);
    }
    double v35 = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    double v36 = self->fSessionMetrics.sumCalibrationDistanceFailOther;
    double v37 = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    double v38 = self->fSessionMetrics.sumCalibrationDistanceFailPedometer;
    double v39 = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    double v40 = self->fSessionMetrics.sumCalibrationDistanceInvalidGain;
    double v41 = self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    double v42 = self->fSessionMetrics.sumCalibrationDistanceInvalidLength;
    double v43 = self->fSessionMetrics.startTime;
    double v44 = self->fSessionMetrics.endTime;
    *(_DWORD *)v47 = 134220288;
    *(double *)&v47[4] = v35;
    *(_WORD *)&v47[12] = 2048;
    *(double *)&v47[14] = v36;
    *(_WORD *)&v47[22] = 2048;
    *(double *)&v47[24] = v37;
    *(_WORD *)&v47[32] = 2048;
    *(double *)&v47[34] = v38;
    *(_WORD *)&v47[42] = 2048;
    *(double *)&v47[44] = v39;
    *(_WORD *)&v47[52] = 2048;
    *(double *)&v47[54] = v40;
    __int16 v48 = 2048;
    double v49 = v41;
    __int16 v50 = 2048;
    double v51 = v42;
    __int16 v52 = 2048;
    double v53 = v43;
    __int16 v54 = 2048;
    double v55 = v44;
    v45 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationStats endSessionMetrics:]", "%s\n", v45);
    if (v45 != (char *)buf) {
      free(v45);
    }
  }
}

- (void)setReadyForSubmission
{
  uint64_t v2 = sub_1001A58C0();

  sub_101431654(v2);
}

- (void)awdLogDistance:(double)a3 status:(int)a4 description:(id)a5
{
  if (a4 > 7)
  {
    v9 = @"Other";
    uint64_t v8 = 40;
  }
  else
  {
    uint64_t v8 = 8 * a4 + 32;
    v9 = *(&off_1022D6328 + a4);
  }
  *(double *)((char *)&self->super.isa + v8) = *(double *)((char *)&self->super.isa + v8) + a3;
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022D62E8);
  }
  v10 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      double v11 = "Fail";
    }
    else {
      double v11 = "Success";
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = v11;
    __int16 v15 = 2080;
    id v16 = [(__CFString *)v9 UTF8String];
    __int16 v17 = 2080;
    id v18 = [a5 UTF8String];
    __int16 v19 = 2048;
    double v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "SessionMetrics,%s,%s,%s,DistanceFusion,%0.4f", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022D62E8);
    }
    [(__CFString *)v9 UTF8String];
    [a5 UTF8String];
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationStats awdLogDistance:status:description:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
}

- (void)activityLoggerLogStrideCalEntry:(const CLStrideCalEntry *)a3
{
  long long v5 = objc_alloc_init(ALActivityLog);
  [(ALActivityLog *)v5 setTimestamp:a3->startTime];
  [(ALActivityLog *)v5 setStrideCalData:objc_alloc_init(ALCLStrideCalEntry)];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setRecordId:a3->recordId];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setStartTime:a3->startTime];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setPacebin:a3->pacebin];
  float kvalue = a3->kvalue;
  long long v7 = [(ALActivityLog *)v5 strideCalData];
  *(float *)&double v8 = kvalue;
  [(ALCLStrideCalEntry *)v7 setKvalue:v8];
  float kvalueTrack = a3->kvalueTrack;
  v10 = [(ALActivityLog *)v5 strideCalData];
  *(float *)&double v11 = kvalueTrack;
  [(ALCLStrideCalEntry *)v10 setKvalueTrack:v11];
  float score = a3->score;
  v13 = [(ALActivityLog *)v5 strideCalData];
  *(float *)&double v14 = score;
  [(ALCLStrideCalEntry *)v13 setScore:v14];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setEndTime:a3->endTime];
  float distance = a3->distance;
  id v16 = [(ALActivityLog *)v5 strideCalData];
  *(float *)&double v17 = distance;
  [(ALCLStrideCalEntry *)v16 setDistance:v17];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setSteps:a3->steps];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setSession:a3->session];
  float speed = a3->speed;
  __int16 v19 = [(ALActivityLog *)v5 strideCalData];
  *(float *)&double v20 = speed;
  [(ALCLStrideCalEntry *)v19 setSpeed:v20];
  [(ALCLStrideCalEntry *)[(ALActivityLog *)v5 strideCalData] setRegularEntry:1];
  [[+[CLServiceVendor sharedInstance](CLServiceVendor, "sharedInstance") proxyForService:@"CLActivityLogger"] logData:v5];
}

- (void)awdMotionFitnessStrideCalibration:(const CLStrideCalEntry *)a3
{
  uint32_t v5 = arc4random_uniform(0xAu);
  uint32_t v6 = arc4random_uniform(0xAu);
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022D62E8);
  }
  long long v7 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    double startTime = a3->startTime;
    *(_DWORD *)buf = 134218752;
    double v23 = startTime;
    __int16 v24 = 1024;
    *(_DWORD *)double v25 = v5;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = v6;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = v5 == v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Trying to send track with startTime %f. a %u b %u a == b %d", buf, 0x1Eu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022D62E8);
    }
    double v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]", "%s\n", v20);
    if (v20 != (char *)buf) {
      free(v20);
    }
  }
  if (v5 == v6)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022D62E8);
    }
    v10 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      double v11 = a3->startTime;
      uint64_t v12 = *(void *)sub_1000C0B8C(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 1uLL);
      uint64_t v13 = *(void *)sub_1000C0B8C(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 0);
      *(_DWORD *)buf = 134218752;
      double v23 = v11;
      __int16 v24 = 2048;
      *(double *)double v25 = Current;
      *(_WORD *)&v25[8] = 2048;
      uint64_t v26 = v12;
      __int16 v27 = 2048;
      uint64_t v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Trying to send track with startTime %f. now %f 2 %f 1 %f", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022D62E8);
      }
      sub_1000C0B8C(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 1uLL);
      sub_1000C0B8C(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 0);
      long long v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    uint64_t fHead = self->fLastAWDTimestamps.fHeadAndSize.fHead;
    if (Current - *(double *)&self->fLastAWDTimestamps.fBuffer[8 * fHead] > 86400.0)
    {
      uint64_t fSize = self->fLastAWDTimestamps.fHeadAndSize.fSize;
      unint64_t fCapacity = self->fLastAWDTimestamps.fCapacity;
      if (fSize + fHead >= fCapacity) {
        uint64_t v17 = self->fLastAWDTimestamps.fCapacity;
      }
      else {
        uint64_t v17 = 0;
      }
      *(double *)&self->fLastAWDTimestamps.fBuffer[8 * (fSize + fHead - v17)] = Current;
      if (fCapacity <= fSize)
      {
        unint64_t v18 = fHead + 1;
        if (v18 >= fCapacity) {
          __int16 v19 = fCapacity;
        }
        else {
          __int16 v19 = 0;
        }
        self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = v18 - v19;
      }
      else
      {
        self->fLastAWDTimestamps.fHeadAndSize.uint64_t fSize = fSize + 1;
      }
      [(CMStrideCalibrationStats *)self storeLastAWDTimestamps];
    }
  }
}

- (void)loadLastAWDTimestamps
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v3 = sub_1000A6958();
  sub_1000A699C(v3, "StrideCalAWD0", &v17);
  uint64_t v4 = sub_1000A6958();
  sub_1000A699C(v4, "StrideCalAWD1", &v16);
  uint64_t fSize = self->fLastAWDTimestamps.fHeadAndSize.fSize;
  unint64_t fCapacity = self->fLastAWDTimestamps.fCapacity;
  fBuffer = self->fLastAWDTimestamps.fBuffer;
  uint64_t fHead = self->fLastAWDTimestamps.fHeadAndSize.fHead;
  if (fHead + fSize >= fCapacity) {
    uint64_t v9 = self->fLastAWDTimestamps.fCapacity;
  }
  else {
    uint64_t v9 = 0;
  }
  *(void *)&fBuffer[8 * (fHead + fSize - v9)] = v17;
  if (fCapacity <= fSize)
  {
    unint64_t v12 = fHead + 1;
    if (v12 >= fCapacity) {
      __int16 v13 = fCapacity;
    }
    else {
      __int16 v13 = 0;
    }
    LOWORD(fHead) = v12 - v13;
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = fHead;
    uint64_t fHead = (unsigned __int16)fHead;
    unsigned int v11 = fSize;
    __int16 v10 = fSize;
  }
  else
  {
    __int16 v10 = fSize + 1;
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fSize = fSize + 1;
    unsigned int v11 = (unsigned __int16)(fSize + 1);
    uint64_t fSize = (unsigned __int16)(fSize + 1);
  }
  unint64_t v14 = fHead + fSize;
  if (v14 >= fCapacity) {
    unint64_t v15 = fCapacity;
  }
  else {
    unint64_t v15 = 0;
  }
  *(void *)&fBuffer[8 * (v14 - v15)] = v16;
  if (fCapacity <= v11)
  {
    if (fHead + 1 < fCapacity) {
      LOWORD(fCapacity) = 0;
    }
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = fHead + 1 - fCapacity;
  }
  else
  {
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fSize = v10 + 1;
  }
}

- (void)storeLastAWDTimestamps
{
  uint64_t v3 = sub_1000A6958();
  self = (CMStrideCalibrationStats *)((char *)self + 112);
  uint64_t v4 = (const void *)sub_1000C0B8C((unsigned __int16 *)self, 0);
  sub_10016332C(v3, "StrideCalAWD0", v4);
  uint64_t v5 = sub_1000A6958();
  uint32_t v6 = (const void *)sub_1000C0B8C((unsigned __int16 *)self, 1uLL);

  sub_10016332C(v5, "StrideCalAWD1", v6);
}

- (void)updateUserHeight:(int64_t)a3
{
  self->fHeightCM = a3;
}

- (id).cxx_construct
{
  *(void *)&self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = 0x200000000;
  return self;
}

@end