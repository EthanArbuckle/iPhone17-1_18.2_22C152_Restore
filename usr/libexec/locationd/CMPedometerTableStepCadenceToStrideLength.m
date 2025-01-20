@interface CMPedometerTableStepCadenceToStrideLength
+ (id)sharedInstance;
- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForStepCadence:(double)a3;
- (BOOL)isBinaryLogging;
- (BOOL)isCalibrationAvailableForStepCadence:(double)a3;
- (BOOL)isRunCalibrationAvailable;
- (BOOL)isStepCadenceValid:(double)a3;
- (BOOL)isWalkCalibrationAvailable;
- (CMPedometerTableStepCadenceToStrideLength)initWithTestMode:(BOOL)a3;
- (double)strideLengthForStepCadence:(double)a3;
- (void)binsDidChange;
- (void)logBins;
- (void)setUserHeight:(float)a3;
- (void)updateBinsWithTrack:(id)a3;
- (void)updateStrideLengthRun;
- (void)updateStrideLengthStepCadenceWalk;
@end

@implementation CMPedometerTableStepCadenceToStrideLength

- (BOOL)isCalibrationAvailableForStepCadence:(double)a3
{
  if ([(CMPedometerTable *)self isValueInRun:a3])
  {
    return [(CMPedometerTable *)self isRunNativeValueOutAvailable];
  }
  else
  {
    return [(CMPedometerTable *)self isWalkNativeValueOutAvailable];
  }
}

+ (id)sharedInstance
{
  if (qword_102487920 != -1) {
    dispatch_once(&qword_102487920, &stru_102324260);
  }
  return (id)qword_102487918;
}

- (BOOL)isBinaryLogging
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102487910, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_102487910))
  {
    unsigned __int8 v3 = 0;
    sub_10006ACBC((unsigned __int8 *)&unk_102487908, "LogBinaryPedometerCalibrationTables", &v3, 0);
    __cxa_guard_release(&qword_102487910);
  }
  return byte_102487909;
}

- (CMPedometerTableStepCadenceToStrideLength)initWithTestMode:(BOOL)a3
{
  BOOL v3 = a3;
  v11 = 0;
  v12 = 0;
  uint64_t v13 = 0;
  sub_1001DD364(&v11, (const void *)qword_1024878D8, qword_1024878E0, (qword_1024878E0 - qword_1024878D8) >> 3);
  __p = 0;
  v9 = 0;
  uint64_t v10 = 0;
  sub_1001DD364(&__p, (const void *)qword_1024878F0, qword_1024878F8, (qword_1024878F8 - qword_1024878F0) >> 3);
  v7.receiver = self;
  v7.super_class = (Class)CMPedometerTableStepCadenceToStrideLength;
  v5 = [(CMPedometerTable *)&v7 initWithTableName:@"StepCadenceToStrideLengthTable" valueInName:@"StepCadence" valueOutName:@"StrideLength" defaultValue:&v11 binBoundariesWalk:&__p binBoundariesRun:v3 testMode:0.705500007];
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  if (v11)
  {
    v12 = v11;
    operator delete(v11);
  }
  if (v5)
  {
    self->_userHeight = 1.7;
    [(CMPedometerTableStepCadenceToStrideLength *)self updateStrideLengthRun];
    [(CMPedometerTableStepCadenceToStrideLength *)self updateStrideLengthStepCadenceWalk];
  }
  return self;
}

- (void)logBins
{
  id v3 = [[-[CMPedometerTable description](self, "description") componentsSeparatedByCharactersInSet:+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet")];
  id v4 = [(CMPedometerTable *)self copyBins];
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1013E7E70;
    v5[3] = &unk_10230DC30;
    v5[4] = v3;
    v5[5] = self;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)binsDidChange
{
  if (![(CMPedometerTable *)self testMode])
  {
    [objc_msgSend(objc_msgSend(objc_msgSend((id)sub_1000D5BCC(), "vendor"), "proxyForService:", @"CLMotionSyncStore"), "doAsync:", &stru_102324280);
    v2 = *(void (**)(void))(*(void *)(sub_1000D2E34(0) + 56) + 40);
    v2();
  }
}

- (void)updateBinsWithTrack:(id)a3
{
  [a3 distanceGps];
  double v6 = v5;
  [a3 steps];
  double v8 = v6 / v7;
  [a3 steps];
  double v10 = v9;
  [objc_msgSend(a3, "stop") timeIntervalSinceReferenceDate];
  double v12 = v11;
  [objc_msgSend(a3, "start") timeIntervalSinceReferenceDate];
  double v14 = v10 / (v12 - v13);
  [a3 distanceGps];
  double v16 = v15 / 400.0;
  if (v16 <= 1.0) {
    double v17 = v16 * 0.4;
  }
  else {
    double v17 = 0.4;
  }
  [(CMPedometerTable *)self updateBinsWithValueOut:v8 valueIn:v14 alpha:v17];
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1023242A0);
  }
  v18 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    id v21 = [@"StepCadenceToStrideLengthTable" UTF8String];
    __int16 v22 = 2080;
    id v23 = [@"StepCadence" UTF8String];
    __int16 v24 = 2048;
    double v25 = v14;
    __int16 v26 = 2080;
    id v27 = [@"StrideLength" UTF8String];
    __int16 v28 = 2048;
    double v29 = v8;
    __int16 v30 = 2048;
    double v31 = v17;
    __int16 v32 = 2080;
    id v33 = [[objc_msgSend(a3, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s", buf, 0x48u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1023242A0);
    }
    [@"StepCadenceToStrideLengthTable" UTF8String];
    [@"StepCadence" UTF8String];
    [@"StrideLength" UTF8String];
    [objc_msgSend(a3, "description") UTF8String];
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMPedometerTableStepCadenceToStrideLength updateBinsWithTrack:]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  if ([(CMPedometerTable *)self isValueInRun:v14]) {
    [(CMPedometerTableStepCadenceToStrideLength *)self updateStrideLengthRun];
  }
  else {
    [(CMPedometerTableStepCadenceToStrideLength *)self updateStrideLengthStepCadenceWalk];
  }
}

- (BOOL)isWalkCalibrationAvailable
{
  return [(CMPedometerTable *)self isWalkNativeValueOutAvailable];
}

- (BOOL)isRunCalibrationAvailable
{
  return [(CMPedometerTable *)self isRunNativeValueOutAvailable];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForStepCadence:(double)a3
{
  [(CMPedometerTable *)self binIntervalForValueIn:a3];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (double)strideLengthForStepCadence:(double)a3
{
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:")) {
    return self->_strideLengthRun;
  }

  [(CMPedometerTable *)self valueOutForValueIn:a3];
  return result;
}

- (BOOL)isStepCadenceValid:(double)a3
{
  return [(CMPedometerTable *)self isValueInValid:a3];
}

- (void)setUserHeight:(float)a3
{
  if (self->_userHeight != a3)
  {
    self->_userHeight = a3;
    id v15 = [(CMPedometerTable *)self copyBins];
    id v4 = [v15 count];
    if (v4)
    {
      id v5 = v4;
      unint64_t v6 = 0;
      double v7 = v15;
      do
      {
        id v8 = [v7 objectAtIndexedSubscript:v6];
        if (![v8 state])
        {
          double v9 = (float)(self->_userHeight * flt_101DB6190[v6 < [(CMPedometerTable *)self walkBinCount]]);
          id v10 = objc_alloc((Class)CMPedometerBin);
          [v8 begin];
          double v12 = v11;
          [v8 end];
          id v14 = [v10 initWithValueOut:objc_msgSend(v8, "state") begin:v9 end:v12 state:v13];
        }
        ++v6;
        double v7 = v15;
      }
      while (v5 != (id)v6);
      [(CMPedometerTable *)self setBins:v15];
      [(CMPedometerTableStepCadenceToStrideLength *)self updateStrideLengthRun];
      [(CMPedometerTableStepCadenceToStrideLength *)self updateStrideLengthStepCadenceWalk];
    }
  }
}

- (void)updateStrideLengthRun
{
  id v3 = [(CMPedometerTable *)self copyBins];
  id v4 = [v3 count];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = [(CMPedometerTable *)self walkBinCount];
    if (v6 >= (unint64_t)v5) {
      goto LABEL_9;
    }
    unint64_t v7 = v6;
    int v8 = 0;
    double v9 = 0.0;
    do
    {
      id v10 = [v3 objectAtIndexedSubscript:v7];
      if ((uint64_t)[v10 state] >= 11)
      {
        [v10 valueOut];
        double v9 = v9 + v11;
        ++v8;
      }
      ++v7;
    }
    while (v5 != (id)v7);
    if (v8 <= 0) {
LABEL_9:
    }
      double v12 = (float)(self->_userHeight * 0.585);
    else {
      double v12 = v9 / (double)v8;
    }
    self->_double strideLengthRun = v12;
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1023242A0);
    }
    double v13 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [@"StepCadenceToStrideLengthTable" UTF8String];
      id v15 = [@"StrideLength" UTF8String];
      double strideLengthRun = self->_strideLengthRun;
      *(_DWORD *)buf = 136315650;
      id v19 = v14;
      __int16 v20 = 2080;
      id v21 = v15;
      __int16 v22 = 2048;
      double v23 = strideLengthRun;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s,%sRun,%0.4f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1023242A0);
      }
      [@"StepCadenceToStrideLengthTable" UTF8String];
      [@"StrideLength" UTF8String];
      double v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
}

- (void)updateStrideLengthStepCadenceWalk
{
  id v3 = [(CMPedometerTable *)self copyBins];
  if ([v3 count])
  {
    if (![(CMPedometerTable *)self walkBinCount]) {
      goto LABEL_11;
    }
    unint64_t v4 = 0;
    id v5 = 0;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      id v8 = [v3 objectAtIndexedSubscript:v4];
      if ((uint64_t)[v8 state] >= 11)
      {
        [v8 begin];
        if (v9 >= 1.16666663)
        {
          [v8 end];
          if (v10 <= 2.16666675 && (uint64_t)[v8 state] >= (uint64_t)v5)
          {
            [v8 valueOut];
            double v6 = v11;
            [v8 center];
            double v7 = v12;
            id v5 = [v8 state];
          }
        }
      }
      ++v4;
    }
    while (v4 < [(CMPedometerTable *)self walkBinCount]);
    if (!v5)
    {
LABEL_11:
      double v6 = (float)(self->_userHeight * 0.415);
      double v7 = 1.83333337;
    }
    float v13 = v6;
    p_strideLengthStepCadencePairWalk = &self->_strideLengthStepCadencePairWalk;
    float v15 = v7;
    self->_strideLengthStepCadencePairWalk.double strideLength = v13;
    self->_strideLengthStepCadencePairWalk.double stepCadence = v15;
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1023242A0);
    }
    double v16 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [@"StepCadenceToStrideLengthTable" UTF8String];
      id v18 = [@"StrideLength" UTF8String];
      double strideLength = p_strideLengthStepCadencePairWalk->strideLength;
      id v20 = [@"StepCadence" UTF8String];
      double stepCadence = p_strideLengthStepCadencePairWalk->stepCadence;
      *(_DWORD *)buf = 136316162;
      id v24 = v17;
      __int16 v25 = 2080;
      id v26 = v18;
      __int16 v27 = 2048;
      double v28 = strideLength;
      __int16 v29 = 2080;
      id v30 = v20;
      __int16 v31 = 2048;
      double v32 = stepCadence;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s,%sWalk,%0.4f,%sWalk,%0.4f", buf, 0x34u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1023242A0);
      }
      [@"StepCadenceToStrideLengthTable" UTF8String];
      [@"StrideLength" UTF8String];
      [@"StepCadence" UTF8String];
      __int16 v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
  }
}

@end